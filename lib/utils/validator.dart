import 'package:flutter/material.dart';

class Validation {
  static String? emailValidation(String? value, String? fieldName, BuildContext context) {
    if (value!.isEmpty) {
      return "Please Enter $fieldName";
    }
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(p);
    if (!regExp.hasMatch(value)) {
      return "Please Enter a valid $fieldName";
    }

    if (value.length > 50) {
      return "Should not be greater than 50";
    }
    return null;
  }

  static String? dateValidation(String? value, String? fieldName) {
    if (value!.isEmpty) {
      return 'Please Enter $fieldName';
    }

    return null;
  }

  static String? areaTextValidation(String? value, String? fieldName) {
    if (value!.isEmpty) {
      return 'Please Enter $fieldName';
    }
    if (value.length >= 20) {
      return 'Should not be greater than 20';
    }
    var alregex =
        "^(AED|AFN)\s?([5-9][,\s][0-9]{3}[,\s]|[0-9]{2,3}[,\s][0-9]{3}[,\s]|[0-9]{1,3}[,\s](?:[0-9]{3}[,\s]){2,})([0-9]{3})\.([0-9]{2})";
    if (!RegExp("^(?=.*[a-zA-Z0-9])(?=.*[0-9])[A-Za-z0-9]").hasMatch(value)) {
      return 'Please Enter a valid $fieldName';
    }
    return null;
  }

  static String? alphaNumValidation(String? value, String? fieldName) {
    if (value!.isEmpty) {
      return 'Please Enter $fieldName';
    }
    if (value.length > 20) {
      return 'Should not be greater than 20';
    }
    if (!RegExp("^[a-zA-Z0-9]").hasMatch(value)) {
      return 'Please Enter a valid $fieldName';
    }
    return null;
  }

  static String? nameAlphaNumValidation(String? value, String? fieldName) {
    if (value!.isEmpty) {
      return 'Please Enter $fieldName';
    }
    if (value.length >= 50) {
      return 'Should not be greater than 50';
    }
    if (!RegExp("^[a-zA-Z0-9]").hasMatch(value)) {
      return 'Please Enter a valid $fieldName';
    }
    return null;
  }

  static String? nameAlphaNumValidationWithLength(String? value, String? fieldName, int length) {
    if (value!.isEmpty) {
      return 'Please Enter $fieldName';
    }
    if (value.length > length) {
      return 'Should not be greater than $length';
    }
    var alregex =
        "^(AED|AFN)\s?([5-9][,\s][0-9]{3}[,\s]|[0-9]{2,3}[,\s][0-9]{3}[,\s]|[0-9]{1,3}[,\s](?:[0-9]{3}[,\s]){2,})([0-9]{3})\.([0-9]{2})";
    if (!RegExp("^(?=.*[a-zA-Z0-9])[A-Za-z0-9]").hasMatch(value)) {
      return 'Please Enter a valid $fieldName';
    }
    return null;
  }

  static String? tradeLicense(String? value, String? fieldName) {
    if (value!.isEmpty) {
      return 'Please Enter $fieldName';
    }
    if (value.length > 50) {
      return 'Should not be greater than 50';
    }
    if (!RegExp("^(?=.*[a-zA-Z0-9])(?=.*[0-9])(?=.*[a-zA-Z])").hasMatch(value)) {
      return 'Please Enter a valid $fieldName';
    }
    return null;
  }

  static String? passwordValidation(String? value, String? fieldName) {
    if (value!.isEmpty) {
      return 'Please Enter $fieldName';
    }

    if (value.length < 6) {
      return '$fieldName should not be less than 6';
    }
    if (value.length > 20) {
      return '$fieldName should not be greater than 20';
    }
    // if (!RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*\W)").hasMatch(value)) {
    //   return 'Please Enter a valid $fieldName (Must include at least one special character and one numeric)';
    // }
    return null;
  }

  static String? confirmPasswordValidation(String? value, String? fieldName, TextEditingController controller) {
    if (value!.isEmpty) {
      return 'Please Enter $fieldName';
    }
    if (value != controller.text) {
      return 'Password does not match';
    }
    return null;
  }

  static String? requiredValidation(String? value, String? fieldName) {
    if (value!.isEmpty) {
      return 'Please Enter $fieldName';
    }
    return null;
  }

  static String? describeValidation(String? value, String? fieldName) {
    if (value!.isEmpty) {
      return 'Please describe $fieldName';
    }
    return null;
  }

  static String? phoneValidation(String? value, String? fieldName) {
    if (value!.isEmpty) {
      return 'Please Enter $fieldName';
    }
    return null;
  }

