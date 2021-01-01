import 'package:flutter/material.dart';
import 'package:nice_button/NiceButton.dart';

// ignore: must_be_immutable
class Buttons extends StatelessWidget {
  IconData _iconData;
  Function _function;
  Color _color;
  Buttons(this._iconData, this._function, this._color);
  @override
  Widget build(BuildContext context) {
    return NiceButton(
      width: 35,
      mini: true,
      icon: _iconData,
      background: _color,
      onPressed: _function,
      text: "",
    );
  }
}
