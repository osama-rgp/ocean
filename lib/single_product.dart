import 'package:flutter/material.dart';
import 'package:projectfinal/core/common/models/product_model.dart';
import 'package:projectfinal/managers/assets.dart';

import 'features/home_page/home_page.dart';

class SingleProduct extends StatelessWidget {
  final ProductModel productModel;

  const SingleProduct({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back),
              padding: const EdgeInsets.only(right: 250)),
          Image.asset(
            AssetsManager.logo,
            width: 100,
            color: Colors.white,
          )
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              productModel.image,
              width: double.maxFinite,
              fit: BoxFit.cover,
            ),
            Text(
              productModel.name,
              style:
                  const TextStyle(fontSize: 35, color: Color(0xff6C6054), height: 2),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "الرمل",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.red,
                          ),
                        )),
                    const Text(
                      " الصنف ",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 200,
                      child: Text(
                       productModel.description,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
                    const Text(
                      " الوصف ",
                      style: TextStyle(fontSize: 20, color: Color(0xff6C6054)),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                     productModel.price,
                      style: const TextStyle(
                          decoration: TextDecoration.underline,
                          color: Color(0xff2CDF3E)),
                    ),
                    const Text("  السعر  ")
                  ],
                ),
                SizedBox(
                  width: 310,
                  height: 65,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "إضافة الى السلة ",
                      style: TextStyle(fontSize: 24),
                    ),
                    style: ElevatedButton.styleFrom(primary: const Color(0xff6C6054)),
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
