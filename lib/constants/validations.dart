
import 'package:get/get_utils/src/get_utils/get_utils.dart';

class Validations{
  // var phoneNoFormatter = MaskTextInputFormatter(
  //     mask: '###########',
  //     filter: {"#": RegExp(r'[0-9]')},
  //     type: MaskAutoCompletionType.lazy);
  // mask_text_input_formatter
  //

  static String? emailValidation(value) {
    if (!GetUtils.isEmail(value)) {
      return "Provide a valid email";
    } else {
      return null;
    }
  }

  static String? passwordValidation(value) {
    if (value == null ||
        value.isEmpty ||
        value != value.replaceAll(new RegExp(r"\s+"), "")) {
      return "required";
    } else if (value.replaceAll(new RegExp(r"\s+"), "").length < 3) {
      return "required";
    } else {
      return null;
    }
  }
  static String? signupPasswordValidation(value) {
    if (value == null ||
        value.isEmpty ||
        value != value.replaceAll(new RegExp(r"\s+"), "")) {
      return "required";
    } else if (value.replaceAll(new RegExp(r"\s+"), "").length < 6) {
      return "Password should be at least 6 characters";
    } else {
      return null;
    }
  }

  static String? commonValidation(value) {
    if (value.trim() == null || value.trim().isEmpty ) {
      return "required";
    }
    else if (value.replaceAll(new RegExp(r"\s+"), "").length < 3) {
      return "required";
    } else {
      return null;
    }
  }

}