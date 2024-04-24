import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sample_project/config/app_fonts.dart';
import 'package:sample_project/config/size_config.dart';
import 'package:sample_project/main.dart';
import 'package:sample_project/routes/app_route.dart';
import 'package:sample_project/utils/colors.dart';
import 'package:sample_project/utils/loader.dart';

import '../utils/constants.dart';
import '../utils/secure_storage.dart';
import '../utils/utils.dart';

class ApiProvider {
  String? route;
  List list = [];
  late StorageService storage;

  Dio dio = Dio();

  Future<dynamic> postAPICall(String url, FormData formData,
      {bool passToken = true, Function(int, int)? onSendProgress}) async {
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      String? accessToken =
          await StorageService().readSecureData(Constants.accessToken);
      String? userId = await StorageService().readSecureData(Constants.userId);

      Map<String, String>? headersData;
      headersData = {"accept": 'application/json'};
      if (passToken) {
        // if (accessToken != null) {
        //   headersData.addAll({
        //     "Authorization": "Bearer $accessToken",
        //   });
        //   debugPrint("token === $accessToken");
        // }

        if (userId != null) {
          formData.fields.add(
            MapEntry('user_id', userId),
          );
          debugPrint("user_id === $userId");
        }
      }

      if (kDebugMode) {
        debugPrint("TOKEN === $accessToken");
        debugPrint("URL === $url");
        debugPrint("HEADERS === $headersData");
        debugPrint("BODY === ${formData.fields}");
        debugPrint("FILES === ${formData.files}");
      }
      var responseJson;
      try {
        final response = await dio
            .post(url,
                data: formData,
                options: Options(
                  headers: headersData,
                ),
                onSendProgress: onSendProgress)
            .timeout(
              Duration(seconds: 25),
            );

        responseJson = _response(response);

        if (kDebugMode) {
          debugPrint("RESPONSE === $responseJson");
        }
      } on SocketException {
        throw FetchDataException('No Internet connection');
      } on TimeoutException {
        throw FetchDataException('Something went wrong, try again later');
      }
      return responseJson;
    } else {
      Utils.showToast("No internet connection");
      return;
    }
  }

  Future<dynamic> getAPICall(
      String url, Map<String, String> headers, Map queryParam) async {
    if (kDebugMode) {
      debugPrint("URL === $url");
      debugPrint("BODY === $queryParam");
    }

    String? accessToken =
        await StorageService().readSecureData(Constants.accessToken);

    Map<String, String>? headersData;
    if (accessToken != null) {
      headersData = {
        "Authorization": "Bearer $accessToken",
        "accept": 'application/json'
      };
      debugPrint("token === $accessToken");
    }

    var responseJson;
    try {
      final response = await dio
          .get(
            url,
            options: Options(
              headers: headersData,
            ),
          )
          .timeout(Duration(seconds: 15));

      responseJson = _response(response);

      if (kDebugMode) {
        debugPrint("RESPONSE === $responseJson");
      }
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on TimeoutException {
      throw FetchDataException('Something went wrong, try again later');
    }
    return responseJson;
  }

  dynamic _response(Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = response.data;
        return responseJson;
      case 400:
        throw BadRequestException(response.data.toString());
      case 401:
        var responseJson = response.data;

        LoadingDialog.hideLoader();
        Utils.showCustomDialog(
          context: navState.currentContext!,
          title: "Authorization Error",
          description:
              "You are not authorized to access this application, Please login again.",
          buttons: [
            TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(
                  AppColors.primaryColor.withOpacity(.1),
                ),
              ),
              onPressed: () async {
                await StorageService().deleteAllSecureData();

                Navigator.pushNamedAndRemoveUntil(navState.currentContext!,
                    AppRoute.loginRoute, (route) => false);
              },
              child: Text(
                "Ok",
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: getProportionalFontSize(14),
                    fontFamily: AppFonts.font400),
              ),
            ),
          ],
        );

        return responseJson;
      case 422:
        var responseJson = response.data;
        return responseJson;
      case 403:
        throw UnauthorisedException(response.data);
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode: ${response.statusCode}');
    }
  }
}

class CustomException implements Exception {
  final message;
  final prefix;

  CustomException([this.message, this.prefix]);

  @override
  String toString() {
    return "$prefix$message";
  }
}

class FetchDataException extends CustomException {
  FetchDataException([message])
      : super(message, 'Error During Communication: ');
}

class BadRequestException extends CustomException {
  BadRequestException([message]) : super(message, 'Invalid Request: ');
}

class UnauthorisedException extends CustomException {
  UnauthorisedException([message]) : super(message, 'Unauthorised: ');
}

class InvalidInputException extends CustomException {
  InvalidInputException([message]) : super(message, 'Invalid Input: ');
}
