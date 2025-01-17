part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

class LoginUserEvent extends LoginEvent {
  final String username;
  final String password;
  final BuildContext context;

  const LoginUserEvent({
    required this.username,
    required this.password,
    required this.context,
  });

  @override
  List<Object?> get props => [username, password, context];
}

class NavigateRegisterScreenEvent extends LoginEvent {
  final BuildContext context;
  final Widget destination;

  const NavigateRegisterScreenEvent({
    required this.context,
    required this.destination,
  });

  @override
  List<Object?> get props => [context, destination];
}
