import 'package:flutter/material.dart';
import '../styles/colors.dart';

class CButtonStyle {

  static ButtonStyle filled(
      {double? radius,
      double? minimumSize,
      double? elevation,
      Color? background,
      double? height,
      double? width}) {
    return ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 20.0)),
      minimumSize: Size(width ?? double.infinity, height ?? 36),
      backgroundColor: background ?? colorPrimary,
      elevation: elevation,
    );
  }

  static ButtonStyle outline(
      {double? radius,
      double? minimumSize,
      double? elevation,
      Color? background,
      double? height,
      double? width,
      Color? borderColor,
      double? borderWidth}) {
    return ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 20.0),
          side: BorderSide(
              color: borderColor ?? colorPrimary, width: borderWidth ?? 2)),
      minimumSize: Size(width ?? double.infinity, height ?? 40),
      backgroundColor: background ?? Colors.white,
      elevation: elevation,
    );
  }
}
