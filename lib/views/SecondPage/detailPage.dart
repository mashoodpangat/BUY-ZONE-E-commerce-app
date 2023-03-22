import 'dart:convert';
import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/views/CartPage/cartPage.dart';
import 'package:e_commerce_app/views/homepage/grindview.dart';
import 'package:e_commerce_app/views/homepage/homepage.dart';
import 'package:e_commerce_app/model/apiModels.dart';
import 'package:e_commerce_app/constants/color.dart';

import 'package:e_commerce_app/controller/provierpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({super.key, required this.index});

  final int index;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: bcolor),
        title: const Center(
          child: Padding(
            padding: EdgeInsets.only(right: 45),
            child: Text(
              'Prodect Details',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CartPage(),
              ));
            },
            icon: const Icon(Icons.shopping_cart_rounded),
            color: Colors.black,
          ),
        ],
      ),
      body: Consumer<DataProvider>(builder: (context, getdata, child) {
        getdata.fetchApi();
        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 80,
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(
                      getdata.data.products[buttonindex].title,
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      getdata.data.products[buttonindex].brand,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CarouselSlider(
                  items: <Widget>[
                    for (var i = 0;
                        i < getdata.data.products[buttonindex].images.length;
                        i++)
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          image: DecorationImage(
                              image: NetworkImage(
                                  getdata.data.products[buttonindex].images[i]),
                              fit: BoxFit.fill),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                  ],
                  options: CarouselOptions(
                    aspectRatio: 3 / 4,
                    height: 240,
                    viewportFraction: 0.9,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 1000),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 12, right: 12),
                child: Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 177, 199, 212),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 80,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 177, 199, 212),
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            title: Text(
                              '\$ '
                              '${getdata.data.products[buttonindex].price}',
                              style: const TextStyle(fontSize: 22),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Text(
                                  '${getdata.data.products[buttonindex].rating}'
                                  ' %',
                                  style: const TextStyle(fontSize: 18)),
                            ),
                            trailing: Text(
                                '${getdata.data.products[buttonindex].stock}'
                                ' item in stock'),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding:
                                    const EdgeInsets.only(top: 17, left: 17),
                                child: Row(
                                  children: [
                                    RatingBar.builder(
                                        initialRating: getdata
                                            .data.products[buttonindex].rating,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemSize: 20,
                                        itemBuilder: (context, _) {
                                          return const Icon(
                                            Icons.star,
                                            color: Colors.black,
                                          );
                                        },
                                        onRatingUpdate: (rating) {}),
                                    Text(
                                        ' ${getdata.data.products[buttonindex].rating}')
                                  ],
                                )),
                            const Padding(
                              padding:
                                  EdgeInsets.only(top: 15, left: 15, bottom: 8),
                              child: Text(
                                'Description',
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Color.fromARGB(255, 76, 73, 73)),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 10),
                              child: Text(
                                getdata.data.products[buttonindex].description,
                                style: const TextStyle(fontSize: 23),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 160,
                    height: 50,
                    color: Colors.transparent,
                    child: ElevatedButton(
                      onPressed: () {
                        print(getdata.CartSample);
                        buttonindex = widget.index;
                        //  getdata.addeditemlist();

                        getdata.saveSF();
                        var existingIndex = getdata.CartSample.indexWhere(
                            (id) =>
                                id ==
                                getdata.data.products[widget.index].id - 1);
                        // print(CartPage);
                        if (existingIndex != -1) {  
                          return;
                        } else {
                          getdata.CartSample.add(
                              getdata.data.products[widget.index].id - 1);
                          getdata.saveSF();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Add to Cart',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  Container(
                    width: 160,
                    height: 50,
                    color: Colors.transparent,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12), // <-- Radius
                        ),
                      ),
                      child: const Text(
                        'Buy Now',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      }),
    ));
  }
}
