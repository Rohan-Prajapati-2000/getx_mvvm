import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/server_text/add_new_user_controller.dart';
import 'package:getx_mvvm/server_text/add_new_user_screen.dart';

import 'nodejs_local_db_display.dart';
class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: SizedBox(
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Get.to(AddNewUserScreen());
            }, child: Text("Add User")),

            SizedBox(height: 10),

            ElevatedButton(onPressed: (){
              Get.to(NodeJsLocalDBData());
            }, child: Text("User List")),

            SizedBox(height: 10),

            ElevatedButton(onPressed: (){
              Get.toNamed(RouteName.urlShortner);
            }, child: Text("Url Shortner Screen")),

            SizedBox(height: 10),

            ElevatedButton(onPressed: (){
              Get.toNamed(RouteName.createUrlsShortner);
            }, child: Text("Create url's shortcut"))
          ],
        ),
      ),
    );
  }

}