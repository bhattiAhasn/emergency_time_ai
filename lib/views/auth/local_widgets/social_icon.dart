import 'package:flutter/material.dart';

class SocialIcon extends StatelessWidget {
  const SocialIcon({
    super.key,
    required this.icon,
    this.onTap,
  });
  final String icon;

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: 43,
          width: 90,
          // backgroundColor: Color(0xffFDCF09),
          decoration: BoxDecoration(
            shape: BoxShape.circle,

            // image: DecorationImage(
            //     image: Image.asset(AppIcons.googleIcon, height: 30, width: 30,)
            //         .image)
          ),
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            icon,
            fit: BoxFit.contain,
          )),
    );
  }
}
