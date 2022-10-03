import 'package:flutter/material.dart';
class GetTextField extends StatelessWidget {

  TextEditingController? textEditingController;
  Icon? suffixIcon;
  Widget? prefixIcon;
  String? Function(String?)? validation;
  String? title;
  TextInputType? inputType;

  GetTextField({
    Key? key,
    this.textEditingController,
    this.suffixIcon,
    this.prefixIcon,
    this.title,
    this.validation,
    this.inputType,

  }) : super(key: key);





  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator:validation,
      controller: textEditingController,
      keyboardType: inputType,
      decoration: InputDecoration(
          prefixIcon:prefixIcon,
          hintText: title
      ),
    );
  }
}

