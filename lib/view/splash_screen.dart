import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreen extends GetView<SplashScreenController> {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    controller.imageName;
   return  Scaffold(
     body: Image.asset("assets/full_splash_image.jpg"),
   );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Stack(
  //       children: [
  //         Container(),
  //         Positioned(
  //           left:Get.width*0.7,
  //           bottom:Get.height*0.83,
  //           child: Container(
  //               height: Get.height*0.2,
  //               child: Image.asset('assets/circle.png')),
  //         ),
  //         Positioned(
  //           left:Get.width*0.75,
  //           bottom:Get.height*0.9,
  //           child: Container(
  //               height:30,
  //               child: Image.asset('assets/circle.png')),
  //         ),
  //         Positioned(
  //           left:Get.width*0.6,
  //           bottom:Get.height*0.85,
  //           child: SizedBox(
  //               height:20,
  //               child: Image.asset('assets/circle.png')),
  //         ),
  //         Positioned(
  //           left:Get.width*0.4,
  //           bottom:Get.height*0.92,
  //           child: Container(
  //               height:20,
  //               child: Image.asset('assets/circle.png')),
  //         ),
  //         Positioned(
  //           right:Get.width*0.1,
  //           bottom:Get.height*0.8,
  //           child: Container(
  //               height:60,
  //               child: Image.asset('assets/circle.png')),
  //         ),
  //
  //         ////////////////////// FOOTER
  //         Positioned(
  //           left: 10,
  //           bottom: 25,
  //           child: Container(
  //               height: Get.height*0.18,
  //               child: Image.asset('assets/circle.png')),
  //         ),
  //         Positioned(
  //           left: 125,
  //           bottom: 70,
  //           child: Container(
  //               height:30,
  //               child: Image.asset('assets/ellipse.png')),
  //         ),
  //         Positioned(
  //           left: 70,
  //           bottom: 120,
  //           child: Container(
  //               height:70,
  //               child: Image.asset('assets/ellipse.png')),
  //         ),
  //         //////// FRONT ///////////////////
  //         Center(
  //           child: Container(
  //               height:Get.height*0.35,
  //               child: Image.asset('assets/${controller.imageName}')),
  //         ),
  //         Center(
  //           child: Container(
  //               height:Get.height*0.14,
  //               child: Image.asset('assets/splash_logo.png')),
  //         ),
  //
  //
  //       ],
  //     )
  //   );
  // }
  //
}
