import 'package:flutter/material.dart';
import 'package:projectfinal/managers/assets.dart';

import '../../core/common/models/product_model.dart';

class HomePageComponet extends StatelessWidget {
  final ProductModel product;

  const HomePageComponet({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: SizedBox(
          width: 700,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                height: 200,
                child: FadeInImage(
                  placeholder: const AssetImage(
                    AssetsManager.logo
                  ),
                    fit: BoxFit.fill,
                  imageErrorBuilder: (c,_,__)=>Image.asset(
                    AssetsManager.placeHolder,
                    fit: BoxFit.cover,
                  ),
                  image: NetworkImage(
                    product.image,
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          product.name,
                          style: const TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text(
                          "#الصنف",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          product.price,
                          style: const TextStyle(
                              color: Colors.green, fontSize: 25),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
