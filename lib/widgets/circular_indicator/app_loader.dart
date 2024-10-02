import 'package:flutter/material.dart';
import '../../constants/app_colors/app_colors.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: Color(0xff2ECEC2),
      ),
    );
  }
}
