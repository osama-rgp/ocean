import 'package:projectfinal/features/login/log_in.dart';
import 'package:flutter/material.dart';
import 'package:projectfinal/managers/colors.dart';
import 'package:projectfinal/single_product.dart';

import 'features/home_page/home_page.dart';


void main(){
  runApp(  MyAPP());


}
class MyAPP extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: ColorsManager.background
      ),
        debugShowCheckedModeBanner: false,
        home:const HomePage()
    );

  }
}