import 'package:flutter/material.dart';
import 'package:projectfinal/managers/assets.dart';
import 'package:projectfinal/sin_up.dart';

import 'managers/home_page.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  PageController? pc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.only(top: 150),
                  child: Image(
                    image: AssetImage(AssetsManager.logo),
                    height: 200,
                    width: 400,
                  )),
              Text("تسجيل الدخول ",
                  style: TextStyle(
                      fontSize: 25,
                      color: Color(0xff4D3C3B),
                      height: -0.5,
                      fontWeight: FontWeight.bold,
                      shadows: [Shadow(color: Color(0xff000000))])),
              Container(
                  margin: EdgeInsets.only(top: 30),
                  padding: EdgeInsets.only(left: 60, right: 60),
                  child: TextFormField(

                    textDirection: TextDirection.rtl,
                    decoration: InputDecoration(
                        hintTextDirection: TextDirection.rtl,
                        hintText: " البريد الالكتروني ",
                        hintStyle: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 16,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7))),
                  )),
              Container(
                  padding: EdgeInsets.only(left: 60, right: 60, top: 30),
                  child: TextFormField(
                    textDirection: TextDirection.rtl,
                    decoration: InputDecoration(
                       hintTextDirection:TextDirection.rtl ,
                        hintText: " كلمة السر ",
                        hintStyle: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 16,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7))),
                  )),
              Container(
                  margin: EdgeInsets.only(top: 30),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (c)=>HomePage()));
                    },
                    child: Text("تسجيل الدخول", style: TextStyle(fontSize: 22)),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff6C6054),
                      padding: EdgeInsets.symmetric(horizontal: 75, vertical: 15),
                    ),
                  )) ,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [ TextButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (c)=>SecondTest()));
                },
                    child: Text("انشاء حساب جديد",style: TextStyle(fontSize: 16,color: Colors.red),)),
                  Text("ليس لديك حساب؟",style: TextStyle(fontSize: 16),)
              ],)

            ],
          ),
        ));
  }
}
