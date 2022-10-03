import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/constant_routes.dart';

class SplashScreenController extends GetxController{

  String imageName = 'group_circle.png';

  @override
  void onInit() {
    goto();
    super.onInit();
  }

  goto()async{
   await Future.delayed(const Duration(seconds: 3));
   SharedPreferences prefs = await SharedPreferences.getInstance();
   String? intro = prefs.getString("intro_screen");
   print("introduction screen $intro");
   if(intro == "true"){
     SharedPreferences prfs = await SharedPreferences.getInstance();
     String? isUser = prfs.getString("isUser");
     String? email = prfs.getString("email");
     String? password = prfs.getString("password");
     if(isUser == "true"){
       print("splash url https://moyenxpress.com/loginForWeb?email=$email&password=$password}");
       Get.offAllNamed(kWebViewScreen,arguments: 'https://moyenxpress.com/');
     }else{
     Get.offAllNamed(kLoginScreen);
   }
   }else{
     Get.offAllNamed(kInitialScreen);
   }
  }

}
