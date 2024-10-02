// ignore_for_file: must_be_immutable



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CommonContainer extends StatelessWidget {

  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final Decoration? decoration;
  final Decoration? foregroundDecoration;
  final double? width;
  final double? height;
  final BoxConstraints? constraints;
  final EdgeInsetsGeometry? margin;
  final Matrix4? transform;
  final AlignmentGeometry? transformAlignment;
  final Widget? child;
  final Clip clipBehavior ;

  const CommonContainer(
      {super.key,
      this.width,
      this.height,
      this.alignment,
      this.child,
      this.clipBehavior = Clip.none,
      this.color =Colors.white,
      this.constraints,
      this.decoration,
      this.foregroundDecoration,
      this.margin,
      this.padding,
      this.transform,
      this.transformAlignment});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height??Get.height,
      width: width ??Get.width,
      key: key,
      decoration: decoration,
      alignment: alignment,
      clipBehavior: clipBehavior,
      constraints: constraints,
      foregroundDecoration: foregroundDecoration,
      margin: margin,
      padding: padding,
      transform: transform,
      transformAlignment: transformAlignment,
      color: color,
      child: child,
    );
  }
}
