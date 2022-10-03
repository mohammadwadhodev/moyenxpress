import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:moyen_express/route_management/route_management.dart';
import 'package:moyen_express/route_management/screen_bindings.dart';
import 'constants/constant_routes.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute:kSplashScreen,
      getPages:RouteManagement.getPages(),
      initialBinding:ScreenBindings(),
      debugShowCheckedModeBanner: false,
    );
  }
}

