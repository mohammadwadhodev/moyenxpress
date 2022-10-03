import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moyen_express/controllers/web_view_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';


class WebViewScreen extends GetView<WebViewScreenController> {
  const WebViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.getUrl;
    return WillPopScope(
      onWillPop: () async {
        if (await controller.webViewController.canGoBack()) {
          controller.webViewController.goBack();
          return false;
        } else {
          return true;
        }
      },
      child: SafeArea(
        child: Scaffold(
          // appBar: AppBar(
          //   backgroundColor: Color(kPrimaryColor),
          //   title: Row(
          //     mainAxisAlignment: MainAxisAlignment.start,
          //
          //     children: [
          //       Container(
          //         width: 250,
          //         height: 50,
          //         margin: EdgeInsets.only(bottom: 2),
          //         child:  TextField(
          //           decoration: InputDecoration(
          //             border: OutlineInputBorder(
          //                 borderSide: BorderSide(color: Colors.white)
          //             ),
          //             disabledBorder:OutlineInputBorder(
          //                 borderSide: BorderSide(color: Colors.white)
          //             ),
          //             enabledBorder: OutlineInputBorder(
          //                 borderSide: BorderSide(color: Colors.grey.shade900),
          //
          //             ),
          //             hintText: 'Enter a search term',
          //             hintStyle: TextStyle(
          //               color: Colors.grey.shade900
          //             )
          //
          //           ),
          //
          //         ),
          //       ),
          //       SizedBox(width: 5),
          //
          //       Container(
          //           height: 50,
          //           width: 70,
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(7),
          //             color: Colors.grey.shade900
          //
          //           ),
          //
          //           margin: EdgeInsets.only(bottom: 2),
          //
          //           child: Icon(Icons.search,size: 30)),
          //
          //     ],
          //   ),
          // ),
          // floatingActionButton: FloatingActionButton(
          //     onPressed: () {
          //        controller.setImages();
          //     },
          //     child: Text("ok")),
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () async {
          //     //await controller.webViewController.runJavascriptReturningResult("console.log('.....')");
          //     controller.setImages();
          //
          //     // await controller.webViewController.runJavascript("document.getElementsByClassName('.slick-slide')[0].style.color = 'blue';");
          //   },
          //   child: Text("+"),
          // ),
          //
          body: SafeArea(
            child: Stack(
              children: [
                WebView(
                  // \ initialUrl: 'http://activemoyen.globalapplicationbrands.com/',
                  // initialUrl:'https://activemoyen.globalapplicationbrands.com/',
                  initialUrl: controller.getUrl,
                  javascriptMode: JavascriptMode.unrestricted,
                  gestureNavigationEnabled: true,
                  onPageStarted: (url) {
                    controller.loadingPercentage.value = 0;
                    controller.currentPage.value = url;

                  },
                  onProgress: (progress) {
                    controller.loadingPercentage.value = progress;
                    if (controller.isWebViewCreated == true) {
                       controller.imagesSet ? null : controller.initImage();
                    }
                  },
                  onPageFinished: (url) async {
                    controller.loadingPercentage.value = 100;
                    Get.back();
                    controller.cssOnPageStarted();
                    controller.setImages();
                  },
                  onWebViewCreated: (WebViewController webViewController) {
                    controller.webViewController = webViewController;
                    controller.isWebViewCreated = true;
                  },
                  navigationDelegate: (NavigationRequest request) {
                    if (request.url.startsWith("https://moyenxpress.com/logout")) {
                      controller.logoutDialog();
                      return NavigationDecision.navigate;
                    } else {
                      controller.pageLoadingDialog();
                    }
                    return NavigationDecision.navigate;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
