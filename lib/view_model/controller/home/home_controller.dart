import 'package:get/get.dart';
import 'package:getx_mvvm/data/response/status.dart';
import 'package:getx_mvvm/model/home/user_list_model.dart';
import 'package:getx_mvvm/repository/home_repository/home_repository.dart';

class HomeController extends GetxController{

  final api = HomeRepository();
  RxString error = ''.obs;
  final rxRequestStatus = Status.LOADING.obs;
  final userList = UserListModel().obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setUserList(UserListModel _value) => userList.value = _value;
  void setError(String _value) => error.value = _value;

  void getUserList(){
    api.userListApi().then((value){
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stacktrace){
      setError(error.toString());
      print(error);
      setRxRequestStatus(Status.ERROR);
    });
  }

  void refreshUserList(){
    setRxRequestStatus(Status.LOADING);

    api.userListApi().then((value){
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stacktrace){
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }
}