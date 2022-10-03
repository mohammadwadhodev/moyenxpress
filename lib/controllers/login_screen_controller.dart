import 'package:get/get.dart';
import 'package:moyen_express/models/login_screen_model.dart';
import 'package:moyen_express/services/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

import '../constants/constant_routes.dart';

class LoginScreenController extends GetxController{

TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();
GlobalKey<FormState> formKey = GlobalKey<FormState>();
ApiProvider apiProvider = ApiProvider();
RxBool isLoading = false.obs;
RxString showError = ''.obs;

  @override
  void onInit() {
   setIntroScreen();
    super.onInit();
  }

  setIntroScreen()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("intro_screen", "true");
  }

  void login()async{
    isLoading.value = true;
    showError.value = '';
    LoginScreenModel model = LoginScreenModel(
      email: email.text,
      password: password.text,
    );

    model.toJson();
    Map<String,dynamic> data =  await apiProvider.loginApi(model);
    isLoading.value = false;
    if(data['catchError'] !=''){
      showError.value = data['catchError'];
    }else if(data['wrongUser'] != ''){
      showError.value = data['wrongUser'];
    }else if(data['data']['result'] == true){
      showError.value = '';
      setUser();
      print("resulr: ${data['data']}");
      Get.offAllNamed(kWebViewScreen,arguments: 'https://moyenxpress.com/loginForWeb?email=${email.text}&password=${password.text}');

      //  Get.offAllNamed(kWebViewScreen,arguments: 'https://activemoyen.globalapplicationbrands.com/loginForWeb?email=${email.text}&password=${password.text}');

    }
    // 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
    //

  }


  void skipLogin(){

  }


  void setUser()async{
    SharedPreferences prfs = await SharedPreferences.getInstance();
    prfs.setString("isUser", "true");
    prfs.setString("email", email.text);
    prfs.setString("password", password.text);
  }



}