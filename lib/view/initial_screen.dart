import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:moyen_express/constants/colors.dart';
import 'package:moyen_express/controllers/initial_screen_controller.dart';

import '../constants/constant_routes.dart';


class InitialDetailScreen extends GetView<InitialDetailScreenController> {
   InitialDetailScreen({Key? key}) : super(key: key);

  var pageDecoration = const PageDecoration(
    titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
    bodyTextStyle:  TextStyle(fontSize: 19.0),
    bodyPadding:EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
    imageFlex: 3,
    bodyFlex: 2,
    pageColor: Colors.white,
    imagePadding: EdgeInsets.only(top: 30)
  );
   var pageDecoration2 = const PageDecoration(
     titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
     bodyTextStyle:  TextStyle(fontSize: 19.0),
     bodyPadding:EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
     imageFlex: 3,
     bodyFlex: 2,
     imagePadding: EdgeInsets.only(top: 30),
     pageColor: Colors.white,

   );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:IntroductionScreen(
        key: controller.introKey,
        globalBackgroundColor: Colors.white,
        dotsDecorator: DotsDecorator(
          activeColor: Colors.black,
          color: Colors.orange.shade100
        ),
        globalHeader:  Align(
          alignment: Alignment.topLeft,
          child: SafeArea(
            child: Stack(
              children: [
                Container(
                  height: Get.height*0.27,
                  width:  Get.width*0.55,
                ),
                Positioned(
                  right: 100,
                  bottom: 25,
                  child: Container(
                      height: Get.height*0.26,
                      child: Image.asset('assets/circle.png')),
                ),
                Positioned(
                  right: 90,
                  bottom: 170,
                  child: Container(
                      height:30,
                      child: Image.asset('assets/ellipse.png')),
                ),
                Positioned(
                  right: 80,
                  bottom: 100,
                  child: Container(
                      height:70,
                      child: Image.asset('assets/ellipse.png')),
                ),
                Positioned(
                  left: 120,
                  bottom: 140,
                  child: Container(
                      height:50,
                      child: Image.asset('assets/ellipse.png')),
                ),
              ],
            ),
          ),
        ),
        globalFooter: SizedBox(
          height: Get.height*0.15,
          child: Align(
            alignment: Alignment.topRight,
            child: Stack(
              children: [
                Container(
                  height: Get.height*0.27,
                  width:  Get.width*0.55,
                ),
                Positioned(
                  left: 80,
                  top: 20,
                  child: Container(
                      height: Get.height*0.26,
                      child: Image.asset('assets/circle.png')),
                ),
                Positioned(
                  right: 130,
                  bottom: 80,
                  child: Container(
                      height:30,
                      child: Image.asset('assets/ellipse.png')),
                ),
                Positioned(
                  left: 90,
                  bottom:50,
                  child: Container(
                      height:50,
                      child: Image.asset('assets/ellipse.png')),
                ),
                Positioned(
                  right: 115,
                  bottom: 30,
                  child: Container(
                      height:30,
                      child: Image.asset('assets/ellipse.png')),
                ),
              ],
            ),
          ),
        ),

        pages: [
          PageViewModel(
            image: Container(
              margin: EdgeInsets.only(top: 100),
              child: Stack(
                children: [
                  Container(),
                  Center(child: _buildImage('mobile.png')),
                 Container(
                   margin: const EdgeInsets.only(top: 90,right: 40),
                   child: Center(
                       child: _buildImage('m_on_bag.png')),
                 )
                ],
              ),

            ),
            decoration: pageDecoration,
            titleWidget: Text("Welcome",style: TextStyle(
                fontSize: 35,
                color:Color(kPrimaryColor) )),
            bodyWidget:const Text("Welcome to Moyen Xpress World's First African Brand That Connects with The Globe",
                textAlign: TextAlign.center,
                style:  TextStyle(fontSize: 18)),
          ),
          PageViewModel(
            image: Stack(
              alignment: Alignment.center,
               children: [
                 Container(),
                 Positioned(
                     top:Get.height*0.15,
                     child: _buildImage('delivery.png')),
               ],
             ),
            decoration: pageDecoration2,
            titleWidget: Text("Best Shipping",style: TextStyle(
                fontSize: 35,
                color:Color(kPrimaryColor) )),
            bodyWidget:const Text("The Best Shipping is Gauranteed With Moyen Xpress Because Are Expert in it",
                textAlign: TextAlign.center,
                style:  TextStyle(fontSize: 18)),
          ),
          PageViewModel(
            image: Stack(
              alignment: Alignment.center,
              children: [
                Container(),
                Positioned(
                    top:Get.height*0.14,
                    child: _buildImage('tag.png')),
              ],
            ),
            decoration: pageDecoration2,
            titleWidget: Text("Great Prices",style: TextStyle(
                fontSize: 35,
                color:Color(kPrimaryColor) )),
            bodyWidget:const Text("Our App Is Price Regulated You Can Not Find Anything Over Priced",
                textAlign: TextAlign.center,
                style:  TextStyle(fontSize: 18)),
          ),
        ],
        onDone: (){
          Get.offAllNamed(kLoginScreen);
        },
        onSkip: (){
          Get.offAllNamed(kLoginScreen);
          },
        showSkipButton: true,
        skipOrBackFlex: 0,
        nextFlex: 0,
        showBackButton: false,
        back: const Icon(Icons.arrow_back),
        skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600,color:Colors.grey)),
        next: Text('Next', style: TextStyle(fontWeight: FontWeight.w600,color:Color(kPrimaryColor))),
        done: Text('Done', style: TextStyle(fontWeight: FontWeight.w600,color:Color(kPrimaryColor))),
        curve: Curves.fastLinearToSlowEaseIn,
      )
    );
  }
}

Widget _buildImage(String assetName, [double width = 350]) {
  return Image.asset('assets/$assetName', width: width);
}

