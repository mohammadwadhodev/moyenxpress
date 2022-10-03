import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:moyen_express/models/login_screen_model.dart';

import '../models/signup_screen_model.dart';

class ApiProvider{

  final headers = {
    'content-Type':'application/json',
    'Authorization':'key=AAAAEMaNkY0:APA91bEmqpy_D1-oobPwR27CjwlUIkfHs7Ct00McrirnHsd3KiiYIGHGfg5QFwX112MIOiSR018YaBZE_LIz59m9h_3BYgbmtRAfV8m5tV5TlXzegt3ADfGaZBRAawwv7RvzPlpLL9Ai'
  };

Future<Map<String,dynamic>> loginApi(LoginScreenModel model)async {
  print("we are in");
  String catchError = '';
  String wrongUser = '';
  var result;

 // const postUrl = 'https://activemoyen.globalapplicationbrands.com/api/loginForWeb';
    const postUrl = 'https://moyenxpress.com/api/loginForWeb';
  var data = {
    'email':model.email,
    'password':model.password,
  };

  try{
   var response =  await http.post(Uri.parse(postUrl),
       body:jsonEncode(data),
       headers: headers
   );

   if(response.statusCode == 200){
     print("response : ${jsonDecode(response.body)}");
     result = jsonDecode(response.body);
   }else{
     wrongUser = 'Email or Password is wrong!';
   }

 }catch(error){
   if(error.toString() == 'Connection timed out'){
     catchError = error.toString();
   }

 }

 Map<String,dynamic>  mapData = {
   'catchError':catchError,
   'wrongUser':wrongUser,
   'data':result,
 };

 return mapData;
}


  Future<Map<String,dynamic>> signupApi(SignupScreenModel model)async {
    print("We are in2");

  //const postUrl = 'https://activemoyen.globalapplicationbrands.com/api/customer-signup'; // url for testing website
  const postUrl = 'https://moyenxpress.com/api/customer-signup'; // url for hosted website
    var response = await http.post(Uri.parse(postUrl),
        body: jsonEncode(model.toJson()),
        headers: headers
    );
  return jsonDecode(response.body);
  }

}