import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AddNewUserController extends GetxController{

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final genderController = TextEditingController();
  final emailController = TextEditingController();
  final jobTitleController = TextEditingController();

  final baseUrl = "http://192.168.1.35:8000";

  Future<void> addNewUser() async{
    final user = {
      'first_name' : firstNameController.text,
      'last_name' : lastNameController.text,
      'gender' : genderController.text,
      'email' : emailController.text,
      'job_title' : jobTitleController.text,
    };

    try{
      var response = await http.post(
          Uri.parse("$baseUrl/users"),
        headers: {"Content-Type" : "application/x-www-form-urlencoded"},
        body: user
      );

      if(response.statusCode == 200){
        Get.snackbar("Success", "User added successfully");
        clearField();
      } else{
        Get.snackbar("Error", "Failed to add user");
      }

    } catch(e){
      Get.snackbar("Error", "Something went wrong");
    }
  }


  void clearField(){
    firstNameController.clear();
    lastNameController.clear();
    emailController.clear();
    genderController.clear();
    jobTitleController.clear();
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    genderController.dispose();
    emailController.dispose();
    jobTitleController.dispose();
    super.onClose();
  }

}