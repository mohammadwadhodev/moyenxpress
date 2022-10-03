import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moyen_express/constants/colors.dart';
import 'package:moyen_express/constants/validations.dart';
import '../constants/constant_routes.dart';
import '../constants/text_field.dart';
import '../controllers/login_screen_controller.dart';


class LoginScreen extends GetView<LoginScreenController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: GestureDetector(
        onTap: (){
          Get.offAllNamed(kWebViewScreen,arguments: 'https://www.moyenxpress.com');
          },
        child:const Padding(
          padding: EdgeInsets.only(right: 20.0,bottom: 20),
          child:  Text("Skip",style: TextStyle(color: Colors.grey,fontSize: 17)),
        ),
      ),
        body: Stack(
          children: [
            ////////////// HEADER /////////////////////
            Container(),
            Positioned(
              left: Get.width * 0.6,
              bottom: Get.height * 0.77,
              child: SizedBox(
                  height: Get.height * 0.3,
                  child: Image.asset('assets/circle.png')),
            ),
            Positioned(
              right: Get.width * 0.2,
              bottom: Get.height * 0.83,
              child: Container(
                  height: Get.height * 0.12,
                  child: Image.asset('assets/circle.png')),
            ),
            Positioned(
              left: Get.width * 0.76,
              bottom: Get.height * 0.73,
              child: SizedBox(
                  height: Get.height * 0.05,
                  child: Image.asset('assets/circle.png')),
            ),

            Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: Get.height * 0.18,
                      width: Get.width * 0.23,
                      child: Image.asset("assets/splash_logo.png"),
                    ),

                    const Text("Welcome Back !", style: TextStyle(fontSize: 27)),
                    const SizedBox(height: 5),
                    const Text(
                        "Welcome Back To Moyen Express Please Login To Your Existing Account",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12)),
                    const SizedBox(height: 10),
                    Form(
                      key:controller.formKey,
                        child: Obx(()=> Column(
                            children: [
                              Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 40),
                                  child: GetTextField(
                                    textEditingController: controller.email,
                                      validation: Validations.emailValidation,
                                      prefixIcon:Container(
                                        height: 2,
                                        width: 2,
                                        padding: EdgeInsets.zero,
                                        margin: EdgeInsets.zero,
                                        child: Image.asset("assets/email.png",height: 5, color:Color(kPrimaryColor)),),
                                      title: "Email:"
                                  )
                              ),
                              Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 40),
                                  child:GetTextField(
                                    validation:Validations.passwordValidation,
                                    textEditingController: controller.password,
                                      prefixIcon:Image.asset("assets/key.png",color:Color(kPrimaryColor)),
                                      title: "Password:"
                                  )
                              ),
                              const SizedBox(height: 20),
                              controller.isLoading.value == true?Center(
                                child: SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: CircularProgressIndicator(
                                    strokeWidth:3,
                                    color: Color(kPrimaryColor),
                                  ),
                                ),
                              ):const SizedBox(),
                              controller.showError.value != ''?Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Text(controller.showError.value,style: TextStyle(color: Colors.red),),
                                ),
                              ):const SizedBox(),
                              Container(
                                margin: const EdgeInsets.symmetric(horizontal: 40),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      child: Text("Forgot Password?", style: TextStyle(decoration: TextDecoration.underline, color: Color(kPrimaryColor))),
                                      onTap: () async {

                                      },
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        if(controller.formKey.currentState!.validate()){
                                          controller.login();
                                        }else{
                                          print("false");
                                        }
                                      //  Get.toNamed(kWebViewScreen);
                                      },
                                      child: Container(
                                        height: 35,
                                        width: 110,
                                        color: Color(kPrimaryColor),
                                        child: const Center(
                                          child: Text("Login", style: TextStyle(color: Colors.white)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Text("Or \n New On Moyen Express",textAlign: TextAlign.center,style: TextStyle(color: Colors.grey)),
                              const SizedBox(height: 10),
                              GestureDetector(
                                onTap: () async {
                                  Get.toNamed(kSignupScreen);
                                },
                                child: Container(
                                  color: Colors.transparent,
                                  padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 10),
                                  child: const Text("Create An Account ", style: TextStyle(decoration: TextDecoration.underline)),
                                ),
                              ),
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            ),

            ////////////////////// FOOTER ////////////////////////////////
            Positioned(
              right: Get.width * 0.55,
              top: Get.height * 0.8,
              child: SizedBox(
                  height: Get.height * 0.5,
                  child: Image.asset('assets/circle.png')),
            ),
            Positioned(
              left: Get.width * 0.3,
              top: Get.height * 0.82,
              child:
              SizedBox(height: 60, child: Image.asset('assets/ellipse.png')),
            ),
            Positioned(
              left: Get.width * 0.005,
              top: Get.height * 0.86,
              child:
              Container(height: 90, child: Image.asset('assets/ellipse.png')),
            ),
            //////// FRONT ///////////////////
          ],
        ));
  }
}
