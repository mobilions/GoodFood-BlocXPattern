import 'package:sample_project/screens/registration/repository/registration_service.dart';

class RegistrationRepository {
  final RegistrationService registrationService;
  RegistrationRepository(this.registrationService);

  Future<Map<String, dynamic>> registration(String name, email, password) async {
    Map<String, dynamic> data = await registrationService.registrationMethod(name, email, password);

    return data;
  }
}
