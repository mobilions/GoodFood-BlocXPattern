import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sample_project/config/app_fonts.dart';

import '../config/size_config.dart';
import 'colors.dart';

class Utils {
  Utils._();

  static bool _loaderActive = false;

  static void showLoader(BuildContext context) {
    if (!_loaderActive) {
      _loaderActive = true;
      showGeneralDialog(
          context: context,
          barrierDismissible: false,
          barrierColor: Colors.black45,
          pageBuilder: (context, animation1, animation2) => Center(
                child: SizedBox(
                    height: SizeConfig.deviceHeight,
                    width: SizeConfig.deviceWidth,
                    child: Platform.isAndroid
                        ? const Center(child: CircularProgressIndicator(color: AppColors.primaryColor))
                        : const CupertinoActivityIndicator(
                            color: Colors.white,
                            radius: 25,
                          )),
              ));
    }
  }

  static hideLoader(BuildContext context) {
    if (_loaderActive) {
      _loaderActive = false;
      Navigator.pop(context);
    }
  }

  static Widget toast(String message) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.black,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Text(
              message,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: AppFonts.font400,
                fontSize: getProportionalFontSize(13),
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static showToast(String message) {
    // FToast fToast = FToast();
    // fToast.init(navigator!.context);
    // fToast.showToast(
    //   child: toast(message),
    //   gravity: ToastGravity.BOTTOM,
    //   toastDuration: Duration(seconds: 3),
    // );
    Fluttertoast.showToast(
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_SHORT,
        textColor: Colors.white,
        backgroundColor: AppColors.primaryColor,
        msg: message);
  }

  static showCustomDialog({required context, required title, bool? bar, required description, required buttons}) {
    showDialog(
        context: context,
        barrierDismissible: bar ?? false,
        builder: (context) => CupertinoAlertDialog(
              title: Text(
                title,
                style: TextStyle(
                  fontFamily: AppFonts.font600,
                  fontSize: getProportionalFontSize(16),
                ),
              ),
              content: Text(
                description,
                style: TextStyle(
                  fontFamily: AppFonts.font400,
                  fontSize: getProportionalFontSize(14),
                ),
              ),
              actions: buttons,
            ));
  }

  static customLoader() {
    return Platform.isAndroid
        ? const Center(child: CircularProgressIndicator(color: AppColors.primaryColor))
        : const Center(
            child: CupertinoActivityIndicator(
              color: Colors.white,
              radius: 25,
            ),
          );
  }
}
