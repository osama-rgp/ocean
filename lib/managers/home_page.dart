import 'package:flutter/material.dart';
import 'package:projectfinal/managers/assets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(),
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
        body: SizedBox(
          // width: 100,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Image.asset(AssetsManager.filter),
                  ),
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
                          hintStyle: TextStyle(
                            color: Color(0xff000000),
                            fontSize: 16,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7))),
                    ),
                  )
                ],
              ),
              Expanded(
                child: SizedBox(
                  child: ListView.builder(
                      itemBuilder: (context, index) => Padding(
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
                                      child: Image.network(
                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRO-hlLa1mnf2V1p__dFMxkNjf44wHphOxH2g&usqp=CAU",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(

                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text("25000",style: TextStyle(color: Colors.green),),
                                              Text("أسمنت أبيض",style: TextStyle(color: Colors.white),)
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Text("#الصنف",style: TextStyle(color:Colors.white),),
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )),
                ),
              )
            ],
          ),
        ));
  }
}
