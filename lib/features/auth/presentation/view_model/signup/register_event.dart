part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class LoadImage extends RegisterEvent {
  final File file;

  const LoadImage({
    required this.file,
  });
}

class RegisterUser extends RegisterEvent {
  final BuildContext context;
  final String email;
  final String? image;
  final String username;
  final String password;
  final String confirmpassword;

  const RegisterUser({
    required this.context,
    required this.email,
    required this.username,
    required this.password,
    required this.confirmpassword,
    this.image,
  });

  @override
  List<Object> get props => [context, email, username, password, confirmpassword, image ?? ''];
}
