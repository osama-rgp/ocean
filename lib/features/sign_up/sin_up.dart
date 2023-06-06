import 'package:flutter/material.dart';
import 'package:projectfinal/managers/assets.dart';

class SecondTest extends StatelessWidget {
  const SecondTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
      children: [
          Image(
            image: AssetImage(AssetsManager.logo),
            width: 400,
            height: 300,
          ),
          Text(
            "انشاء حساب جديد",
            style: TextStyle(fontSize: 32, height: -3, color: Color(0xff4D3C3B)),
          ),
          SizedBox(
            width: 500,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 125,
                  height: 50,
                  child: TextFormField(
                    textDirection: TextDirection.rtl,
                    decoration: InputDecoration(
                        hintTextDirection: TextDirection.rtl,
                        hintText: "الكنية",
                        hintStyle: TextStyle(fontSize: 16),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 1),
                  child: SizedBox(
                    width: 125,
                    height: 50,
                    child: TextFormField(
                        textDirection: TextDirection.rtl,
                        decoration: InputDecoration(
                            hintTextDirection: TextDirection.rtl,
                            hintText: "الأسم",
                            hintStyle: TextStyle(fontSize: 16),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7)))),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25) ,
            child: SizedBox(
              width: 305,
              height: 50,
              child: TextFormField(
                textDirection: TextDirection.rtl,
                decoration: InputDecoration(
                    hintTextDirection: TextDirection.rtl,
                    hintText: "العنوان",
                    hintStyle: TextStyle(fontSize: 16),
                    border:
                        OutlineInputBorder(borderRadius: BorderRadius.circular(7))),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25) ,
            child: SizedBox(
              width: 305,
              height: 50,
              child: TextFormField(
                textDirection: TextDirection.rtl,
                decoration: InputDecoration(
                    hintTextDirection: TextDirection.rtl,
                    hintText: "الهاتف",
                    hintStyle: TextStyle(fontSize: 16),
                    border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(7))),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25) ,
            child: SizedBox(
              width: 305,
              height: 50,
              child: TextFormField(
                textDirection: TextDirection.rtl,
                decoration: InputDecoration(
                    hintTextDirection: TextDirection.rtl,
                    hintText: "البريد الالكتروني",
                    hintStyle: TextStyle(fontSize: 16),
                    border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(7))),
              ),
            ),
          ),
        Padding(
          padding: const EdgeInsets.only(top: 25) ,
          child: SizedBox(
            width: 305,
            height: 50,
            child: TextFormField(
              textDirection: TextDirection.rtl,
              decoration: InputDecoration(
                  hintTextDirection: TextDirection.rtl,
                  hintText: "كلمة السر",
                  hintStyle: TextStyle(fontSize: 16),
                  border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(7))),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25) ,
          child: SizedBox(
            width: 305,
            height: 50,
            child: TextFormField(
              textDirection: TextDirection.rtl,
              decoration: InputDecoration(
                  hintTextDirection: TextDirection.rtl,
                  hintText: "اعادة كلمة السر",
                  hintStyle: TextStyle(fontSize: 16),
                  border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(7))),
            ),
          ),
        ),

        Container(
            margin: EdgeInsets.only(top: 30),
            child: ElevatedButton(
              onPressed: () {},
              child: Text("انشاء حساب جديد", style: TextStyle(fontSize: 22)),
              style: ElevatedButton.styleFrom(
                primary: Color(0xff6C6054),
                padding: EdgeInsets.symmetric(horizontal: 75, vertical: 15),
              ),
            )) ,

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ TextButton(onPressed: (){
            Navigator.of(context).pop();
          },
              child: Text("تسجيل الدخول",style: TextStyle(fontSize: 16,color: Colors.red),)),
            Text("لديك حساب؟",style: TextStyle(fontSize: 16),)
          ],)

      ],
    ),
        ));
  }
}
