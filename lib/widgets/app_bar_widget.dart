import 'package:flutter/material.dart';

AppBar appBar({
  required String title,
  bool? centerTitle = false,
  List<Widget>? actions,
}) {
  return AppBar(
    title: Text(title),
    centerTitle: centerTitle,
    actions: actions,
  );
}
