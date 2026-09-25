import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/models/models.dart';
import '../providers/session_provider.dart';
part 'auth_form_viewmodel.g.dart';

class AuthFormState {
  const AuthFormState({
    this.fields = const {},
    this.fieldErrors = const {},
    this.isSubmitting = false,
    this.validating = false,
    this.validation,
    this.error,
  });
  final Map<String, String> fields, fieldErrors;
  final bool isSubmitting, validating;
  final PasswordValidationResult? validation;
  final String? error;
  AuthFormState copy({
    Map<String, String>? fields,
    Map<String, String>? fieldErrors,
    bool? isSubmitting,
    bool? validating,
    PasswordValidationResult? validation,
    String? error,
    bool clearValidation = false,
  }) => AuthFormState(
    fields: fields ?? this.fields,
    fieldErrors: fieldErrors ?? this.fieldErrors,
    isSubmitting: isSubmitting ?? this.isSubmitting,
    validating: validating ?? this.validating,
    validation: clearValidation ? null : validation ?? this.validation,
    error: error,
  );
}

@riverpod
class AuthForm extends _$AuthForm {
  Timer? _timer;
  int _version = 0;
  @override
  AuthFormState build(bool registration) {
    ref.onDispose(() => _timer?.cancel());
    return const AuthFormState(
      fieldErrors: {
        'email': 'Introduce un correo electrónico válido.',
        'password': 'Este campo es obligatorio.',
      },
    );
  }

  Map<String, String> _errors(Map<String, String> fields) {
    final errors = <String, String>{};
    if (!RegExp(
      r'^[^\s@]+@[^\s@]+\.[^\s@]+$',
    ).hasMatch((fields['email'] ?? '').trim())) {
      errors['email'] = 'Introduce un correo electrónico válido.';
    }
    if ((fields['password'] ?? '').isEmpty) {
      errors['password'] = 'Este campo es obligatorio.';
    }
    if (registration) {
      final username = fields['username'] ?? '';
      if (username.isEmpty ||
          username.length > 150 ||
          !RegExp(r'^[\w.@+-]+$').hasMatch(username)) {
        errors['username'] = 'Usa hasta 150 letras, números o . @ + - _.';
      }
      if (fields['password'] != fields['password2']) {
        errors['password2'] = 'Las contraseñas no coinciden.';
      }
    }
    return errors;
  }

  void update(Map<String, String> fields) {
    if (state.isSubmitting) return;
    state = state.copy(
      fields: Map.unmodifiable(fields),
      fieldErrors: _errors(fields),
    );
  }

  bool get canSubmit =>
      !state.isSubmitting &&
      !state.validating &&
      state.fieldErrors.isEmpty &&
      (!registration || state.validation?.isValid == true);
  void passwordChanged(String value) {
    _timer?.cancel();
    final version = ++_version;
    state = state.copy(validating: true, clearValidation: true);
    _timer = Timer(const Duration(milliseconds: 500), () async {
      final result = await ref.read(validatePasswordUseCaseProvider)(value);
      if (ref.mounted && version == _version) {
        state = state.copy(validation: result, validating: false);
      }
    });
  }

  Future<bool> submit() async {
    if (!canSubmit) return false;
    final fields = state.fields;
    state = state.copy(isSubmitting: true);
    try {
      final session = ref.read(sessionProvider.notifier);
      if (registration) {
        await session.register(
          RegisterCredentials(
            username: fields['username']!.trim(),
            email: fields['email']!.trim(),
            password: fields['password']!,
            firstName: (fields['firstName'] ?? '').trim(),
            lastName: (fields['lastName'] ?? '').trim(),
          ),
        );
      } else {
        await session.login(fields['email']!, fields['password']!);
      }
      if (!ref.mounted) return false;
      state = state.copy(isSubmitting: false);
      return ref.read(sessionProvider).value != null;
    } catch (e) {
      if (ref.mounted) {
        state = state.copy(isSubmitting: false, error: e.toString());
      }
      return false;
    }
  }
}
