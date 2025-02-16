import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/server_text/add_new_user_controller.dart';

class AddNewUserScreen extends StatelessWidget{

  AddNewUserController addNewUserController = Get.put(AddNewUserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add new user"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            TextField(
              controller: addNewUserController.firstNameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "First Name"
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: addNewUserController.lastNameController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Last Name"
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: addNewUserController.genderController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Gender"
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: addNewUserController.emailController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Email"
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: addNewUserController.jobTitleController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Job Title"
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
                onPressed: (){
                  addNewUserController.addNewUser();
                },
                child: Text("Submit"),
            )

          ],
        ),
      ),
    );
  }

}