import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/server_text/controller.dart';

class NodeJsServerText extends StatefulWidget{
  @override
  State<NodeJsServerText> createState() => _NodeJsServerTextState();
}

class _NodeJsServerTextState extends State<NodeJsServerText> {

  ServerController serverController = Get.put(ServerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Node Server Test"),
      ),
      body: SizedBox(
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Here is response from server"),
            SizedBox(height: 15),
            // this is only response
            // Obx(()=> Text(
            //   serverController.data.isEmpty
            //       ? "There are nothing to show"
            //       : "Response is: ${serverController.data}"),
            // ),
            Obx(()=> Text(
                serverController.message.isEmpty
                    ? "There are nothing to show"
                    : "Message is: ${serverController.message}"),
            ),
            Obx(()=> Text(
                serverController.userName.isEmpty
                    ? "There are nothing to show"
                    : "Name is: ${serverController.userName}"),
            ),
            Obx(()=> Text(
                serverController.userEmail.isEmpty
                    ? "There are nothing to show"
                    : "Email is: ${serverController.userEmail}"),
            ),
            SizedBox(height: 15),
            SizedBox(
              width: 150,
                child: ElevatedButton(
                    onPressed: (){
                      serverController.fetchData();
                    },
                    child: Text("Fetch data"),
                ),
            )
          ],
        ),
      ),
    );
  }
}