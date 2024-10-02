// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../constants/app_colors/app_colors.dart';


class CommonScaffold extends StatelessWidget {
  @override
  Key? key;
  PreferredSizeWidget? appBar;
  Widget? body;
  Widget? floatingActionButton;
  FloatingActionButtonLocation? floatingActionButtonLocation;
  FloatingActionButtonAnimator? floatingActionButtonAnimator;
  List<Widget>? persistentFooterButtons;
  AlignmentDirectional persistentFooterAlignment =
      AlignmentDirectional.centerEnd;
  Widget? drawer;
  void Function(bool)? onDrawerChanged;
  Widget? endDrawer;
  void Function(bool)? onEndDrawerChanged;
  Widget? bottomNavigationBar;
  Widget? bottomSheet;
  Color? backgroundColor;
  bool? resizeToAvoidBottomInset;
  bool primary = true;
  DragStartBehavior drawerDragStartBehavior = DragStartBehavior.start;
  bool extendBody = false;
  bool extendBodyBehindAppBar = false;
  Color? drawerScrimColor;
  double? drawerEdgeDragWidth;
  bool drawerEnableOpenDragGesture = true;
  bool endDrawerEnableOpenDragGesture = true;
  String? restorationId;
  bool isAppbarShow;
  void Function()? backIconOnTap;

  CommonScaffold(
      {super.key,
      this.body,
      this.appBar,
      this.backgroundColor,
      this.bottomNavigationBar,
      this.bottomSheet,
      this.drawer,
      this.drawerDragStartBehavior = DragStartBehavior.start,
      this.drawerEdgeDragWidth,
      this.drawerEnableOpenDragGesture = true,
      this.drawerScrimColor,
      this.endDrawer,
      this.endDrawerEnableOpenDragGesture = true,
      this.extendBody = true,
      this.extendBodyBehindAppBar = false,
      this.floatingActionButton,
      this.floatingActionButtonAnimator,
      this.floatingActionButtonLocation,
      this.onDrawerChanged,
      this.onEndDrawerChanged,
      this.persistentFooterAlignment = AlignmentDirectional.centerEnd,
      this.persistentFooterButtons,
      this.primary = true,
      this.isAppbarShow = false,
      this.resizeToAvoidBottomInset,
      this.backIconOnTap,
      this.restorationId});

  @override
  Widget build(BuildContext context) {
    final mqData = MediaQuery.of(context);
    final mqDataNew = mqData.copyWith(
        textScaleFactor:
            mqData.textScaleFactor > 1.0 ? 1.0 : mqData.textScaleFactor);
    return MediaQuery(
      data: mqDataNew,
      child: Scaffold(
        appBar: isAppbarShow == true
            ? AppBar(
                leading: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: AppColors.blackColor,
                    size: 20,
                  ),
                ),
              )
            : appBar,
        extendBodyBehindAppBar: extendBodyBehindAppBar,
        backgroundColor: backgroundColor,
        body: body,
        key: key,
        bottomNavigationBar: bottomNavigationBar,
        bottomSheet: bottomSheet,
        drawer: drawer,
        drawerDragStartBehavior: drawerDragStartBehavior,
        drawerEdgeDragWidth: drawerEdgeDragWidth,
        drawerEnableOpenDragGesture: drawerEnableOpenDragGesture,
        drawerScrimColor: drawerScrimColor,
        endDrawer: endDrawer,
        endDrawerEnableOpenDragGesture: endDrawerEnableOpenDragGesture,
        extendBody: extendBody,
        floatingActionButton: floatingActionButton,
        floatingActionButtonAnimator: floatingActionButtonAnimator,
        floatingActionButtonLocation: floatingActionButtonLocation,
        onDrawerChanged: onDrawerChanged,
        onEndDrawerChanged: onEndDrawerChanged,
        persistentFooterAlignment: persistentFooterAlignment,
        persistentFooterButtons: persistentFooterButtons,
        primary: primary,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        restorationId: restorationId,
      ),
    );
  }
}
