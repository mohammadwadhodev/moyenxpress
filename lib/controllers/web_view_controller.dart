import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moyen_express/constants/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:webview_flutter/webview_flutter.dart';

import '../constants/constant_routes.dart';

class WebViewScreenController extends GetxController {
  RxInt loadingPercentage = 0.obs;
  late WebViewController webViewController;
  String getUrl = Get.arguments;
  RxBool pageLoading = false.obs;
  RxString currentPage = ''.obs;

  @override
  void onInit() {
    //   getUrl = 'https://moyenxpress.com/';
    print("getUrl ===== ${Get.arguments}");
    super.onInit();
  }

  void gotoLogin() async {
    SharedPreferences prfs = await SharedPreferences.getInstance();
    prfs.setString("email", "");
    prfs.setString("password", "");
    prfs.setString("isUser", "false");
    Get.offAllNamed(kLoginScreen);
  }

  void logoutDialog() async {
    Get.defaultDialog(
      title: '',
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: Color(kPrimaryColor),
          ),
          const SizedBox(height: 20),
          const Text("Signing out...")
        ],
      ),
    );
    await Future.delayed(const Duration(seconds: 1));
    gotoLogin();
  }

  void pageLoadingDialog() async {
    Get.dialog(
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 30,
            width: 30,
            child: CircularProgressIndicator(
              color: Color(kPrimaryColor),
            ),
          ),
        ],
      ),
    );
  }

  // cssOnPageProcess(){
  //   print("CSS ON PAGE PROCESS");
  //   //webViewController.runJavascript("document.getElementsByClassName('slider-get')[0].style.backgroundImage = '"'url('"${imagesList[0]}"')'"'");
  //  // webViewController.runJavascript("document.getElementById('humbargar-button').style.backgroundImage = '"'url('"${imagesList[i]}"')'"'");
  // //  webViewController.runJavascript("document.getElementsByClassName('las la-bars')[0].style.display = 'none'");
  // }
  cssOnPageStarted() {
    webViewController.runJavascript(
        "document.getElementsByClassName('footerSec')[0].style.display = 'none'");
    webViewController.runJavascript(
        "document.getElementsByClassName('notes-sections')[0].style.display = 'none'");
    webViewController.runJavascript(
        "document.getElementById('section_countryflags').style.marginBottom = '50px'");
    // webViewController.runJavascript("document.getElementById('humbargar-button').style.display = 'none'");
    //
    // webViewController.runJavascript(
    //     "document.getElementById('humbargar-button').style.backgroundImage = '"
    //         'url('
    //         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRH885_Hw351x0-SrRwYLVX1Jk87qRZ_FKdQg&usqp=CAU"
    //         ')'
    //         "'");
//     webViewController.runJavascript("document.getElementById('humbargar-button').style.backgroundImage = '"'url('"https://www.pinterest.com/pin/582090320583371462/"')'"'");
//     webViewController.runJavascript(
//         "document.getElementById('humbargar-button').style.height = '50px'");
//     webViewController.runJavascript(
//         "document.getElementById('humbargar-button').style.width = '50px'");
//
//     webViewController.runJavascript(
//         "document.getElementsByClassName('las la-bars')[0].style.display = 'none'");

  }

  // purchaseHistoryCss(){
  //   print("we re in purchase history");
  //   webViewController.runJavascript("document.getElementsByClassName('card-body')[0].style.display = 'none'");
  //   for(int i = 0; i<5; i++){
  //     webViewController.runJavascript("document.getElementsByClassName('card-header')[0].appendChild('<div class = 'card'>hello</div>')')'");
  //   }
  // }
  //  formSubmit()async{
  //    print("formSubmit");
  //    String url = 'https://www.moyenexpress.com';
  //   var value =  webViewController.runJavascript("document.getElementById('url').value='$url'");
  // // print("valye $value");
  //   await Future.delayed(const Duration(seconds: 1));
  //   webViewController.runJavascript("document.forms[0].submit()");
  //
  //  }
  //
  int i = 0;
  List imagesList = [
    'https://activemoyen.globalapplicationbrands.com/public/uploads/all/i0cubx2nrC06VoV3jRlo5kkcGuyqdVFXnFOeFbSC.png',
    'https://activemoyen.globalapplicationbrands.com/public/uploads/all/y15D4cWSK5TAnodvPKQyvzzsvhZOG6wa3vtOjSuC.png',
    'https://activemoyen.globalapplicationbrands.com/public/uploads/all/UPs8AJ8LCmZk88UbmulHb1Uix5itxEYhgItw7ruG.png',
    "https://activemoyen.globalapplicationbrands.com/public/uploads/all/SUq9dGpiNZadvBrNnv9NeexOwTtVfBZCEGSRum8N.png",
  ];

  //List imagesList = ['../assets/mobile/1.png','../assets/mobile/2.png','../assets/mobile/3.png','../assets/mobile/4.png'];
  bool imagesSet = false;
  bool isWebViewCreated = false;

  initImage() {
    webViewController.runJavascript("document.getElementsByClassName('slider-get')[0].style.backgroundImage = '"'url('"${imagesList[0]}"')'"'");
    webViewController.runJavascript("document.getElementsByClassName('mobile-silder')[0].style.width = '320px'");
    webViewController.runJavascript("document.getElementsByClassName('mobile-silder')[0].style.right = '20px'");
  }

  setImages() async {
    if (imagesSet != true) {
      imagesSet = true;
      for (; i < imagesList.length; i++) {
        await Future.delayed(const Duration(seconds: 3));
        webViewController.runJavascript("document.getElementsByClassName('slider-get')[0].style.backgroundImage = '"'url('"${imagesList[i]}"')'"'");
        webViewController.runJavascript("document.getElementsByClassName('mobile-silder')[0].style.width = '320px'");
        webViewController.runJavascript("document.getElementsByClassName('mobile-silder')[0].style.right = '20px'");
        if (i == imagesList.length - 1) {
          i = -1;
        }
      }
    }
  }

}
