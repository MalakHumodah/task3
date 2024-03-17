import 'package:equatable/equatable.dart';

enum LoginPageState { initial, success, error,loading }

class LoginState extends Equatable {
  final bool passwordIcon;
  final LoginPageState loginPageState;

  const LoginState({
    this.passwordIcon = true,
    this.loginPageState = LoginPageState.initial,
  });

  LoginState copyWith({bool? passwordIcon, LoginPageState? loginPageState}) {
    return LoginState(
      passwordIcon: passwordIcon ?? this.passwordIcon,
      loginPageState: loginPageState ?? this.loginPageState,
    );
  }

  @override
  List<Object?> get props => [
        passwordIcon,
        loginPageState,
      ];
}
