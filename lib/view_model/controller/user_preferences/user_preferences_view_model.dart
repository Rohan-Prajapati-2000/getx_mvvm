import 'package:getx_mvvm/model/login/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
class UserPreferences{

  Future<bool> saveUser(UserModel responseModel) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('token', responseModel.token.toString());
    sharedPreferences.setBool('isLogin', responseModel.isLogin!);
    return true;
  }

  Future<UserModel> getUser() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString('token');
    bool? isLogin = sharedPreferences.getBool('isLogin');
    return UserModel(
      token: token,
      isLogin: isLogin
    );
  }

  Future<bool> removeUser()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
    return true;
  }

}