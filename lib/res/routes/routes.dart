import 'package:get/get.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/url-shortner/view/create_shorturl.dart';
import 'package:getx_mvvm/url-shortner/view/url_shortner.dart';
import 'package:getx_mvvm/view/home_screen/home_screen.dart';
import 'package:getx_mvvm/view/login/login_screen.dart';
import 'package:getx_mvvm/view/splash_screen.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
            name: RouteName.splashScreen,
            page: () => const SplashScreen(),
            transitionDuration: const Duration(milliseconds: 250),
            transition: Transition.leftToRightWithFade),
        GetPage(
            name: RouteName.loginScreen,
            page: () => LoginScreen(),
            transitionDuration: const Duration(milliseconds: 250),
            transition: Transition.leftToRightWithFade),
        GetPage(
            name: RouteName.homeScreen,
            page: () => HomeScreen(),
            transitionDuration: const Duration(milliseconds: 250),
            transition: Transition.leftToRightWithFade),
        GetPage(
            name: RouteName.urlShortner,
            page: () => UrlShortner(),
            transitionDuration: const Duration(milliseconds: 250),
            transition: Transition.leftToRightWithFade),
        GetPage(
            name: RouteName.createUrlsShortner,
            page: ()=> CreateShorturlScreen(),
            transitionDuration: const Duration(milliseconds: 250),
            transition: Transition.leftToRightWithFade)
      ];
}
