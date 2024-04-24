import 'package:sample_project/screens/login/repository/login_service.dart';

class LoginRepository {
  final LoginService loginService;
  LoginRepository(this.loginService);

  Future<Map<String, dynamic>> login(String email, password) async {
    Map<String, dynamic> data = await loginService.loginMethod(email, password);

    return data;
  }
}