  static String? numberValidation(String? value, String? fieldName) {
    if (value!.isEmpty) {
      return 'Please Enter $fieldName';
    }
    if (double.tryParse(value) == null) {
      return 'Please Enter a valid $fieldName';
    }
    return null;
  }

  static String? numValidation(String? value, int length, String? fieldName) {
    if (value!.isEmpty) {
      return 'Please Enter $fieldName';
    }
    if (double.tryParse(value) == null) {
      return 'Please enter a valid $fieldName';
    }
    if (value.length > length) {
      return 'Should not be greater than $length';
    }
    if (value.length < length) {
      return 'Should not be less than $length';
    }
    return null;
  }

  static String? loanAmountNumValidation(String? value, int length, String? fieldName) {
    if (value!.isEmpty) {
      return 'Please Enter $fieldName';
    }
    if (value.length > length) {
      return 'Should not be greater than $length';
    }
    if (double.tryParse(value)! >= 250000 && double.tryParse(value)! <= 50000000) {
      return 'Should be between "AED 250K (min) and AED 50M (max)"';
    }
    if (double.tryParse(value) == null) {
      return 'Please Enter a valid $fieldName';
    }
    return null;
  }

  static String? numNMValidation(String? value, int length, String? fieldName) {
    if (value!.isNotEmpty) {
      if (value.length > length) {
        return 'Should not be greater than $length';
      }
      if (double.tryParse(value) == null) {
        return 'Please Enter a valid $fieldName';
      }
      return null;
    }
  }

  static String? textValidation(String? value, String? fieldName) {
    if (value!.isEmpty) {
      return 'Please Enter $fieldName';
    }
    if (!RegExp("^[a-zA-Z]+[a-zA-Z]").hasMatch(value)) {
      return 'Please Enter a valid $fieldName';
    }
    if (value.length > 20) {
      return 'Should not be greater than 20';
    } else if (value.length > 200) {
      return 'Should not be greater than 200';
    }
    return null;
  }

  static String? addressValidation(String? value, String? fieldName) {
    if (value!.isEmpty) {
      return 'Please Enter $fieldName';
    }
    return null;
  }

  static String? enterValidation(String? value, String? fieldName) {
    if (value!.isEmpty) {
      return 'Please Enter $fieldName';
    }
    return null;
  }

  static String? comptextValidation(String? value, String? fieldName) {
    if (value!.isEmpty) {
      return 'Please Enter $fieldName';
    }
    if (value.length >= 255) {
      return 'Should not be greater than 255';
    }
    if (!RegExp("^[a-zA-Z]+[a-zA-Z]").hasMatch(value)) {
      return 'Please Enter a valid $fieldName';
    }
    return null;
  }

  static String? websiteValidation(String? value, String? fieldName) {
    if (value!.isEmpty) {
      return 'Please Enter $fieldName';
    }
    if (value.length > 100) {
      return 'Should be less than 100 character';
    }
//    var webreg="(http|https)://[\w-]+(\.[\w-]+)+([\w.,@?^=%&amp;:/~+#-]*[\w@?^=%&amp;/~+#-])?";
    if (!RegExp("(\.[\w-]+)+([\w.,@?^=%&amp;:/~+#-]*[\w@?^=%&amp;/~+#-])?").hasMatch(value)) {
      return 'Please Enter a valid $fieldName';
    }
    return null;
  }

  static String? textValidationWithCustomLength(String? value, String? fieldName, int length, String regx) {
    if (value!.isEmpty) {
      return 'Please Enter $fieldName';
    }
    if (value.length > length) {
      return 'Should not be greater than $length';
    }
    if (!RegExp(regx).hasMatch(value)) {
      return 'Please Enter valid Charcters: $regx';
    }
    return null;
  }

  static String? textValidationNMWithCustomLength(String? value, String? fieldName, int length, String regx) {
    if (value!.isNotEmpty) {
      if (value.length > length) {
        return 'Should not be greater than $length';
      }
      if (!RegExp(regx).hasMatch(value)) {
        return 'Please Enter valid Charcters: $regx';
      }
      return null;
    }
  }

  static String? businessIncomeNetProfit(String? value, String? fieldName) {
    if (value!.isEmpty) {
      return 'Please Enter $fieldName';
    }
    // if (int.parse(value) > 2000000) {
    //   return 'Please enter value less than 2M';
    // }
    if (value.length >= 10) {
      return 'Please Enter ($fieldName) less than 10 character';
    }
    if (!RegExp(r'^(?=\D*(?:\d\D*){1,12}$)\d+(?:\.\d{1,4})?$').hasMatch(value)) {
      return 'Please Enter a valid ($fieldName)';
    }
    return null;
  }
}
