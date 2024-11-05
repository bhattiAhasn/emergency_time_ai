import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/app_colors/app_colors.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? labelText;
  final Color? fillcolor;
  final Color? bordercolor;
  final Color? disableBorderColor;
  final bool isTextHidden;
  final String? hintText;
  final IconData? buttonIcon;
  final IconData? prefixIcon;
  final bool? togglePassword;
  final int? maxLength;
  final int maxLine;
  final Function()? toggleFunction;
  final IconData? toggleIcon;
  final TextInputType? keyboardType;
  final bool? readOnly;
  final Function()? onTap;
  final Function()? prefixIconTap;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focus;
  final TextInputAction? textInputAction;
  final Color? hintTextColor;
  final Color? textColor;
  final bool isInlineBorder;
  final TextAlign align;

  const CommonTextField({
    Key? key,
    @required this.controller,
    this.validator,
    this.bordercolor,
    this.disableBorderColor,
    this.labelText,
    this.fillcolor,
    this.hintText,
    this.isTextHidden = false,
    this.buttonIcon,
    this.prefixIcon,
    this.onChanged,
    this.togglePassword = false,
    this.toggleFunction,
    this.toggleIcon,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.maxLength,
    this.maxLine = 1,
    this.readOnly,
    this.onTap,
    this.inputFormatters,
    this.prefixIconTap,
    this.hintTextColor,
    this.focus,
    this.isInlineBorder = false,
    this.textColor = Colors.black,
    this.align = TextAlign.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mqData = MediaQuery.of(context);
    final mqDataNew = mqData.copyWith(
        textScaler: TextScaler.linear(
            mqData.textScaleFactor > 1.0 ? 1.0 : mqData.textScaleFactor));
    return MediaQuery(
      data: mqDataNew,
      child: TextFormField(
        textAlign: align,
        cursorColor: AppColors.white,
        textAlignVertical: TextAlignVertical.center,
        onChanged: onChanged,
        inputFormatters: inputFormatters,
        obscureText: isTextHidden,
        readOnly: readOnly == null ? false : true,
        onTap: onTap,
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        maxLength: maxLength,
        maxLines: maxLine,
        focusNode: focus,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        decoration: InputDecoration(
          errorStyle: const TextStyle(
            fontSize: 10.0,
          ),
          prefixIcon: prefixIcon != null
              ? GestureDetector(
                  onTap: prefixIconTap,
                  child: Icon(
                    prefixIcon,
                    color: AppColors.blackColor,
                    size: 20.0,
                  ),
                )
              : null,
          suffixIcon: togglePassword!
              ? GestureDetector(
                  onTap: toggleFunction,
                  child: Icon(toggleIcon, color: AppColors.colorA5A5))
              : null,

          //-----------------Without OnPress text field border Colour-----------
          enabledBorder: isInlineBorder
              ? UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: disableBorderColor ??
                        AppColors.allTextFieldBordersColor,
                  ),
                )
              : OutlineInputBorder(
                  borderSide: BorderSide(
                    color: disableBorderColor ??
                        AppColors.allTextFieldBordersColor,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
          focusedBorder: isInlineBorder
              ? UnderlineInputBorder(
                  borderSide: BorderSide(
                  color: bordercolor ?? AppColors.allTextFieldBordersColor,
                ))
              : OutlineInputBorder(
                  borderSide: BorderSide(
                    color: bordercolor ?? AppColors.allTextFieldBordersColor,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
          hintText: hintText,
          fillColor: AppColors.white,
          filled: true,
          helperStyle: TextStyle(
            letterSpacing: 0.4,
            color: hintTextColor ?? const Color(0xffC1C1C1),
            fontSize: 14.0,
            fontWeight: FontWeight.w300,
          ),
          hintStyle: const TextStyle(
              letterSpacing: 0.4,
              color: Colors.black,
              fontFamily: 'Gilroy',
              fontSize: 16.0,
              fontWeight: FontWeight.w400),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          labelText: labelText,
          labelStyle: const TextStyle(
              letterSpacing: 0.4,
              color: AppColors.colorC9C9,
              fontSize: 13.0,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400),
          border: InputBorder.none,
        ),
        style: TextStyle(
            letterSpacing: 0.4,
            color: textColor,
            fontSize: 16.0,
            fontWeight: FontWeight.w400),
        controller: controller,
        validator: validator,
      ),
    );
  }
}
