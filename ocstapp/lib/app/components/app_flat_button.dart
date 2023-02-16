import 'package:flutter/material.dart';
import 'package:OCSTApp/app/utils/theme_utils.dart';

class AppFlatButton extends FlatButton {
  AppFlatButton({
    String label,
    Color color,
    @required VoidCallback onPressed,
  }) : super(
          color: color ?? ThemeUtils.primaryColor,
          textColor: Colors.black,
          child: Container(
              width: double.infinity,
              height: 60,
              child: Center(
                  child: Text(label,
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w300)))),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: BorderSide(color: Colors.black38),
          ),
          onPressed: onPressed,
        );
}
