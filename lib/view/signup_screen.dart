import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moyen_express/constants/validations.dart';
import 'package:moyen_express/controllers/signup_screen_controller.dart';

import '../constants/colors.dart';
import '../constants/text_field.dart';


class SignupScreen extends GetView<SignupScreenController> {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /////////// HEADER ////////////////
        body: Stack(
          children: [
            Container(),
            Positioned(
              left: Get.width * 0.2,
              bottom: Get.height * 0.88,
              child: SizedBox(
                  height: Get.height * 0.3,
                  child: Image.asset('assets/circle.png')),
            ),
            Positioned(
              right: Get.width * 0.35,
              bottom: Get.height * 0.89,
              child:  Container(
                  height: Get.height * 0.03,
                  child: Image.asset('assets/circle.png')),
            ),
            Positioned(
              left: Get.width * 0.5,
              bottom: Get.height * 0.85,
              child: SizedBox(
                  height: Get.height * 0.04,
                  child: Image.asset('assets/circle.png')),
            ),

           Obx(()=> Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: Get.height * 0.18,
                        width: Get.width * 0.23,
                        child: Image.asset("assets/splash_logo.png"),
                      ),
                      const Text("Lets Get Started!", style: TextStyle(fontSize: 27)),
                      const SizedBox(height: 5),
                      const Text(
                          "Create Your Account To Moyen Xpress And Access To All Our Amazing Features",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12)),
                      const SizedBox(height: 10),
                      Form(
                          key: controller.formKey,
                          child: Column(
                            children: [
                              Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 40),
                                  child: GetTextField(
                                    textEditingController: controller.userNameController,
                                      validation: Validations.commonValidation,
                                      prefixIcon:Icon(Icons.person,size: 25,color:Color(kPrimaryColor)),
                                      title: "Enter Your Name*:"

                                  )
                              ),
                              Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 40),
                                  child:GetTextField(
                                    textEditingController: controller.emailController,

                                    validation: Validations.emailValidation,
                                      prefixIcon:Icon(Icons.email,size: 25,color:Color(kPrimaryColor)),
                                      title: "Email*:",
                                      inputType: TextInputType.emailAddress,
                                  )
                              ),
                              Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 40),
                                  child:GetTextField(
                                    textEditingController: controller.phoneNoController,

                                    validation: Validations.commonValidation,
                                      prefixIcon:Icon(Icons.mobile_friendly,size: 25,color:Color(kPrimaryColor)),
                                      title: "Number:",
                                    inputType: TextInputType.number,
                                  )
                              ),
                              Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 40),
                                  child:GetTextField(
                                    textEditingController: controller.passwordController,

                                    validation: Validations.signupPasswordValidation,
                                      prefixIcon:Icon(Icons.password,size: 25,color:Color(kPrimaryColor)),
                                      title: "Password*:",
                                  )
                              ),
                              Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 40),
                                  child:GetTextField(
                                      textEditingController: controller.confirmPasswordController,
                                      validation: Validations.signupPasswordValidation,
                                      prefixIcon:Icon(Icons.password,size: 25,color:Color(kPrimaryColor)),
                                      title: "Confirm Password*:"
                                  )
                              ),
                              const SizedBox(height: 20),
                              controller.confirmPasswordError.value != ''? Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: Text("${controller.confirmPasswordError}",style: const TextStyle(color: Colors.red)),
                              ):const SizedBox(),
                              Container(
                                margin: const EdgeInsets.symmetric(horizontal: 40),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () async {
                                        if(controller.formKey.currentState!.validate()){
                                          controller.signup();
                                        }
                                      },
                                      child: Container(
                                        height: 40,
                                        width: Get.width*0.77,
                                        color: Color(kPrimaryColor),
                                        child:  Center(
                                          child:controller.isLoading.value == true?const SizedBox(
                                            height: 30,
                                            width: 30,
                                            child: CircularProgressIndicator(
                                              color: Colors.white,
                                            ),
                                          ): Text("Sign up", style: const TextStyle(color: Colors.white)),

                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              controller.signupError.value != ''? Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text("${controller.signupError}",style: const TextStyle(color: Colors.red)),
                              ):const SizedBox(),
                              const SizedBox(height: 10),
                              const Text("Already Have An Account",textAlign: TextAlign.center,style: TextStyle(color: Colors.grey)),
                              const SizedBox(height: 10),
                              GestureDetector(
                                child: Container(
                                  color: Colors.transparent,
                                  padding: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
                                    child: const Text("Login ", style: TextStyle(decoration: TextDecoration.underline))),
                                onTap: () async {
                                  Get.back();
                                },
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
              ),
            ),

            ////////////////////// FOOTER
            Positioned(
              left: Get.width * 0.1,
              top: Get.height * 0.9,
              child: SizedBox(
                  height: Get.height * 0.5,
                  child: Image.asset('assets/circle.png')),
            ),
            Positioned(
              left: Get.width * 0.4,
              top: Get.height * 0.91,
              child:
              SizedBox(height: 30, child: Image.asset('assets/ellipse.png')),
            ),
            Positioned(
              left: Get.width * 0.1,
              top: Get.height * 0.9,
              child:
              Container(height: 70, child: Image.asset('assets/ellipse.png')),
            ),
            //////// FRONT ///////////////////
          ],
        ));
  }
}
