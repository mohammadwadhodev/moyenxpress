import 'package:get/get.dart';
import 'package:moyen_express/constants/constant_routes.dart';
import 'package:moyen_express/route_management/screen_bindings.dart';
import 'package:moyen_express/view/initial_screen.dart';
import 'package:moyen_express/view/splash_screen.dart';
import 'package:moyen_express/view/web_screen.dart';
import '../view/login_screen.dart';
import '../view/signup_screen.dart';

class RouteManagement {
  static List<GetPage> getPages() {
    return [
      GetPage(
          name: kInitialScreen,
          page: () => InitialDetailScreen(),
          binding: ScreenBindings()),
      GetPage(
          name: kLoginScreen,
          page: () => const LoginScreen(),
          binding: ScreenBindings()),
      GetPage(
          name: kSignupScreen,
          page: () => const SignupScreen(),
          binding: ScreenBindings()),
      GetPage(
          name: kSplashScreen,
          page: () => const SplashScreen(),
          binding: ScreenBindings()),
      GetPage(
          name: kWebViewScreen,
          page: () => const WebViewScreen(),
          binding: ScreenBindings()),
    ];
  }
}
