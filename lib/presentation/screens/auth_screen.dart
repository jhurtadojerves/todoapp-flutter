import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../viewmodels/auth_form_viewmodel.dart';
import '../widgets/common.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key, this.register = false});
  final bool register;
  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  final form = GlobalKey<FormState>();
  final email = TextEditingController(),
      password = TextEditingController(),
      password2 = TextEditingController(),
      username = TextEditingController(),
      firstName = TextEditingController(),
      lastName = TextEditingController();
  @override
  void dispose() {
    for (final c in [
      email,
      password,
      password2,
      username,
      firstName,
      lastName,
    ]) {
      c.dispose();
    }
    super.dispose();
  }

  void update([String? value]) =>
      ref.read(authFormProvider(widget.register).notifier).update({
        'email': email.text,
        'password': password.text,
        'password2': password2.text,
        'username': username.text,
        'firstName': firstName.text,
        'lastName': lastName.text,
      });
  Future<void> submit() async {
    if (!form.currentState!.validate()) return;
    update();
    if (await ref.read(authFormProvider(widget.register).notifier).submit() &&
        mounted) {
      context.go('/users');
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authFormProvider(widget.register));
    return AppScaffold(
      title: widget.register ? 'Registro' : 'Acceder',
      fallback: widget.register ? '/boards' : null,
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Form(
            key: form,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (widget.register) ...[
                  AppInput(
                    label: 'Nombre de usuario',
                    controller: username,
                    onChanged: update,
                    validator: (v) =>
                        v != null &&
                            v.isNotEmpty &&
                            v.length <= 150 &&
                            RegExp(r'^[\w.@+-]+$').hasMatch(v)
                        ? null
                        : 'Usa hasta 150 letras, números o . @ + - _.',
                  ),
                  AppInput(
                    label: 'Nombre',
                    controller: firstName,
                    onChanged: update,
                  ),
                  AppInput(
                    label: 'Apellido',
                    controller: lastName,
                    onChanged: update,
                  ),
                ],
                AppInput(
                  label: 'Correo electrónico',
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  validator: emailValidator,
                  onChanged: update,
                ),
                AppInput(
                  label: 'Contraseña',
                  controller: password,
                  obscure: true,
                  validator: requiredText,
                  onChanged: (value) {
                    update();
                    if (widget.register) {
                      ref
                          .read(authFormProvider(true).notifier)
                          .passwordChanged(value);
                    }
                  },
                ),
                if (widget.register) ...[
                  AppInput(
                    label: 'Confirmar contraseña',
                    controller: password2,
                    obscure: true,
                    validator: (v) => v == password.text
                        ? null
                        : 'Las contraseñas no coinciden.',
                    onChanged: update,
                  ),
                  if (state.validating) const Text('Validando contraseña…'),
                  ...?state.validation?.errors.map(
                    (e) => Text(
                      e,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                  ),
                ],
                if (state.error != null)
                  Text(
                    state.error!,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                AppButton(
                  widget.register ? 'Registrarse' : 'Acceder',
                  busy: state.isSubmitting,
                  onPressed:
                      widget.register &&
                          (state.validating ||
                              state.validation?.isValid != true)
                      ? null
                      : submit,
                ),
                if (!widget.register)
                  TextButton(
                    onPressed: () => context.push('/register'),
                    child: const Text('Crear cuenta'),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
