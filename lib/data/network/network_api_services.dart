import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:getx_mvvm/data/app_exception.dart';
import 'package:getx_mvvm/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices{
  @override
  Future getApi(String url) async{

    dynamic responseJson;

    try{
      final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 30));
      responseJson = returnResponse(response);
    } on SocketException{
      throw InternetException();
    } on TimeoutException {
      throw ReqTimeoutException();
    }
    return responseJson;
  }

  @override
  Future postApi(var data, String url) async{

    dynamic responseJson;

    try{
      final response = await http.post(Uri.parse(url),
        body: data
      ).timeout(const Duration(seconds: 30));
      responseJson = returnResponse(response);
    } on SocketException{
      throw InternetException();
    } on TimeoutException {
      throw ReqTimeoutException();
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response){
    switch(response.statusCode){
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      default:
        throw FetchDataException("Error while fetching data ${response.statusCode}");
    }
  }

}