import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_project/config/app_fonts.dart';
import 'package:sample_project/config/size_config.dart';
import 'package:sample_project/routes/app_route.dart';
import 'package:sample_project/screens/registration/bloc/registration_bloc.dart';
import 'package:sample_project/screens/registration/bloc/registration_event.dart';
import 'package:sample_project/screens/registration/bloc/registration_state.dart';
import 'package:sample_project/screens/registration/repository/registration_repository.dart';
import 'package:sample_project/utils/app_images.dart';
import 'package:sample_project/utils/colors.dart';
import 'package:sample_project/utils/loader.dart';
import 'package:sample_project/utils/utils.dart';
import 'package:sample_project/widgets/common_button.dart';
import 'package:sample_project/widgets/common_text_field.dart';

import '../../utils/validator.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late RegistrationRepository registrationRepository;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  bool isObscure = true;

  @override
  void initState() {
    registrationRepository = context.read<RegistrationRepository>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: BlocListener<RegistrationBloc, RegistrationState>(
        listener: (context, state) {
          if (state is RegistrationLoading) {
            LoadingDialog.showLoader();
          } else if (state is RegistrationFailed) {
            LoadingDialog.hideLoader();
            Utils.showToast(state.error);
          } else if (state is RegistrationSuccess) {
            Navigator.pushNamedAndRemoveUntil(context, AppRoute.homePageRoute, (route) => false);
          }
        },
        child: SafeArea(
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
                  Padding(
                    padding: EdgeInsets.only(
                      left: getProportionateScreenWidth(10),
                      top: getProportionateScreenHeight(27),
                    ),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset(
                          AppImages.topBackIcon,
                        )),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(26),
                          ),
                          child: Form(
                            key: formKey,
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Sign Up",
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
                                  lable: "Full name",
                                  hintText: "Your full name",
                                  textEditingController: nameController,
                                  textInputAction: TextInputAction.next,
                                  validator: (value) => Validation.textValidation(value, "Full name"),
                                ),
                                SizedBox(
                                  height: getProportionateScreenHeight(19),
                                ),
                                CommonTextField(
                                  lable: "E-mail",
                                  hintText: "Your email",
                                  textEditingController: emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.next,
                                  validator: (value) => Validation.emailValidation(value, "Email", context),
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
                                  validator: (value) => Validation.passwordValidation(value, "Password"),
                                  suffix: IconButton(
                                    color: const Color(0xFFD0D2D1),
                                    padding: EdgeInsets.only(
                                      right: getProportionateScreenWidth(14),
                                      left: getProportionateScreenWidth(8),
                                    ),
                                    onPressed: () {
                                      isObscure = !isObscure;
                                      setState(() {});
                                    },
                                    icon: isObscure
                                        ? const Icon(
                                            Icons.visibility,
                                            color: Colors.white,
                                          )
                                        : const Icon(
                                            Icons.visibility_off,
                                            color: Colors.white70,
                                          ),
                                  ),
                                ),
                                SizedBox(
                                  height: getProportionateScreenHeight(23),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        PrimaryButton(
                          text: "SIGN UP",
                          onPressed: () {
                            // if (formKey.currentState!.validate()) {
                            BlocProvider.of<RegistrationBloc>(context).add(
                              RegistrationButtonPressed(
                                  name: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text),
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
                              "Already have an account? ",
                              style: TextStyle(
                                color: const Color(0xFF5B5B5E),
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
                                // if (Get.arguments == true) {
                                //   Get.back();
                                // } else {
                                //   Get.toNamed(Routes.SIGNIN);
                                // }
                              },
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontFamily: AppFonts.font500,
                                  fontSize: getProportionalFontSize(14),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
