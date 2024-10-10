import 'package:dating_app/Resorces/app_color.dart';
import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final VoidCallback onTap;
  final double? hieght;
  final Color? bgColor;
  final Color? borderColor;
  final Widget btWidget;
  final TextStyle? style;
  const CommonButton({
    super.key,
    required this.onTap,
    this.hieght,
    this.bgColor,
    required this.btWidget,
    this.style,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onTap,
        child: Container(
          height: hieght ?? 48,
          decoration: BoxDecoration(
              color: bgColor ?? AppColors.black,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  width: 1, color: borderColor ?? Colors.transparent)),
          child: Center(child: btWidget),
        ));
  }
}
