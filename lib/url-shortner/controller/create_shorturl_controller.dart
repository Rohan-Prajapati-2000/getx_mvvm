import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/utils/utils.dart';
import 'package:http/http.dart' as http;

class CreateShortcutController extends GetxController {
  final urlEditingController = TextEditingController();

  final baseUrl = "http://192.168.1.38:8000/url";  // Ensure the URL is correct
  var data = ''.obs;

  Future<void> generateUrlShortcut(String fullUrl) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'url': fullUrl,
        }),
      );

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);

        // Ensure response contains 'id'
        if (jsonData != null && jsonData['id'] != null) {
          data.value = jsonData['id'];
          print("Short URL ID: ${data.value}");
        } else {
          Utils.getSnackbar("Error", "Invalid response from server");
        }
      } else {
        Utils.getSnackbar("Error", "Server responded with status: ${response.statusCode}");
      }
    } catch (e) {
      Utils.getSnackbar("Error", "An error occurred: $e");
    }
  }


  Future<void> deleteUrlById(String shortId) async{
    try{
      final deleteUrl = Uri.parse("$baseUrl/$shortId");
      final response = await http.delete(deleteUrl);
      if(response.statusCode == 200){
        Utils.getSnackbar("Success", "URL deleted successfully");
      }else {
        Utils.getSnackbar("Error", "Server responded with status: ${response.statusCode}");
      }
    }catch (e){
      Utils.getSnackbar("Error", "An error occurred: $e");
    }
  }
}
