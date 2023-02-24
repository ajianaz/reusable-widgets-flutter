import 'package:flutter/material.dart';
import 'package:reusable_widgets_flutter/reusable_widgets_flutter.dart';

class CTextFieldStyle {
  static Icon getIconEye(bool isObscure,
      {IconData? iconEye, IconData? iconEyeOff, Color? color}) {
    if (isObscure) {
      return Icon(
        iconEyeOff ?? Icons.visibility_off,
        color: color ?? colorPrimary,
      );
    } else {
      return Icon(
        iconEyeOff ?? Icons.visibility,
        color: color ?? colorPrimary,
      );
    }
  }

  static InputDecoration? setDefaultDecoration(
      {TextStyle? hintStyle,
      String? hintText,
      Color? fillColor,
      bool? filled,
      Color? focusColor,
      OutlineInputBorder? border,
      OutlineInputBorder? enabledBorder,
      OutlineInputBorder? errorBorder,
      OutlineInputBorder? focusBorder,
      Widget? suffixIcon,
      Widget? prefixIcon}) {
    return InputDecoration(
        hintStyle: hintStyle,
        hintText: hintText,
        fillColor: fillColor,
        filled: filled ?? true,
        focusColor: focusColor,
        border: border ?? setDefaultBorder(color: colorSecondary),
        enabledBorder: enabledBorder ?? setDefaultBorder(color: colorSecondary),
        errorBorder: errorBorder ?? setDefaultBorder(color: colorError),
        focusedBorder: focusBorder ?? setDefaultBorder(color: colorPrimary),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon);
  }

  static OutlineInputBorder setDefaultBorder(
      {Color? color, double? width, BorderRadius? borderRadius}) {
    return OutlineInputBorder(
      borderSide:
          BorderSide(color: color ?? colorPrimary, width: width ?? 2.0),
      borderRadius: borderRadius ?? BorderRadius.circular(20),
    );
  }
}

// OutlineInputBorder errorBorder = OutlineInputBorder(
//   borderSide: BorderSide(
//     color: colorErrorRed,
//     width: 2.0,
//   ),
//   borderRadius: BorderRadius.circular(30),
// );
