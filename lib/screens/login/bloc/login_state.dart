import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();
  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFailed extends LoginState {
  final String error;
  const LoginFailed(this.error);
}

class LoginStater2 extends Equatable {
  final String? error;
  const LoginStater2({this.error});

  factory LoginStater2.init() => const LoginStater2(error: "");

  @override
  List<Object?> get props => [error];

  LoginStater2 copyWith({String? error}) {
    return LoginStater2(error: error ?? this.error);
  }
}
