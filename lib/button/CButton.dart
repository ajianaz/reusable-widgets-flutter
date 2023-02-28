import 'package:flutter/material.dart';
import 'package:reusable_widgets_flutter/button/CButtonStyle.dart';
import 'package:reusable_widgets_flutter/reusable_widgets_flutter.dart';

enum ButtonShape { filled, outlined }

enum ButtonType { icon, noIcon }

class CButton extends StatelessWidget {
  final ButtonType? type;
  final ButtonShape? typeButton;
  final String text;
  final Function() onPressed;
  final Function()? onLongPress;
  ButtonStyle? buttonStyle;
  final Widget? icon;
  final FocusNode? focusNode;

  final Widget? child;
  final TextAlign? textAlign;
  final Color? textColor;
  final double? fontSize;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final TextStyle? textStyle;

  CButton(this.onPressed,
      this.text, {
        super.key,
        this.type = ButtonType.noIcon,
        this.typeButton = ButtonShape.filled,
        this.onLongPress,
        this.icon,
        this.focusNode,
        this.buttonStyle,
        this.child,
        this.textColor,
        this.textAlign,
        this.fontSize,
        this.fontFamily,
        this.fontWeight,
        this.textStyle,
      });

  CButton.icon(this.onPressed,
      this.text,
      this.icon, {
        super.key,
        this.type = ButtonType.icon,
        this.typeButton = ButtonShape.filled,
        this.onLongPress,
        this.focusNode,
        this.buttonStyle,
        this.child,
        this.textColor,
        this.textAlign,
        this.fontSize,
        this.fontFamily,
        this.fontWeight,
        this.textStyle,
      });

  @override
  Widget build(BuildContext context) {
    Widget button = CText(
      text,
      textAlign: textAlign ?? TextAlign.center,
      style: textStyle ??
          CTextStyle.body(
              color: textColor ?? (typeButton==ButtonShape.filled ? Colors.white : colorPrimary) ,
              fontSize: fontSize,
              fontFamily: fontFamily,
              fontWeight: fontWeight),
    );

    if (buttonStyle == null) {
      if (typeButton == ButtonShape.filled) {
        buttonStyle = CButtonStyle.filled();
      } else {
        buttonStyle = CButtonStyle.outline();
      }
    }

    switch (type) {
      case ButtonType.icon:
        return ElevatedButton.icon(
          icon: icon!,
          onPressed: onPressed,
          onLongPress: onLongPress,
          style: buttonStyle,
          label: child ?? button,
        );
      default:
        return ElevatedButton(
          onPressed: onPressed,
          style: buttonStyle,
          onLongPress: onLongPress,
          child: child ?? button,
        );
    }
  }
}
