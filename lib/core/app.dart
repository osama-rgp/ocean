import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp._internal();

  static const MyApp instance = MyApp._internal();

  @override
  Widget build(BuildContext context) {
    return const MaterialApp();
  }
}
