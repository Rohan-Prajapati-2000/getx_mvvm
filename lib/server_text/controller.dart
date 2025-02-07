import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ServerController extends GetxController{

  // RxString data = ''.obs;
  RxString message = ''.obs;
  RxString userName = ''.obs;
  RxString userEmail = ''.obs;

  // this is only body message
  // Future<void> fetchData() async{
  //   final url = Uri.parse("http://192.168.1.33:8000");
  //   try{
  //     final response = await http.get(url);
  //     if(response.statusCode == 200){
  //       print("Response From Server: ${response.body}");
  //       data.value = response.body;
  //     } else {
  //       print("Failed to load data. Status code: ${response.statusCode}");
  //     }
  //   } catch (e){
  //     print("Error: $e");
  //   }
  // }

  //this return in json data
  Future<void> fetchData() async{
    final url = Uri.parse('http://192.168.1.33:8000');

    try{
      final response = await http.get(url);

      if(response.statusCode == 200){
        final jsonResponse = json.decode(response.body);
        message.value = jsonResponse['message'];
        userName.value = jsonResponse['data']['name'];
        userEmail.value = jsonResponse['data']['email'];

        // print("Message: ${jsonResponse['message']}");
        // print("User Name: ${jsonResponse['data']['name']}");
        // print("User Email: ${jsonResponse['data']['email']}");
      } else {
        print("Failed to load data. Status code:${response.statusCode}");
      }
    } catch(e){
      print("Error: $e");
    }
  }
}