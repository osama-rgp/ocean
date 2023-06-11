import 'package:flutter/material.dart';
import 'package:projectfinal/core/managers/constant/cash_keys_constant.dart';
import 'package:projectfinal/managers/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/home_page/home_page.dart';
import 'features/login/log_in.dart';

void main() {
  runApp(const MyAPP());
}

class MyAPP extends StatefulWidget {
  const MyAPP({super.key});

  @override
  State<MyAPP> createState() => _MyAPPState();
}

class _MyAPPState extends State<MyAPP> {
  bool token = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: ColorsManager.background),
        debugShowCheckedModeBanner: false,
        home: token ? const HomePage() : const Login());
  }

  void init() async {
    final storage = await SharedPreferences.getInstance();
    token = storage.containsKey(CashKeys.token);
  }
}
