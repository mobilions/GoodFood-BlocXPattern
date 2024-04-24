import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_project/config/app_fonts.dart';
import 'package:sample_project/config/size_config.dart';
import 'package:sample_project/routes/app_route.dart';
import 'package:sample_project/screens/login/bloc/login_bloc.dart';
import 'package:sample_project/screens/login/bloc/login_event.dart';
import 'package:sample_project/screens/login/bloc/login_state.dart';
import 'package:sample_project/screens/login/repository/login_repository.dart';
import 'package:sample_project/utils/app_images.dart';
import 'package:sample_project/utils/colors.dart';
import 'package:sample_project/utils/loader.dart';
import 'package:sample_project/utils/utils.dart';
import 'package:sample_project/widgets/common_button.dart';
import 'package:sample_project/widgets/common_text_field.dart';

import '../../utils/validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginRepository loginRepository;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isObscure = true;

  @override
  void initState() {
    loginRepository = context.read<LoginRepository>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginLoading) {
            LoadingDialog.showLoader();
          } else if (state is LoginFailed) {
            LoadingDialog.hideLoader();
            Utils.showToast(state.error);
          } else if (state is LoginSuccess) {
            Navigator.pushNamedAndRemoveUntil(context, AppRoute.homePageRoute, (route) => false);
          }
        },
        child: SafeArea(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.asset(AppImages.topLeftCircle),
                    Image.asset(AppImages.topLeftBigCircle),
                    Align(
                      alignment: Alignment.topRight,
                      child: Image.asset(AppImages.topRightCircle),
                    ),
                    // Padding(
                    //   padding: EdgeInsets.only(
                    //     left: getProportionateScreenWidth(10),
                    //     top: getProportionateScreenHeight(27),
                    //   ),
                    //   child: GestureDetector(
                    //       onTap: () {
                    //         Navigator.pop(context);
                    //       },
                    //       child: Image.asset(
                    //         AppImages.topBackIcon,
                    //       )),
                    // ),
                  ],
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(26),
                      ),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontSize: getProportionalFontSize(36),
                                fontFamily: AppFonts.font500,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(21),
                          ),
                          CommonTextField(
                            lable: "E-mail",
                            hintText: "Your email or phone",
                            textEditingController: emailController,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) => Validation.requiredValidation(
                              value,
                              "Email",
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(19),
                          ),
                          CommonTextField(
                            lable: "Password",
                            hintText: "Password",
                            obscure: isObscure,
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.visiblePassword,
                            textEditingController: passwordController,
                            suffix: IconButton(
                              color: Color(0xFFD0D2D1),
                              padding: EdgeInsets.only(
                                right: getProportionateScreenWidth(14),
                                left: getProportionateScreenWidth(8),
                              ),
                              onPressed: () {
                                isObscure = !isObscure;
                                setState(() {});
                              },
                              icon: isObscure
                                  ? Icon(
                                      Icons.visibility,
                                      color: Colors.white,
                                    )
                                  : Icon(
                                      Icons.visibility_off,
                                      color: Colors.white70,
                                    ),
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(5),
                          ),
                          TextButton(
                            onPressed: () {
                              // Get.toNamed(Routes.RESETPASSWORD);
                            },
                            child: Text(
                              "Forgot password?",
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: getProportionalFontSize(14),
                                fontFamily: AppFonts.font500,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(5),
                          ),
                          PrimaryButton(
                            text: "LOGIN",
                            onPressed: () {
                              // if (formKey.currentState!.validate()) {
                              FocusManager.instance.primaryFocus?.unfocus();
                              BlocProvider.of<LoginBloc>(context).add(
                                LoginButtonPressed(email: emailController.text, password: passwordController.text),
                              );
                              // }
                            },
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(10),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don’t have an account? ",
                                style: TextStyle(
                                  color: Color(0xFF5B5B5E),
                                  fontFamily: AppFonts.font500,
                                  fontSize: getProportionalFontSize(14),
                                ),
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    alignment: Alignment.centerLeft,
                                    foregroundColor: Colors.white),
                                onPressed: () {
                                  Navigator.pushNamed(context, AppRoute.createAccRoute);
                                },
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontFamily: AppFonts.font500,
                                    fontSize: getProportionalFontSize(14),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(25),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  color: Color(0xFFB3B3B3).withOpacity(0.50),
                                  thickness: .8,
                                  endIndent: getProportionateScreenWidth(22),
                                ),
                              ),
                              Text(
                                "sign in with",
                                style: TextStyle(
                                  fontSize: getProportionalFontSize(16),
                                  fontFamily: AppFonts.font400,
                                  color: Color(0xFF5B5B5E),
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  color: Color(0xFFB3B3B3).withOpacity(0.50),
                                  thickness: .8,
                                  indent: getProportionateScreenWidth(22),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(13),
                          ),
                          Row(
                            children: [
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
                                    boxShadow: [
                                      BoxShadow(color: Colors.black38, blurRadius: 2, offset: Offset(0.0, 2.0))
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      Image.asset(AppImages.facebook),
                                      SizedBox(
                                        width: getProportionateScreenWidth(10),
                                      ),
                                      Text(
                                        "FACEBOOK",
                                        style: TextStyle(
                                            fontSize: getProportionalFontSize(13), fontFamily: AppFonts.font500),
                                      ),
                                    ],
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
                                    boxShadow: [
                                      BoxShadow(color: Colors.black38, blurRadius: 2, offset: Offset(0.0, 2.0))
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      Image.asset(AppImages.google),
                                      SizedBox(
                                        width: getProportionateScreenWidth(10),
                                      ),
                                      Text(
                                        "GOOGLE",
                                        style: TextStyle(
                                            fontSize: getProportionalFontSize(13), fontFamily: AppFonts.font500),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(10),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
