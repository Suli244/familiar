import 'package:familiar/style/app_text_styles.dart';
import 'package:familiar/widgets/input_borders.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.inputFormatters,
    this.labelText,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.validator,
    this.isOutline = true,
    this.hintText,
    this.minLength,
    this.minLines,
    this.maxLines,
    this.initialValue, this.onChanged,
  });

  final List<TextInputFormatter>? inputFormatters;
  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final bool isOutline;
  final int? minLength;
  final int? minLines;
  final int? maxLines;
  final String? initialValue;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppTextStyles.s16W400(color: Colors.white),
      inputFormatters: inputFormatters,
      controller: controller,
      maxLength: minLength,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      minLines: minLines,
      maxLines: maxLines ?? 1,
      initialValue: initialValue,
      onChanged: onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTextStyles.s16W400(color: Colors.white.withOpacity(0.70)),
        labelText: labelText,
        border: isOutline
            ? InputBorders.outlineBorderColorE5E5E5Width1Radius10
            : InputBorders.unOutlineBorderColorE5E5E5Width1,
        enabledBorder: isOutline == true
            ? InputBorders.outlineBorderColorE5E5E5Width1Radius10
            : InputBorders.outlineBorderColorE5E5E5Width1Radius10,
        focusedBorder: isOutline == true
            ? InputBorders.outlineBorderColorGreenWidth2Radius10
            : InputBorders.unOutlineBorderColorGreenWidth2,
        focusedErrorBorder: isOutline == true
            ? InputBorders.outlineBordercolorF68080Width2Radius10
            : InputBorders.unOutlineBordercolorF68080Width2,
        errorBorder: isOutline == true
            ? InputBorders.outlineBordercolorF68080Width2Radius10
            : InputBorders.unOutlineBordercolorF68080Width2,
      ),
    );
  }
}
