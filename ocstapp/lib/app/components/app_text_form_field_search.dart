import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextFormFieldSearch extends TextFormField {
  AppTextFormFieldSearch({
    ValueChanged<String> onChanged,
    FormFieldValidator<String> validator,
    @required String label,
    double borderRadius,
    double fontSize,
    EdgeInsets padding,
    TextEditingController controller,
    IconData icon,
    TextInputType keyboardType,
    bool apenasLetrasNumeros = false,
    String initialValue,
  }) : super(
          initialValue: initialValue,
          controller: controller,
          onChanged: onChanged,
          validator: validator,
          decoration: InputDecoration(
            prefixIcon: icon != null ? Icon(icon) : null,
            contentPadding: padding ??
                EdgeInsets.only(left: 0, top: 0, bottom: 0, right: 100),
            labelText: label,
            labelStyle: TextStyle(
              fontSize: fontSize ?? 20,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 30),
            ),
          ),
          keyboardType: keyboardType ?? TextInputType.text,
          inputFormatters: apenasLetrasNumeros
              ? [WhitelistingTextInputFormatter(RegExp("[a-zA-Z0-9]"))]
              : [],
        );
}
