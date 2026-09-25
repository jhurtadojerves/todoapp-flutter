// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_form_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AuthForm)
final authFormProvider = AuthFormFamily._();

final class AuthFormProvider
    extends $NotifierProvider<AuthForm, AuthFormState> {
  AuthFormProvider._({
    required AuthFormFamily super.from,
    required bool super.argument,
  }) : super(
         retry: null,
         name: r'authFormProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$authFormHash();

  @override
  String toString() {
    return r'authFormProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  AuthForm create() => AuthForm();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthFormState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthFormState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is AuthFormProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$authFormHash() => r'81dc39d6c2453448926d14bcc9a01c8d2af9a60d';

final class AuthFormFamily extends $Family
    with
        $ClassFamilyOverride<
          AuthForm,
          AuthFormState,
          AuthFormState,
          AuthFormState,
          bool
        > {
  AuthFormFamily._()
    : super(
        retry: null,
        name: r'authFormProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  AuthFormProvider call(bool registration) =>
      AuthFormProvider._(argument: registration, from: this);

  @override
  String toString() => r'authFormProvider';
}

abstract class _$AuthForm extends $Notifier<AuthFormState> {
  late final _$args = ref.$arg as bool;
  bool get registration => _$args;

  AuthFormState build(bool registration);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AuthFormState, AuthFormState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AuthFormState, AuthFormState>,
              AuthFormState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}
