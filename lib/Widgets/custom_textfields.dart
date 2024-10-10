import 'package:dating_app/Core/Config/size_config.dart';
import 'package:dating_app/Resorces/app_color.dart';
import 'package:dating_app/Resorces/app_style.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    required this.controller,
    this.fillColor,
    this.textInputType,
    this.prifixIcon,
    this.suffixIcon,
    required this.obscureText,
    this.onChanged,
    this.maxLangth,
    required this.readOnly,
    this.labelText,
    this.labelStyle,
    this.focusNode,
    this.fieldsubmittted,
    required Color cursorColor,
    required this.hintStyle,
    required this.textColor,
    this.validator,
    this.errorText,
    this.maxLines,
    this.borderColor,
  });
  final String? hintText;
  final Widget? labelText;
  final TextStyle? labelStyle;
  final TextEditingController controller;
  final Color? fillColor;
  final TextInputType? textInputType;
  final Widget? prifixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final void Function(String)? onChanged;
  final int? maxLangth;
  final bool readOnly;
  final FocusNode? focusNode;
  final void Function(String)? fieldsubmittted;
  final TextStyle hintStyle;
  final Color textColor;
  final String? Function(String?)? validator;
  final String? errorText;
  final int? maxLines;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return TextFormField(
      focusNode: focusNode,
      onFieldSubmitted: fieldsubmittted,
      readOnly: readOnly,
      validator: validator,
      minLines: 1,
      maxLines: maxLines,
      textInputAction: TextInputAction.next,
      controller: controller,
      textCapitalization: TextCapitalization.sentences,
      keyboardType: textInputType,
      obscureText: obscureText,
      onChanged: onChanged,
      maxLength: maxLangth,
      cursorHeight: 15,
      cursorRadius: Radius.zero,
      cursorColor: AppColors.black,
      style: AppStyles.of(context).figtreeRegular.copyWith(
          fontSize: 15,
          height: 1.0,
          color: textColor,
          fontWeight: FontWeight.w400),
      decoration: InputDecoration(
          //contentPadding: EdgeInsets.only(left: 18, top: 8, bottom: 2),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
          counter: const Offstage(),
          hintText: hintText,
          filled: true,
          label: labelText,
          labelStyle: labelStyle,
          fillColor: fillColor,
          prefixIcon: prifixIcon,
          suffixIcon: suffixIcon,
          hintStyle: hintStyle,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: borderColor ?? AppColors.black,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: borderColor ?? AppColors.black,
              width: 1,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: borderColor ?? AppColors.black,
              width: 1,
            ),
          ),
          errorText: errorText),
    );
  }
}
