import 'package:flutter/material.dart';

class GeneralStyles {
  double letterSpacing = 0;


  OutlineInputBorder _buildBorder(Color color) {
    return OutlineInputBorder(
        borderSide: BorderSide(color: color, width: 1.0),
        borderRadius: BorderRadius.all(Radius.circular(20)));
  }

  TextStyle _builtTextStyles(Color color, {double size = 16.0}) {
    return TextStyle(fontFamily:'Bebas Neue',color: color, fontSize: size);
  }

  InputDecorationTheme theme() => InputDecorationTheme(
      contentPadding: EdgeInsets.all(20),
      isDense: true,
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      constraints: BoxConstraints(maxWidth: 800),
      enabledBorder: _buildBorder(Colors.white38),
      errorBorder: _buildBorder(Colors.red),
      focusedBorder: _buildBorder(Colors.white),
  suffixStyle: _builtTextStyles(Colors.white),
  labelStyle: _builtTextStyles(Colors.white30),
  prefixStyle: _builtTextStyles(Colors.white),
  floatingLabelStyle: _builtTextStyles(Colors.white),
  hintStyle: _builtTextStyles(Colors.white24));

}
