import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_assets/app_icon.dart';
import '../../mixin_classes/keys_variables_abstract.dart';
import '../../mixin_classes/localstorage_abstract.dart';
import 'local_widgets/bottom_bar.dart';

class DashboardScreenController extends GetxController
    with CommonVariables, InitializeLocalStorage {
  ListQueue<int> navigationQueue = ListQueue();
  int currentIndex = 0;
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  set selectedIndex(int index) {
    _selectedIndex = index;
    update(); // Notify listeners of the change
  }

  List<Widget> buildScreens() {
    return [];
  }

  List<BottomAppBarItem> navBarsItems() {
    return [
      BottomAppBarItem(
        onTap: () {
          selectedIndex = 0;
        },
        icon: Image.asset(AppIcons.homeIcon),
      ),
      BottomAppBarItem(
        onTap: () {
          selectedIndex = 1;
        },
        icon: Image.asset(AppIcons.statsIcon),
      ),
      BottomAppBarItem(
        onTap: () {
          selectedIndex = 2;
        },
        icon: Image.asset(AppIcons.profileIcon),
      ),
    ];
  }

  // Change bottom nav bar index
  void changeTabIndex(int index) {
    currentIndex = index;

    if (index == currentIndex) {
      navigationQueue.clear();
      navigationQueue.addLast(index);
      currentIndex = index;
      update();
    }
  }
}
