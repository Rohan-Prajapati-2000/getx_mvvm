import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/model/login/user_model.dart';
import 'package:getx_mvvm/repository/login_repository/login_repository.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/utils/utils.dart';
import 'package:getx_mvvm/view_model/controller/user_preferences/user_preferences_view_model.dart';

class LoginController extends GetxController{

  final _api = LoginRepository();
  UserPreferences userPreferences = UserPreferences();

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool isLoading = false.obs;

  void loginApi(){
    isLoading.value = true;
    Map data = {
      'email' : emailController.value.text,
      'password' : passwordController.value.text,
    };
    _api.loginApi(data).then((value){
      isLoading.value = false;
      if(value['error'] == 'user not found'){
        Utils.getSnackbar("Login", value['error']);
      } else{
        UserModel userModel = UserModel(
          token: value['token'],
          isLogin: true
        );

        userPreferences.saveUser(userModel).then((value){
          Get.offAllNamed(RouteName.homeScreen);
        });
        Utils.getSnackbar("Login", "Successfully");
      }
    }).onError((error, stackTrash){
      isLoading.value = false;
      Utils.getSnackbar("Error", error.toString());
    });
  }

}