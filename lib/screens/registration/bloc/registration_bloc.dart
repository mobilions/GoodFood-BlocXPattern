import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_project/screens/registration/bloc/registration_event.dart';
import 'package:sample_project/screens/registration/bloc/registration_state.dart';
import 'package:sample_project/screens/registration/repository/registration_repository.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  late RegistrationRepository registrationRepository;

  RegistrationBloc({required this.registrationRepository}) : super(RegistrationInitial()) {
    on((RegistrationButtonPressed event, Emitter emit) => registration(event, emit));
  }

  Future<void> registration(RegistrationButtonPressed event, Emitter emit) async {
    emit(RegistrationLoading());

    emit(RegistrationSuccess());
  }
}
