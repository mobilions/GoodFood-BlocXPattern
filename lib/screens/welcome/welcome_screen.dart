import 'package:flutter/material.dart';
import 'package:sample_project/config/app_fonts.dart';
import 'package:sample_project/config/size_config.dart';
import 'package:sample_project/routes/app_route.dart';
import 'package:sample_project/utils/app_images.dart';
import 'package:sample_project/utils/colors.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                AppImages.welcomeBackground,
              ),
              fit: BoxFit.fill,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(30),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(26),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: 32,
                    // height: getProportionateScreenHeight(32),
                    width: getProportionateScreenWidth(55),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        getProportionateScreenWidth(27.4),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Skip",
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontFamily: AppFonts.font400,
                          fontSize: getProportionalFontSize(14),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(102),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Welcome to",
                    style: TextStyle(
                        fontSize: getProportionalFontSize(53),
                        fontFamily: AppFonts.font700,
                        height: getProportionateScreenHeight(1),
                        shadows: [
                          Shadow(
                            offset: const Offset(0.0, 5.0), //position of shadow
                            blurRadius: 6.0, //blur intensity of shadow
                            color: Colors.black.withOpacity(0.4), //color of shadow with opacity
                          ),
                        ]),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Good Foods",
                    style: TextStyle(
                        fontSize: getProportionalFontSize(45),
                        fontFamily: AppFonts.font700,
                        color: const Color(0xFFFE724C),
                        height: getProportionateScreenHeight(1.2),
                        shadows: [
                          Shadow(
                            offset: const Offset(0.0, 5.0), //position of shadow
                            blurRadius: 6.0, //blur intensity of shadow
                            color: Colors.black.withOpacity(0.4), //color of shadow with opacity
                          ),
                        ]),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Your favourite foods delivered fast at \norder now.",
                    style: TextStyle(
                      fontSize: getProportionalFontSize(18),
                      fontFamily: AppFonts.font400,
                      color: const Color(0xFF30384F),
                    ),
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.white,
                        thickness: .8,
                        endIndent: getProportionateScreenWidth(22),
                      ),
                    ),
                    Text(
                      "sign in with",
                      style: TextStyle(
                          fontSize: getProportionalFontSize(16), fontFamily: AppFonts.font400, color: Colors.white),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.white,
                        thickness: .8,
                        indent: getProportionateScreenWidth(22),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(15),
                ),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: getProportionateScreenWidth(139),
                          padding: EdgeInsets.only(
                            top: getProportionateScreenHeight(13),
                            bottom: getProportionateScreenHeight(13),
                            left: getProportionateScreenWidth(12),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              getProportionateScreenWidth(27.4),
                            ),
                          ),
                          child: Row(
                            children: [
                              Image.asset(AppImages.facebook),
                              SizedBox(
                                width: getProportionateScreenWidth(10),
                              ),
                              Text(
                                "FACEBOOK",
                                style: TextStyle(fontSize: getProportionalFontSize(13), fontFamily: AppFonts.font500),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(35),
                    ),
                    Expanded(
                      child: Container(
                        width: getProportionateScreenWidth(139),
                        padding: EdgeInsets.only(
                          top: getProportionateScreenHeight(13),
                          bottom: getProportionateScreenHeight(13),
                          left: getProportionateScreenWidth(12),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            getProportionateScreenWidth(27.4),
                          ),
                        ),
                        child: Row(
                          children: [
                            Image.asset(AppImages.google),
                            SizedBox(
                              width: getProportionateScreenWidth(10),
                            ),
                            Text(
                              "GOOGLE",
                              style: TextStyle(fontSize: getProportionalFontSize(13), fontFamily: AppFonts.font500),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(23),
                ),
                SizedBox(
                  // height: getProportionateScreenHeight(54),
                  height: 54,
                  width: getProportionateScreenWidth(315),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoute.createAccRoute);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white.withOpacity(.21),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          getProportionateScreenWidth(30),
                        ),
                      ),
                      side: const BorderSide(color: Colors.white),
                    ),
                    child: Text(
                      "Start with email or phone",
                      style: TextStyle(
                          fontSize: getProportionalFontSize(17), fontFamily: AppFonts.font500, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(25),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                          fontSize: getProportionalFontSize(16), fontFamily: AppFonts.font400, color: Colors.white),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(2),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoute.loginRoute);
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            fontSize: getProportionalFontSize(16),
                            fontFamily: AppFonts.font500,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white,
                            height: 1,
                            color: Colors.white),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
