import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/url-shortner/controller/url_shortner_controller.dart';

import '../controller/create_shorturl_controller.dart';

class UrlShortner extends StatefulWidget{
  @override
  State<UrlShortner> createState() => _UrlShortnerState();
}

class _UrlShortnerState extends State<UrlShortner> {
  final controller = Get.put(UrlShortnerController());
  final createController = Get.put(CreateShortcutController());

  @override
  void initState() {
    super.initState();
    controller.fetchAllUrlsData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Url Shortner"),
      ),
      body: Obx((){
        if(controller.isLoading.value){
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: controller.jsonData.length,
            itemBuilder: (context, index) {
              final item = controller.jsonData[index];

              return Dismissible(
                  key: Key(item['shortId']),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),

                  onDismissed: (direction) async{
                    createController.deleteUrlById(item['shortId']);
                    controller.fetchAllUrlsData();
                  },

                  child: ListTile(
                    title: Text(item['shortId']),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item['redirectUrl']),
                        Text(item['createdAt']),
                        Text(item['updatedAt']),
                      ],
                    ),
                    trailing: Text(item['visitHistory'].length.toString()),
                  )
              );


            },
        );
      }),
    );
  }
}