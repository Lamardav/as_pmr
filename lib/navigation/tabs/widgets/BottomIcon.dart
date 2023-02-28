import 'package:flutter/material.dart';

class BottomIcon extends StatelessWidget {
  final String srcPath;

  BottomIcon({required this.srcPath});

  @override
  Widget build(BuildContext context) {
    return Image.asset(srcPath, width: 24, height: 30, fit: BoxFit.fitWidth);
  }
}
