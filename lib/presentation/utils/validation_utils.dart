abstract class ValidationUtils {
  static String? validateMobileNumber({
    required String? value,
    required String onEmpty,
    required String onInvalid,
  }) {
    if (value == null || value.isEmpty) {
      return onEmpty;
    }
    if (!RegExp(r'^(?:\d{11}|\+\d{12})$').hasMatch(value)) {
      return onInvalid;
    }
    return null;
  }

  static String? validatePassword({
    required String? value,
    required String onInvalid,
  }) {
    if (value == null || value.isEmpty) {
      return onInvalid;
    }
    return null;
  }
}
