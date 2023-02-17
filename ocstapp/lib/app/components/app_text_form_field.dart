import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextFormField extends TextFormField {
  AppTextFormField({
    ValueChanged<String> onChanged,
    FormFieldValidator<String> validator,
    @required String label,
    bool obscureText,
    double borderRadius,
    double fontSize,
    EdgeInsets padding,
    TextEditingController controller,
    IconData icon,
    TextInputType keyboardType,
    bool apenasLetrasNumeros = false,
    bool apenasCodigos = false,
    bool apenasValores = false,
    String initialValue,
  }) : super(
          initialValue: initialValue,
          controller: controller,
          onChanged: onChanged,
          validator: validator,
          obscureText: obscureText ?? false,
          decoration: new InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 30),
              borderSide: BorderSide(color: Colors.black, width: 0.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 30),
              borderSide: BorderSide(color: Colors.black, width: 1.0),
            ),
            prefixIcon: icon != null
                ? Icon(
                    icon,
                    color: Colors.black,
                  )
                : null,
            contentPadding:
                padding ?? EdgeInsets.only(left: 30, top: 20, bottom: 20),
            labelText: label,
            labelStyle:
                TextStyle(fontSize: fontSize ?? 20, color: Colors.black),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 30),
              borderSide: BorderSide(color: Colors.black, width: 1.0),
            ),
          ),
          keyboardType: keyboardType ?? TextInputType.text,
          inputFormatters: apenasLetrasNumeros
              ? [WhitelistingTextInputFormatter(RegExp("[a-zA-Z0-9]"))]
              : apenasCodigos
                  ? [WhitelistingTextInputFormatter(RegExp("[a-zA-Z0-9\-\.]"))]
                  : apenasValores
                      ? [
                          WhitelistingTextInputFormatter(
                              RegExp("[a-zA-Z0-9\,]"))
                        ]
                      : [],
        );
}
