import 'package:flutter/material.dart';
import 'package:reusable_widgets_flutter/reusable_widgets_flutter.dart';
import 'package:reusable_widgets_flutter/text_field/CTextFieldStyle.dart';

class CTextField extends StatefulWidget {
  final String type;
  final TextEditingController? controller;

  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  bool readOnly;
  bool obscureText;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final Function()? onEditingComplete;
  final Function(String)? onChange;
  final Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final AutovalidateMode? autoValidateMode;
  final bool? enabled;
  final Function()? onTap;
  final FocusNode? focusNode;
  final TextCapitalization? textCapitalization;

  final InputDecoration? decoration;
  final TextStyle? styleHint;
  final String? hintText;
  Widget? suffixIcon;
  final IconData? suffixIconPasswordEye;
  final IconData? suffixIconPasswordEyeOff;
  final Color? suffixIconColor;
  final Widget? prefixIcon;
  final Color? prefixIconColor;
  bool filled;
  final Color? fillColor;
  final Color? focusColor;
  OutlineInputBorder? border;
  OutlineInputBorder? enabledBorder;
  OutlineInputBorder? focusBorder;
  OutlineInputBorder? errorBorder;

  CTextField(
      {Key? key,
      this.type = "CUSTOM",
      this.controller,
      this.decoration,
      this.hintText,
      this.keyboardType,
      this.textInputAction = TextInputAction.next,
      this.style,
      this.styleHint,
      this.readOnly = false,
      this.obscureText = false,
      this.maxLines,
      this.minLines,
      this.maxLength,
      this.onEditingComplete,
      this.onFieldSubmitted,
      this.validator,
      this.autoValidateMode,
      this.enabled,
      this.onTap,
      this.onChange,
      this.focusNode,
      this.suffixIcon,
      this.suffixIconPasswordEye,
      this.suffixIconPasswordEyeOff,
      this.suffixIconColor,
      this.prefixIcon,
      this.prefixIconColor,
      this.textCapitalization,
      this.filled = true,
      this.fillColor = Colors.white,
      this.focusColor = Colors.white,
      this.border,
      this.enabledBorder,
      this.focusBorder,
      this.errorBorder})
      : assert(decoration != null || hintText != null,
            "Decoration / Hint, hanya boleh diisi salah satu");

  CTextField.password(
      {Key? key,
      this.type = "PASSWORD",
      this.controller,
      this.decoration,
      this.hintText,
      this.keyboardType,
      this.textInputAction = TextInputAction.next,
      this.style,
      this.styleHint,
      this.readOnly = false,
      this.obscureText = true,
      this.maxLines = 1,
      this.minLines,
      this.maxLength,
      this.onChange,
      this.onEditingComplete,
      this.onFieldSubmitted,
      this.validator,
      this.autoValidateMode,
      this.enabled,
      this.onTap,
      this.focusNode,
      this.suffixIcon,
      this.suffixIconPasswordEye,
      this.suffixIconPasswordEyeOff,
      this.suffixIconColor,
      this.prefixIcon,
      this.prefixIconColor,
      this.textCapitalization,
      this.filled = true,
      this.fillColor = Colors.white,
      this.focusColor = Colors.white,
      this.border,
      this.enabledBorder,
      this.focusBorder,
      this.errorBorder})
      : assert(decoration != null || hintText != null,
            "Hanya boleh diisi salah satu");

  @override
  State<CTextField> createState() => CTextFieldState();
}

class CTextFieldState extends State<CTextField> {
  void _togglePasswordView() {
    setState(() {
      widget.obscureText = !widget.obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    InputDecoration? defaultDecoration = CTextFieldStyle.setDefaultDecoration(
        hintStyle: widget.styleHint,
        hintText: widget.hintText,
        fillColor: Colors.white,
        filled: true,
        focusColor: Colors.white,
        border: widget.border,
        enabledBorder: widget.enabledBorder,
        errorBorder: widget.errorBorder,
        focusBorder: widget.focusBorder,
        suffixIcon: widget.type == "PASSWORD"
            ? InkWell(
                onTap: () {
                  _togglePasswordView();
                },
                child: CTextFieldStyle.getIconEye(widget.obscureText,
                    iconEye: widget.suffixIconPasswordEye,
                    iconEyeOff: widget.suffixIconPasswordEyeOff,
                    color: widget.suffixIconColor),
              )
            : widget.suffixIcon,
        prefixIcon: widget.prefixIcon);

    if (widget.decoration != null) {
      defaultDecoration = widget.decoration;
    }

    return TextFormField(
      controller: widget.controller,
      decoration: defaultDecoration,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      style: widget.style ?? CTextStyle.body(),
      readOnly: widget.readOnly,
      obscureText: widget.obscureText,
      maxLines: widget.maxLines,
      minLines: widget.minLines ?? 1,
      cursorColor: colorPrimary,
      onEditingComplete: widget.onEditingComplete,
      onFieldSubmitted: widget.onFieldSubmitted,
      validator: widget.validator,
      autovalidateMode: widget.autoValidateMode,
      enabled: widget.enabled,
      focusNode: widget.focusNode,
      onTap: widget.onTap,
      onChanged: widget.onChange,
      textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
    );
  }
}
