import 'package:flutter/material.dart';

class GameButton {
  final id;
  String text;
  Color bg;
  Color txtClr;
  bool enabled;

  GameButton(
      {this.id, this.text = "", this.bg = Colors.grey, this.txtClr = Colors.white, this.enabled = true});
}
