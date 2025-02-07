import 'package:getx_mvvm/data/network/network_api_services.dart';
import 'package:getx_mvvm/model/home/user_list_model.dart';
import 'package:getx_mvvm/res/app_url/app_url.dart';

class HomeRepository{

  final apiService = NetworkApiServices();

  Future<UserListModel> userListApi() async{
    dynamic response = await apiService.getApi(AppUrl.userListApi);
    return UserListModel.fromJson(response);
  }
}