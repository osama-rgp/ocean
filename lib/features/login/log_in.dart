import 'package:flutter/material.dart';
import 'package:projectfinal/features/login/login_remote_data_source.dart';
import 'package:projectfinal/managers/assets.dart';
import 'package:projectfinal/features/sign_up/sin_up.dart';

import '../home_page/home_page.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  PageController? pc;
  bool _loading = false;
  final RemoteDataSource remoteDataSource = RemoteDataSource();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
              margin: const EdgeInsets.only(top: 150),
              child: const Image(
                image: AssetImage(AssetsManager.logo),
                height: 200,
                width: 400,
              )),
          const Text("تسجيل الدخول ",
              style: TextStyle(
                  fontSize: 25,
                  color: Color(0xff4D3C3B),
                  height: -0.5,
                  fontWeight: FontWeight.bold,
                  shadows: [Shadow(color: Color(0xff000000))])),
          Container(
              margin: const EdgeInsets.only(top: 30),
              padding: const EdgeInsets.only(left: 60, right: 60),
              child: TextFormField(
                controller: _emailController,
                textDirection: TextDirection.rtl,
                decoration: InputDecoration(
                    hintTextDirection: TextDirection.rtl,
                    hintText: " البريد الالكتروني ",
                    hintStyle: const TextStyle(
                      color: Color(0xff000000),
                      fontSize: 16,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7))),
              )),
          Container(
              padding: EdgeInsets.only(left: 60, right: 60, top: 30),
              child: TextFormField(
                controller: _passwordController,
                textDirection: TextDirection.rtl,
                decoration: InputDecoration(
                    hintTextDirection: TextDirection.rtl,
                    hintText: " كلمة السر ",
                    hintStyle: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 16,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7))),
              )),
          _loading
              ? CircularProgressIndicator(
                  color: Colors.brown,
                )
              : Container(
                  margin: EdgeInsets.only(top: 30),
                  child: ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        _loading = true;
                      });
                      final res = await remoteDataSource.login(
                          _emailController.text, _passwordController.text);
                      print(res);
                      if (res['error'] != null) {
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(res['error'].toString())));
                      }else{
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (c) => const HomePage()));
                      }
                      setState(() {
                        _loading = false;
                      });

                    },
                    child: Text("تسجيل الدخول", style: TextStyle(fontSize: 22)),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff6C6054),
                      padding:
                          EdgeInsets.symmetric(horizontal: 75, vertical: 15),
                    ),
                  )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (c) => SecondTest()));
                  },
                  child: Text(
                    "انشاء حساب جديد",
                    style: TextStyle(fontSize: 16, color: Colors.red),
                  )),
              Text(
                "ليس لديك حساب؟",
                style: TextStyle(fontSize: 16),
              )
            ],
          )
        ],
      ),
    ));
  }
}
