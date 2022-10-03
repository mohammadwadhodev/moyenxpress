import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:moyen_express/models/signup_screen_model.dart';

import '../constants/dialog_box.dart';
import '../services/provider.dart';
class SignupScreenController extends GetxController{
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  RxString  confirmPasswordError = ''.obs;
  RxString  signupError = ''.obs;
  RxBool isLoading = false.obs;
  ApiProvider apiProvider = ApiProvider();


  void signup()async {

    if(passwordController.text == confirmPasswordController.text){
      isLoading.value = true;
      clearVariables();
      SignupScreenModel model = SignupScreenModel(
        name: userNameController.text,
        email: emailController.text,
        password: passwordController.text
      );
     var result =  await apiProvider.signupApi(model);
      isLoading.value = false;
     print("result : ${result}");
     if(result['result'] == false){
       signupError.value = result['message'];
     }else if(result['result'] == true){
       clearForm();
       successDialog();
     }
    }else{
      confirmPasswordError.value = 'Confirm Password Not Match';
    }
  }

clearForm(){
    userNameController.clear();
    emailController.clear();
    phoneNoController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
}
  clearVariables(){
    confirmPasswordError.value = '';
    signupError.value = '';

  }

}