import 'package:flutter/material.dart';
import 'package:sample_project/routes/app_route.dart';
import 'package:sample_project/utils/app_images.dart';
import 'package:sample_project/utils/colors.dart';
import 'package:sample_project/utils/constants.dart';
import 'package:sample_project/utils/secure_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    getInitialData();
    super.initState();
  }

  Future<void> getInitialData() async {
    bool isFirstTime = await StorageService().isFirstTime();
    print("IsFirstTime>>>>$isFirstTime");

    if (!isFirstTime) {
      String? userId = await StorageService().readSecureData(Constants.userId);
      if (userId != null) {
        Future.delayed(const Duration(milliseconds: 3500)).then((value) {
          Navigator.pushNamedAndRemoveUntil(context, AppRoute.homePageRoute, (route) => false);
        });
      } else {
        Future.delayed(const Duration(milliseconds: 3500)).then((value) {
          Navigator.pushNamedAndRemoveUntil(context, AppRoute.loginRoute, (route) => false);
        });
      }
    } else {
      Future.delayed(const Duration(milliseconds: 3500)).then((value) {
        Navigator.pushNamedAndRemoveUntil(context, AppRoute.welcomePageRoute, (route) => false);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Stack(
        children: [
          Center(
            child: Image.asset(AppImages.splashIcon),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Image.asset(AppImages.splashTopIcon),
          )
        ],
      ),
    );
  }
}
