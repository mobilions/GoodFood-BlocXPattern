import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_project/config/size_config.dart';
import 'package:sample_project/routes/app_route.dart';
import 'package:sample_project/screens/home/repository/home_repository.dart';
import 'package:sample_project/screens/home/repository/home_service.dart';
import 'package:sample_project/screens/login/bloc/login_bloc.dart';
import 'package:sample_project/screens/login/repository/login_repository.dart';
import 'package:sample_project/screens/login/repository/login_service.dart';
import 'package:sample_project/screens/registration/bloc/registration_bloc.dart';
import 'package:sample_project/screens/registration/repository/registration_repository.dart';
import 'package:sample_project/screens/registration/repository/registration_service.dart';

Future<void> main() async {
  runApp(const MyApp());
}

GlobalKey<NavigatorState> navState = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => LoginRepository(
            LoginService(),
          ),
        ),
        RepositoryProvider(
          create: (context) => RegistrationRepository(
            RegistrationService(),
          ),
        ),
        RepositoryProvider(
          create: (context) => HomeRepository(
            HomeService(),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LoginBloc(
              loginRepository: context.read<LoginRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => RegistrationBloc(
              registrationRepository: context.read<RegistrationRepository>(),
            ),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Good Foods',
          navigatorKey: navState,
          onGenerateRoute: AppRoute.generateRoute,
        ),
      ),
    );
  }
}
