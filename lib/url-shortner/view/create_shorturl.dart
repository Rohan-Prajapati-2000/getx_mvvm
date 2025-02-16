import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/url-shortner/controller/create_shorturl_controller.dart';

class CreateShorturlScreen extends StatelessWidget {

  CreateShortcutController controller = Get.put(CreateShortcutController());

  CreateShorturlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Short URL"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          SizedBox(
          height: 35,
          child: TextField(
            controller: controller.urlEditingController,
            decoration: InputDecoration(
                hintText: "http://example.com",
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 8)
            ),
          ),
        ),

        SizedBox(height: 10),

        ElevatedButton(onPressed: () {
          controller.generateUrlShortcut(controller.urlEditingController.text);
        }, child: Text("Generate shortcut")),

        SizedBox(height: 10),

        Obx(() {
          if(controller.data.value.isNotEmpty){
            return Text("http://192.168.1.38:800/url/${controller.data.value}");
          } else{
            return const SizedBox();
          }
        })
        ],
      ),
    ),);
  }

}