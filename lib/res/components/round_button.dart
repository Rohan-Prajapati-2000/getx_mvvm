import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getx_mvvm/res/colors/colors.dart';

class RoundButton extends StatelessWidget{
  final bool isLoading;
  final String title;
  final double height, width;
  final Color textColor;
  final Color buttonColor;
  final void Function()? onPressed;

  const RoundButton({
    super.key,
    this.isLoading = false,
    required this.title,
    this.height = 40,
    this.width = 200,
    this.textColor = AppColors.blackColor,
    this.buttonColor = AppColors.buttonColor,
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor
        ),
          onPressed: onPressed,
          child: isLoading
              ? CircularProgressIndicator()
              : Text(title,
            style: TextStyle(
              color: textColor
            ),
          ),
      ),
    );
  }
}