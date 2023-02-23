import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../styles/colors.dart';

class CTextStyle {
  static String fontDefault = fontLato;
  static String fontLato = "Lato";
  static String fontRoboto = 'Roboto';
  static String fontOpenSans = 'Open Sans';
  static String fontMontserrat = 'Montserrat';
  static String fontOswald = 'Oswald';
  static String fontRaleway = 'Raleway';
  static String fontNotoSans = 'Noto Sans';
  static String fontPoppins = 'Poppins';
  static String fontSourceSansPro = 'Source Sans Pro';
  static String fontUbuntu = 'Ubuntu';
  static String fontMerriweather = 'Merriweather';
  static String fontWorkSans = 'Work Sans';
  static String fontRobotoCondensed = 'Roboto Condensed';
  static String fontPTSans = 'PT Sans';
  static String fontDroidSans = 'Droid Sans';
  static String fontPlayfairDisplay = 'Playfair Display';
  static String fontComfortaa = 'Comfortaa';
  static String fontExo = 'Exo';
  static String fontInconsolata = 'Inconsolata';
  static String fontQuicksand = 'Quicksand';

  static TextStyle hint(
      {String? fontFamily,
      double? fontSize,
      double? letterSpacing,
      FontWeight? fontWeight,
      Color? color}) {
    return const TextStyle().custom(
        fontFamily ?? fontDefault,
        fontSize ?? 12,
        letterSpacing ?? 0.25,
        fontWeight ?? FontWeight.w200,
        color ?? colorText);
  }

  static TextStyle body(
      {String? fontFamily,
      double? fontSize,
      double? letterSpacing,
      FontWeight? fontWeight,
      Color? color}) {
    return const TextStyle().custom(
        fontFamily ?? fontDefault,
        fontSize ?? 14,
        letterSpacing ?? 0.25,
        fontWeight ?? FontWeight.normal,
        color ?? colorText);
  }

  static TextStyle bodySemiBold(
      {String? fontFamily,
      double? fontSize,
      double? letterSpacing,
      FontWeight? fontWeight,
      Color? color}) {
    return const TextStyle().custom(
        fontFamily ?? fontDefault,
        fontSize ?? 16,
        letterSpacing ?? 0.25,
        fontWeight ?? FontWeight.w600,
        color ?? colorText);
  }

  static TextStyle subhead(
      {String? fontFamily,
      double? fontSize,
      double? letterSpacing,
      FontWeight? fontWeight,
      Color? color}) {
    return const TextStyle().custom(
        fontFamily ?? fontDefault,
        fontSize ?? 18,
        letterSpacing ?? 0.25,
        fontWeight ?? FontWeight.bold,
        color ?? colorText);
  }

  static TextStyle head(
      {String? fontFamily,
      double? fontSize,
      double? letterSpacing,
      FontWeight? fontWeight,
      Color? color}) {
    return const TextStyle().custom(
        fontFamily ?? fontDefault,
        fontSize ?? 20,
        letterSpacing ?? 0.25,
        fontWeight ?? FontWeight.bold,
        color ?? colorText);
  }
}

extension TextStyleExtension on TextStyle {
  custom(String fontFamily, double fontSize, double letterSpacing,
      FontWeight fontWeight, Color color) {
    return GoogleFonts.getFont(fontFamily,
        fontSize: fontSize,
        letterSpacing: letterSpacing,
        fontWeight: fontWeight,
        color: color);
  }
}
