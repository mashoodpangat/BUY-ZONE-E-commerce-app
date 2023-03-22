import 'package:e_commerce_app/views/CartPage/cartPage.dart';
import 'package:e_commerce_app/views/SecondPage/detailPage.dart';
import 'package:e_commerce_app/views/homepage/homepage.dart';
import 'package:e_commerce_app/model/apiModels.dart';
import 'package:e_commerce_app/constants/color.dart';
import 'package:e_commerce_app/controller/provierpage.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

int buttonindex = 0;

class GrindviewProduct extends StatelessWidget {
  const GrindviewProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 641,
      color: mcolor,
      child: Consumer<DataProvider>(builder: (context, getdata, child) {
        getdata.fetchApi();
        if (getdata.status == providerstatus.COMPLETED) {
          return GridView.builder(
            padding: const EdgeInsets.all(10),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: .61,
                crossAxisSpacing: 21,
                mainAxisSpacing: 30),
            itemCount: 30,
            itemBuilder: (BuildContext ctx, index) {
              return InkWell(
                onTap: () {
                  buttonindex = index;
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DetailsPage(index: index),
                  ));
                },
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(blurRadius: 10, offset: Offset(5, 5))
                    ],
                    color: Color.fromARGB(255, 241, 241, 241),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 175,
                        height: 180,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    getdata.data.products[index].thumbnail),
                                fit: BoxFit.fill),
                            borderRadius: BorderRadius.circular(16)),
                      ),
                      Container(
                        width: 175,
                        height: 106,
                        color: Colors.transparent,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              getdata.data.products[index].title,
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 26, 25, 25)),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  height: 50,
                                ),
                                Text(
                                  " \$ ${getdata.data.products[index].price}",
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 26, 25, 25)),
                                ),
                                const SizedBox(
                                  width: 40,
                                ),
                                SizedBox(
                                    width: 60,
                                    height: 35,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color.fromARGB(
                                              255, 0, 0, 0),
                                          shape: const StadiumBorder()),
                                      onPressed: () {
                                        buttonindex = index;
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) => CartPage(),
                                        ));
                                      },
                                      child: const Icon(
                                          Icons.shopping_cart_rounded),
                                    ))
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      }),
    );
  }
}
