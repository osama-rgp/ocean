import 'package:flutter/material.dart';
import 'package:projectfinal/managers/assets.dart';

import 'features/home_page/home_page.dart';

class SingleProduct extends StatelessWidget {

  const SingleProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).pop();
          }, icon:Icon(Icons.arrow_back) , padding: EdgeInsets.only(right: 250)),
          Image.asset(
            width: 100,
            AssetsManager.logo,
            color: Colors.white,
          )
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              AssetsManager.product,
              width: double.maxFinite,
              fit: BoxFit.cover,
            ),
            Text(
              "رمل أحمر",
              style: TextStyle(fontSize: 35, color: Color(0xff6C6054), height: 2),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "الرمل",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.red,
                          ),
                        )),
                    Text(
                      " الصنف ",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      child: Text(
                        "ناعم ونظيف من الاوساخ ويعطي البناء منظر جميل",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Text(
                      " الوصف ",
                      style: TextStyle(fontSize: 20, color: Color(0xff6C6054)),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "50000",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Color(0xff2CDF3E)),
                    ),
                    Text("  السعر  ")
                  ],
                ),
                SizedBox(
                  width: 310,
                  height: 65,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "إضافة الى السلة ",
                      style: TextStyle(fontSize: 24),
                    ),
                    style: ElevatedButton.styleFrom(primary: Color(0xff6C6054)),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
