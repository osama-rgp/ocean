import 'package:flutter/material.dart';
import 'package:projectfinal/features/home_page/home_page_component.dart';
import 'package:projectfinal/features/home_page/home_page_remote_data_source.dart';
import 'package:projectfinal/managers/assets.dart';
import 'package:projectfinal/single_product.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/common/models/product_model.dart';
import '../login/log_in.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          backgroundColor: const Color(0xff736859),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    padding: const EdgeInsets.only(top: 120, right: 10),
                    child: Image.asset(
                      AssetsManager.logo,
                      color: const Color(0xfff3f3f3),
                    )),
                Column(
                  children: [
                    SizedBox(
                      width: 400,
                      height: 60,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff6C6054),
                                shape: const RoundedRectangleBorder(
                                    side: BorderSide(
                                      color: Colors.black,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(7),
                                    ))),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
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
                const SizedBox(
                  height: 22,
                ),
                SizedBox(
                  width: 400,
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff6C6054),
                            shape: const RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(7),
                                ))),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
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
                const SizedBox(
                  height: 22,
                ),
                SizedBox(
                  width: 400,
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: const RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(7),
                                ))),
                        onPressed: () async {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (c) => const Login()));
                          final storage = await SharedPreferences.getInstance();
                          await storage.clear();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
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
                const Divider(
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
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              ),
            );
          }),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: const [
            Image(
              image: AssetImage(AssetsManager.logo),
            )
          ],
        ),
        body: SizedBox(
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
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          filteredProducts = allProducts
                              .where((element) =>
                                  element.name.toLowerCase().contains(value.toLowerCase()))
                              .toList();
                        } else {
                          filteredProducts = allProducts;
                        }
                        setState(() {});
                      },
                      textDirection: TextDirection.rtl,
                      decoration: InputDecoration(
                          suffixIcon: const Icon(Icons.search),
                          contentPadding: const EdgeInsets.all(4),
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
                  future: HomePageRemoteDataSource.getAllProducts(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator(
                        color: Colors.brown,
                      );
                    } else if (snapshot.data?.isNotEmpty ?? false) {
                      return Expanded(
                        child: SizedBox(
                          child: ListView.builder(
                              itemCount: filteredProducts.length,
                              itemBuilder: (context, index) => InkWell(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                              builder: (c) => SingleProduct(
                                                    productModel:
                                                        filteredProducts[index],
                                                  )));
                                    },
                                    child: HomePageComponet(
                                      product: filteredProducts[index],
                                    ),
                                  )),
                        ),
                      );
                    } else {
                      return const Text("There is not product");
                    }
                  })
            ],
          ),
        ));
  }
}
