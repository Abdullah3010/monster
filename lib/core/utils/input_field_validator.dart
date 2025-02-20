import 'package:monster/core/extension/string_extension.dart';

/// [InputFieldValidator] is a class that contains all the validations that are used in the app.
class InputFieldValidator {
  /// [isMobileValid] is a function that checks if the mobile number is valid or not.
  static String? isValidMobileNumber(String? value) {
    String phoneNumber = value?.replaceAll('-', '') ?? '';
    RegExp onlyNumbers = RegExp(r'^\d+$');
    if (phoneNumber.isEmpty || phoneNumber.trim().isEmpty) {
      return 'Phone number can\'t be empty';
    } else if (!onlyNumbers.hasMatch(phoneNumber)) {
      return 'Phone number must be only numbers.';
    } else if (phoneNumber.length < 10) {
      return 'Phone number must be 10 digits';
    }
    return null;
  }

  static String? isInputEmpty({
    required String fieldName,
    required String value,
    int minLength = 2,
    bool isOnlyNumbers = false,
    bool isPassword = false,
  }) {
    RegExp onlyNumbers = RegExp(r'^\d+$');
    if (value.isEmpty || value.trim().isEmpty) {
      return '$fieldName can\'t be empty';
    } else if (isOnlyNumbers && !onlyNumbers.hasMatch(value)) {
      return '$fieldName must be only numbers';
    } else if (value.trim().length < minLength && !isPassword) {
      return '$fieldName must be at least $minLength characters long';
    }

    return null;
  }

  /// [isEmailValid] is a function that checks if the email is valid or not.
  static String? isEmailValid({required String email, bool isRequired = false}) {
    const String pattern = r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$';
    final RegExp regExp = RegExp(pattern);
    if (email.isEmpty && isRequired) {
      return 'Email can\'t be empty';
    } else if (!regExp.hasMatch(email) && email.isNotEmpty) {
      return 'Invalid email formate';
    }

    return null;
  }

  static String? isValidConfirmPassword(String? value, String? confirmValue) {
    if (value?.isEmpty ?? true) {
      return 'Confirm password can\'t be empty';
    } else if (value != confirmValue) {
      return 'Confirm Password doesn\'t match';
    }
    return null;
  }

  static String? isValedNumber(String? value) {
    RegExp onlyNumbers = RegExp(r'^\d+$');
    if (value?.isNotEmpty == true) {
      if (!onlyNumbers.hasMatch(value ?? '')) {
        return 'Phone number must be only numbers.';
      }
    }
    return null;
  }

  static String? validateRequired({
    required String? value,
    required String fieldName,
    String? customMessage,
  }) {
    if (value == null || value.isEmpty) {
      return customMessage ??
          (fieldName.isNotEmpty ? '$fieldName ${'is required'.translated}' : "This field is required".translated);
    }
    return null;
  }

  static String? validateEmail(String? value) {
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value ?? '')) {
      return 'Enter a valid email address'.translated;
    }

    return null;
  }

  static String? validatePhoneNumber(String phone) {
    if (phone.length != 10) {
      return 'Phone number should be 10 digits'.translated;
    }

    if (phone.startsWith('0')) {
      return 'Phone number should not start with 0'.translated;
    }
    if (!phone.isValidNumber()) {
      return 'Invalid phone number'.translated;
    }
    return null;
  }

  static String? validateOptionalPhoneNumber(String? phone) {
    String phoneNumber = phone?.replaceAll(' ', '') ?? '';
    //ToDo: translate
    if (phoneNumber.startsWith('+20')) {
      return isValidEgyptianNumber(phoneNumber);
    } else if (phoneNumber.startsWith('+971')) {
      return isValidUaeNumber(phoneNumber);
    } else if (phoneNumber.startsWith('+49')) {
      return isValidGermanNumber(phoneNumber);
    }

    return null;
  }

  static String? isValidEgyptianNumber(String phoneNumber) {
    final RegExp regex = RegExp(r'^\+20(1[0-9]{9})$');
    return regex.hasMatch(phoneNumber) ? null : 'Invalid';
  }

  static String? isValidUaeNumber(String phoneNumber) {
    final RegExp regex = RegExp(r'^\+971(5[0-9]{8}|[2-9][0-9]{7})$');
    return regex.hasMatch(phoneNumber) ? null : 'Invalid';
  }

  static String? isValidGermanNumber(String phoneNumber) {
    final RegExp regex = RegExp(r'^\+49([1-9][0-9]{6,13})$');
    return regex.hasMatch(phoneNumber) ? null : 'Invalid';
  }

  static String? validateOptionalEmail(String value) {
    if (value.isEmpty) return null;
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email address'.translated;
    }
    return null;
  }

  static String? validateOptionalLink(String value) {
    if (value.isEmpty) return null;
    final RegExp urlRegex = RegExp(
      r'^(https?:\/\/)?([\w\d-]+\.){1,2}[a-z]{2,6}(:[0-9]{1,5})?(\/.*)?$',
      caseSensitive: false,
    );
    if (!urlRegex.hasMatch(value)) {
      return 'Enter a valid URL'.translated;
    }
    return null; // Return null if the website is valid
  }

  static String? validateRequiredString(String value) {
    if (value.isEmpty) return 'Required'.translated;
    return null;
  }

  static String? validateDateRequired(String? value) {
    if (value != null && value.isEmpty) return 'Please enter date of birth'.translated;
    return null;
  }

  static String? validateDate(String? value) {
    if (value != null && value.length < 10) return 'Date is invalid'.translated;
    return null;
  }

  static String? validateDeadline(String? value) {
    if (value != null && (DateTime.tryParse(value)?.compareTo(DateTime.now()) ?? 0) < 0) {
      return 'Deadline must be in the future'.translated;
    }
    return null;
  }

  static String? validateYear(String? value) {
    if (value == null || value.isEmpty) return 'Year is required'.translated;
    int year = int.tryParse(value) ?? 0;
    if (value.length < 4 || year > DateTime.now().year || year < 1900) {
      return 'Invalid year'.translated;
    }
    return null;
  }
}
