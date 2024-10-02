// ignore_for_file: deprecated_member_use

import 'package:emergency_time/widgets/text_widget/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_colors/app_colors.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final void Function() onPressed;
  final Color fillColor;
  final Color borderColor;
  final double width;
  final double height;
  final bool isIconShow;
  final Icon buttonIcon;
  final Color textColor;

  // ignore: use_key_in_widget_constructors
  const CommonButton({
    required this.text,
    required this.textStyle,
    required this.onPressed,
    required this.fillColor,
    this.isIconShow = false,
    this.width = 125,
    this.height = 50,
    this.borderColor = Colors.transparent,
    this.buttonIcon = const Icon(
      Icons.camera_alt_outlined,
      color: AppColors.buttonColor,
      size: 20,
    ),
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 52,
        width: width,

        // Adjust padding to fit your design
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(
              5), // Adjust border radius to fit your design
        ),
        child: Center(
            child: MyText(
          text,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        )),
      ),
    );
  }
}
