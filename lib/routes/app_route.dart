import 'package:flutter/material.dart';
import 'package:sample_project/screens/home/home_screen.dart';
import 'package:sample_project/screens/login/login_screen.dart';
import 'package:sample_project/screens/welcome/welcome_screen.dart';

import '../screens/registration/registration_screen.dart';
import '../screens/splash/splash_screen.dart';

class AppRoute {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String createAccRoute = "/createAcc";
  static const String homePageRoute = "/homePage";
  static const String welcomePageRoute = "/welcomePage";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case welcomePageRoute:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());

      case loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      //
      case createAccRoute:
        return MaterialPageRoute(builder: (_) => const RegistrationScreen());
      //
      case homePageRoute:
        return MaterialPageRoute(builder: (_) => HomeScreen());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
