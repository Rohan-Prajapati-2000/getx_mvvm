import 'dart:async';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/view_model/controller/user_preferences/user_preferences_view_model.dart';

class SplashServices{

  UserPreferences userPreferences = UserPreferences();

  void isLogin(){

    userPreferences.getUser().then((value){

      print(value.token);
      print(value.isLogin);

      if(value.isLogin == false || value.isLogin.toString() == 'null'){
        Timer(const Duration(seconds: 3),
                ()=> Get.offAllNamed(RouteName.loginScreen)
        );
      } else {
        Timer(const Duration(seconds: 3),
            ()=> Get.offAllNamed(RouteName.homeScreen));
      }
    });

    Timer(const Duration(seconds: 3),
        ()=> Get.toNamed(RouteName.loginScreen)
    );
  }

}