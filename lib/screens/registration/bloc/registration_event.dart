import 'package:equatable/equatable.dart';

abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  @override
  List<Object?> get props => [];
}

class RegistrationButtonPressed extends RegistrationEvent {
  final String name;
  final String email;
  final String password;

  const RegistrationButtonPressed(
      {required this.name, required this.email, required this.password});
}
