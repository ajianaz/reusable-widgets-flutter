import 'package:flutter/material.dart';
import 'package:reusable_widgets_flutter/reusable_widgets_flutter.dart';

OutlineInputBorder defaultBorder = OutlineInputBorder(
  borderSide: BorderSide(color: colorPrimary, width: 2.0),
  borderRadius: BorderRadius.circular(20),
);

InputDecoration defaultDecoration = InputDecoration(
    hintStyle: CTextStyle.hint(),
    hintText: "",
    fillColor: Colors.white,
    filled: true,
    focusColor: Colors.white,
    border: defaultBorder,
    enabledBorder: defaultBorder,
    errorBorder: defaultBorder,
    focusedBorder: defaultBorder,
    suffixIcon: null,
    prefixIcon: null);

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

    return defaultDecoration.copyWith(
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
    return defaultBorder.copyWith(
      borderSide: BorderSide(color: color ?? colorPrimary, width: width ?? 2.0),
      borderRadius: borderRadius ?? defaultBorder.borderRadius,
    );
  }
}
