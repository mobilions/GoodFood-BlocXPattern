import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_project/screens/login/bloc/login_event.dart';
import 'package:sample_project/screens/login/bloc/login_state.dart';
import 'package:sample_project/screens/login/repository/login_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  late LoginRepository loginRepository;

  LoginBloc({required this.loginRepository}) : super(LoginInitial()) {
    on((LoginButtonPressed event, Emitter emit) => login(event, emit));
  }
  Future<void> login(LoginButtonPressed event, Emitter emit) async {
    emit(LoginLoading());

    emit(LoginSuccess());
  }
}
