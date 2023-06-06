import 'package:flutter/material.dart';
import 'package:projectfinal/features/home_page/home_page_component.dart';
import 'package:projectfinal/features/home_page/home_page_remote_data_source.dart';
import 'package:projectfinal/managers/assets.dart';

import '../../core/common/models/product_model.dart';
import '../../core/models/product_model.dart';
import '../login/log_in.dart';
import '../login/login_remote_data_source.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          backgroundColor: Color(0xff736859),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    padding: EdgeInsets.only(top: 120, right: 10),
                    child: Image.asset(
                      AssetsManager.logo,
                      color: Color(0xfff3f3f3),
                    )),
                Divider(
                  color: Color(0xfff3f3f3),
                  indent: 20,
                  thickness: 1.5,
                  endIndent: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(13),
                  child: Text(
                    "OSAMA ALGADBAN",
                    style: TextStyle(fontSize: 30, color: Color(0xfff3f3f3)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "  osamagh5945@gmail.com  ",
                        style: TextStyle(color: Color(0xffF3F3F3), fontSize: 15),
                      ),
                      Icon(
                        Icons.email_outlined,
                        color: Color(0xffF3F3F3),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "  0941571735  ",
                        style: TextStyle(fontSize: 15, color: Color(0xffF3F3F3)),
                      ),
                      Icon(
                        Icons.phone,
                        color: Color(0xffF3F3F3),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        " AL_Tall ,RefDamasqs ",
                        style: TextStyle(fontSize: 15, color: Color(0xffF3F3F3)),
                      ),
                      Icon(
                        Icons.location_on_outlined,
                        color: Color(0xffF3F3F3),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 75,
                  color: Color(0xfff3f3f3),
                  indent: 20,
                  thickness: 1.5,
                  endIndent: 20,
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 400,
                      height: 60,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Color(0xff6C6054),
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      color: Colors.black,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(7),
                                    ))),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  " سلة المشتريات ",
                                  style: TextStyle(fontSize: 25),
                                ),
                                Icon(
                                  Icons.shopping_cart_outlined,
                                  color: Color(0xfff3f3f3),
                                )
                              ],
                            )),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 22,),
                SizedBox(
                  width: 400,
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xff6C6054),
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(7),
                                ))),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              " أصناف المنتجات ",
                              style: TextStyle(fontSize: 25),
                            ),
                            Icon(
                              Icons.filter_list,
                              color: Color(0xfff3f3f3),
                            )
                          ],
                        )),
                  ),
                ),
                SizedBox(height: 22,),
                SizedBox(
                  width: 400,
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(7),
                                ))),
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (c) => Login()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              " تسجيل الخروج ",
                              style: TextStyle(fontSize: 25),
                            ),
                            Icon(
                              Icons.logout,
                              color: Color(0xfff3f3f3),
                            )
                          ],
                        )),
                  ),
                ),
                Divider(
                  height: 75,
                  color: Color(0xfff3f3f3),
                  indent: 20,
                  thickness: 1.5,
                  endIndent: 20,
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          leading: Builder(builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
            );
          }),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            Image(
              image: AssetImage(AssetsManager.logo),
            )
          ],
        ),
        body:SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 70,
                        child: TextFormField(
                          textDirection: TextDirection.rtl,
                          decoration: InputDecoration(
                              suffixIcon: Icon(Icons.search),
                              contentPadding: EdgeInsets.all(4),
                              hintTextDirection: TextDirection.rtl,
                              hintText: " البحث  ",
                              hintStyle: const TextStyle(
                                color: Color(0xff000000),
                                fontSize: 16,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7))),
                        ),
                      )
                    ],
                  ),
                  FutureBuilder<List<ProductModel>>(
                    future:HomePageRemoteDataSource.getAllProducts() ,
                    builder: (context,snapshot) {
                      if(snapshot.connectionState == ConnectionState.waiting){
                        return const CircularProgressIndicator(
                          color: Colors.brown,
                        );
                      }
                      else if(snapshot.data?.isNotEmpty??false) {
                        return Expanded(
                        child: SizedBox(
                          child: ListView.builder(
                            itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) =>  HomePageComponet(
                                product: snapshot.data![index],
                              )),
                        ),
                      );
                      }
                      else {
                        return const Text("There is not product");
                      }
                    }
                  )
                ],
              ),
        ));
  }
}
