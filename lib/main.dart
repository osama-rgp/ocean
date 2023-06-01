import 'package:projectfinal/log_in.dart';
import 'package:flutter/material.dart';
import 'package:projectfinal/managers/colors.dart';

import 'managers/single_product.dart';

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
        home: SingleProduct()
    );

  }
}