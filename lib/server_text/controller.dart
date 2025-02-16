import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:getx_mvvm/server_text/user_model_nodejs.dart';
import 'package:getx_mvvm/utils/utils.dart';
import 'package:http/http.dart' as http;

class ServerController extends GetxController{

  // RxString data = ''.obs;
  RxString message = ''.obs;
  RxString userName = ''.obs;
  RxString userEmail = ''.obs;
  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;
  Rx<UserModelNodeJs?> user = Rx<UserModelNodeJs?>(null);

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
    final url = Uri.parse('http://192.168.1.35:8000');

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

  // Fetchhing NodeJs local data without model
  Future<List<dynamic>> fetchLocalData() async{
    final url = Uri.parse("http://192.168.1.35:8000/users");

      final response = await http.get(url);
      if(response.statusCode == 200){
        return json.decode(response.body);
      } else{
        throw Utils.getSnackbar("Error", "Something went wrong");
      }
  }

  // Fetchin NodeJs local data with usermodel
  Future<List<UserModelNodeJs>> fetchLocalDataModel() async{
    final url = Uri.parse('http://192.168.1.35:8000/users');

    final response = await http.get(url);
    if(response.statusCode == 200){
      List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((json) => UserModelNodeJs.fromJson(json)).toList();
    } else{
      throw Utils.getSnackbar("Error", "Something went wrong");
    }
  }

  Future<void> searchUserById(int id) async{
    final url = Uri.parse('http://192.168.1.35:8000/users/$id');

    try{
      isLoading.value = true;
      errorMessage.value = "";

      final response = await http.get(url);

      if(response.statusCode == 200){
        final jsonData = jsonDecode(response.body);
        if(jsonData == null){
          errorMessage.value = "User not found";
          user.value = null;
        } else {
          user.value = UserModelNodeJs.fromJson(jsonData);
        }
      }else{
        errorMessage.value = "User not found";
        user.value = null;
      }
    } on FormatException{
      errorMessage.value = "User not found";
    }catch (e){
      errorMessage.value = "Something went wrong $e";
    } finally{
      isLoading.value = false;
    }

  }

}