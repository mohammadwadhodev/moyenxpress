import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:moyen_express/controllers/home_screen_controller.dart';
import 'package:moyen_express/controllers/initial_screen_controller.dart';
import 'package:moyen_express/controllers/signup_screen_controller.dart';

import '../controllers/login_screen_controller.dart';
import '../controllers/splash_screen_controller.dart';
import '../controllers/web_view_controller.dart';

class ScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InitialDetailScreenController());
    Get.lazyPut(() => LoginScreenController());
    Get.lazyPut(() => SignupScreenController());
    Get.lazyPut(() => SplashScreenController());
    Get.lazyPut(() => WebViewScreenController());
  }
}
