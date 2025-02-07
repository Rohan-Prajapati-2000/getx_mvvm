import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/colors/colors.dart';

class InternetExceptionWidget extends StatelessWidget{

  final void Function()? onPressed;

  InternetExceptionWidget({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.cloud_off, color: Colors.red, size: 50,),
            Center(child: Text('internet_exception'.tr,
              textAlign: TextAlign.center,
            )),
            SizedBox(height: height*0.05),
            SizedBox(
              width: 150,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.buttonColor
                ),
                  onPressed: onPressed,
                  child: Text("Retry",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.blueAccent),
                  ),
              ),
            )
          ],
        ),
      ),
    );
  }

}