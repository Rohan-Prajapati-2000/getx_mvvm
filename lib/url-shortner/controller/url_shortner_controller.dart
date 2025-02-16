import 'dart:convert';

import 'package:get/get.dart';
import 'package:getx_mvvm/url-shortner/model/url_shortner_model.dart';
import 'package:getx_mvvm/utils/utils.dart';
import 'package:http/http.dart' as http;

class UrlShortnerController extends GetxController{

  final url = Uri.parse("http://192.168.1.38:8000/url");
  RxBool isLoading = false.obs;

  RxList<dynamic> jsonData = [].obs;

  Future<void> fetchAllUrlsData() async{

    try{
      isLoading.value = true;
      final response = await http.get(url);
      if(response.statusCode == 200){
        jsonData.value = jsonDecode(response.body);
        print(jsonData);
      } else{
        Utils.getSnackbar("Error", "Something went wrong: ${response.statusCode}");
        isLoading.value = false;
      }
    } catch (e){
      Utils.getSnackbar("Error", "Something went wrong: $e");
      isLoading.value = false;
    }finally{
      isLoading.value = false;
    }
  }
}