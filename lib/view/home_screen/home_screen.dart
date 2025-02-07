import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/components/internet_exception_widget.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/view_model/controller/home/home_controller.dart';
import 'package:getx_mvvm/view_model/controller/user_preferences/user_preferences_view_model.dart';

import '../../data/response/status.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserPreferences userPreferences = UserPreferences();

  HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    homeController.getUserList();
  }

  Future<void> onPullRefresh() async{
    homeController.refreshUserList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home Screen"),
          actions: [
            IconButton(
                onPressed: () {
                  userPreferences.removeUser().then((value) {
                    Get.offAllNamed(RouteName.loginScreen);
                  });
                },
                icon: const Icon(Icons.logout))
          ],
        ),
        body: Obx(() {
          switch (homeController.rxRequestStatus.value) {
            case Status.LOADING:
              return const Center(child: CircularProgressIndicator());
            case Status.ERROR:
              if (homeController.error.value == " No Internet") {
                return InternetExceptionWidget(
                  onPressed: () {
                    homeController.refreshUserList();
                  },
                );
              } else {
                return SizedBox(
                  width: Get.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("Something went wrong"),
                      const SizedBox(height: 10),
                      ElevatedButton(
                          onPressed: () {
                            homeController.refreshUserList();
                          },
                          child: Text(
                            "Retry",
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.blueAccent),
                          ))
                    ],
                  ),
                );
              }
            case Status.COMPLETED:
              return RefreshIndicator(
                onRefresh: onPullRefresh,
                child: ListView.builder(
                  itemCount: homeController.userList.value.data!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(homeController
                              .userList.value.data![index].avatar
                              .toString()),
                        ),
                        title: Text(
                            "${homeController.userList.value.data![index].firstName.toString()} ${homeController.userList.value.data![index].lastName.toString()}"),
                        subtitle: Text(homeController
                            .userList.value.data![index].email
                            .toString()),
                      ),
                    );
                  },
                ),
              );
          }
        }));
  }
}
