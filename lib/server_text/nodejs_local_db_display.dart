//
//   // SHOWING DATA WITHOUT CREATING USER MODEL
//
// import 'package:flutter/material.dart';
// import 'package:getx_mvvm/server_text/controller.dart';
//
// class NodeJsLocalDBData extends StatefulWidget{
//   @override
//   State<NodeJsLocalDBData> createState() => _NodeJsLocalDBDataState();
// }
//
// class _NodeJsLocalDBDataState extends State<NodeJsLocalDBData> {
//   ServerController controller = ServerController();
//   late Future<List<dynamic>> users;
//
//   @override
//   void initState() {
//     users = controller.fetchLocalData();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("NodeJs Local Data"),
//       ),
//       body: FutureBuilder(
//           future: users,
//           builder: (context, snapshot) {
//             if(snapshot.connectionState == ConnectionState.waiting){
//               return Center(child: CircularProgressIndicator());
//             } else if(snapshot.hasError){
//               return Center(child: Text("Error: ${snapshot.error}"),);
//             } else {
//               return ListView.builder(
//                 itemCount: snapshot.data?.length,
//                 itemBuilder: (context, index) {
//                   final user = snapshot.data![index];
//                   return Card(
//                     child: ListTile(
//                       title: Text("Name: ${user['first_name']} ${user['last_name']} and Gender: ${user['gender']}"),
//                       subtitle: Text("Email: ${user['email']} \n Job Title:${user['job_title']}"),
//                     ),
//                   );
//                 },
//               );
//             }
//           },
//       )
//     );
//   }
// }



// SHOWING DATA AFTER CREATING USER MODEL

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/server_text/controller.dart';

class NodeJsLocalDBData extends StatelessWidget{
  ServerController controller = ServerController();
  TextEditingController searchEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("NodeJs Local Data"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const SizedBox(height: 5,),
              SizedBox(
                height: 50,
                child: TextField(
                  controller: searchEditingController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Enter User Id",
                    border: const OutlineInputBorder(),
                    suffix: IconButton(
                        onPressed: (){
                          int? id = int.tryParse(searchEditingController.text);
                          if(id != null){
                            controller.searchUserById(id);
                          } else {
                            Get.snackbar("Invalid Input", "Please enter a valid User Id");
                          }
                        },
                        icon: const Icon(Icons.search)
                    )
                  ),
                ),
              ),
              const SizedBox(height: 5),

              Obx((){
               if(controller.isLoading.value){
                return const Center(child: CircularProgressIndicator());
               } else if (controller.errorMessage.isNotEmpty){
                 return Center(child: Text(controller.errorMessage.value, style: const TextStyle(color: Colors.red)));
               } else if(controller.user.value != null){
                 return Card(
                   color: Colors.redAccent.shade100,
                   child: ListTile(
                     title: Text(
                       "Id: ${controller.user.value!.id}\n"
                       "Name: ${controller.user.value!.firstName} ${controller.user.value!.lastName}\nGender: ${controller.user.value!.gender}"
                     ),
                     subtitle: Text(
                       "Email: ${controller.user.value!.email}\nJob Title: ${controller.user.value!.jobTitle}"
                     ),
                   ),
                 );
               }
               return SizedBox.shrink();
              }),
              const SizedBox(height: 5),
              Expanded(
                  child: FutureBuilder(
                    future: controller.fetchLocalDataModel(),
                    builder: (context, snapshot) {
                      if(snapshot.connectionState == ConnectionState.waiting){
                        return const Center(child: CircularProgressIndicator());
                      } else if(snapshot.hasError){
                        return Center(child: Text("Error: ${snapshot.error}"),);
                      } else {
                        return ListView.builder(
                          itemCount: snapshot.data?.length,
                          itemBuilder: (context, index) {
                            final user = snapshot.data![index];
                            return Card(
                              child: ListTile(
                                title: Text("Id:${user.id}\nName: ${user.firstName} ${user.lastName} \nGender: ${user.gender}"),
                                subtitle: Text("Email: ${user.email} \nJob Title:${user.jobTitle}"),
                              ),
                            );
                          },
                        );
                      }
                    },
                  )
              )
            ],
          ),
        )

    );
  }
}