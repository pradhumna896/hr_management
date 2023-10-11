import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../core/app_export.dart';


class CustomPinCodeTextField extends StatelessWidget {
  CustomPinCodeTextField({
    Key? key,
    required this.context,
    required this.onChanged,
    this.alignment,
    this.margin,
    this.controller,
    this.textStyle,
    this.hintStyle,
    this.validator,
  }) : super(
          key: key,
        );

  final Alignment? alignment;

  final EdgeInsetsGeometry? margin;

  final BuildContext context;

  final TextEditingController? controller;

  final TextStyle? textStyle;

  final TextStyle? hintStyle;

  Function(String) onChanged;

  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: pinCodeTextFieldWidget,
          )
        : pinCodeTextFieldWidget;
  }

  Widget get pinCodeTextFieldWidget => Padding(
        padding: margin ?? EdgeInsets.zero,
        child: PinCodeTextField(
          appContext: context,
          controller: controller,
          length: 5,
          keyboardType: TextInputType.number,
          textStyle: textStyle ?? CustomTextStyles.titleLargeBlack90021,
          hintStyle: hintStyle ?? CustomTextStyles.titleLargeBlack90021,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
          enableActiveFill: true,
          pinTheme: PinTheme(
            fieldHeight: 40.h,
            fieldWidth: 40.h,
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(10.h),
            inactiveColor: theme.colorScheme.primary.withOpacity(0.25),
            activeColor: theme.colorScheme.primary.withOpacity(0.25),
            inactiveFillColor: appTheme.whiteA700.withOpacity(0.85),
            activeFillColor: appTheme.whiteA700.withOpacity(0.85),
            selectedColor: Colors.transparent,
          ),
          onChanged: (value) => onChanged(value),
          validator: validator,
        ),
      );
}
