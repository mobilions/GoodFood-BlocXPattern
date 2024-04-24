import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../config/size_config.dart';
import '../main.dart';
import 'colors.dart';

class LoadingDialog {
  LoadingDialog._();

  static bool loaderActive = false;
  static double loaderValue = 0;

  static void showLoader() {
    if (!loaderActive) {
      loaderActive = true;
      showGeneralDialog(
          context: navState.currentContext!,
          barrierDismissible: false,
          barrierColor: Colors.black45,
          pageBuilder: (context, animation1, animation2) => Center(
                child: SizedBox(
                    height: SizeConfig.deviceHeight,
                    width: SizeConfig.deviceWidth,
                    child: Platform.isAndroid
                        ? const Center(
                            child: CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          ))
                        : const CupertinoActivityIndicator(
                            color: AppColors.primaryColor,
                            radius: 25,
                            animating: true,
                          )),
              ));
    }
  }

  static hideLoader() {
    if (loaderActive) {
      loaderActive = false;
      Navigator.pop(navState.currentContext!);
    }
  }
}
