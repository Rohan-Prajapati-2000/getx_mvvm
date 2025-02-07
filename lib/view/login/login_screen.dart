import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/colors/colors.dart';
import 'package:getx_mvvm/res/components/round_button.dart';
import 'package:getx_mvvm/utils/utils.dart';
import 'package:getx_mvvm/view_model/controller/login/login_controller.dart';

class LoginScreen extends StatelessWidget{

  LoginController loginController = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final height = Get.height;
   return Scaffold(
     body: Padding(
       padding: const EdgeInsets.symmetric(horizontal: 20),
       child: Form(
         key: _formKey,
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             TextFormField(
               controller: loginController.emailController.value,
               focusNode: loginController.emailFocusNode.value,
               validator: (value){
                 if(value!.isEmpty){
                   Utils.getSnackbar("Email", "Enter Email");
                 }
               },
               onFieldSubmitted: (value){
                 Utils.fieldFocusChange(context, loginController.emailFocusNode.value, loginController.passwordFocusNode.value);
               },
               decoration: InputDecoration(
                 hintText: 'email_hint'.tr,
                 border: OutlineInputBorder()
               ),
             ),
             SizedBox(height: height*0.01),
             TextFormField(
               controller: loginController.passwordController.value,
               focusNode: loginController.passwordFocusNode.value,
               obscureText: true,
               validator: (value){
                 if(value!.isEmpty){
                   Utils.getSnackbar("Password", "Enter Password");
                 }
               },
               decoration: InputDecoration(
                   hintText: 'password_hint'.tr,
                   border: OutlineInputBorder()
               ),
             ),
             SizedBox(height: height*0.01,),
             Obx(
               ()=> RoundButton(
                   title: "Login",
                 width: 100,
                 buttonColor: AppColors.buttonColor,
                 isLoading: loginController.isLoading.value,
                 textColor: Colors.white,
                 onPressed: (){
                     if(_formKey.currentState!.validate()){
                       loginController.loginApi();
                     }
                 },
               ),
             )
           ],
         ),
       ),
     ),
   );
  }
}