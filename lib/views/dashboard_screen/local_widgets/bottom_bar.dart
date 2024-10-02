import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../dash_board_screen_controller.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({
    super.key,
  });

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  // int selectedBottomAppBarItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      surfaceTintColor: Colors.grey,
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GetBuilder<DashboardScreenController>(
          init: DashboardScreenController(),
          builder: (controller) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [...controller.navBarsItems()],
            );
          }),
    );
  }
}

class BottomAppBarItem extends StatelessWidget {
  const BottomAppBarItem({
    super.key,
    required this.icon,
    required this.onTap,
  });

  final Widget icon;
  // final String title;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox.fromSize(size: const Size(33, 33), child: icon),
              const SizedBox(
                width: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
