import 'package:e_commerce_app/model/apiModels.dart';

import 'package:e_commerce_app/controller/provierpage.dart';
import 'package:e_commerce_app/controller/provierpage.dart';
import 'package:e_commerce_app/views/homepage/grindview.dart';

import 'package:e_commerce_app/constants/color.dart';
import 'package:e_commerce_app/controller/provierpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:number_selection/number_selection.dart';
import 'package:e_commerce_app/views/SecondPage/detailPage.dart';
import 'package:provider/provider.dart';

// List<int> count = [];

class CartPage extends StatelessWidget {
  CartPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final gettingProvider = Provider.of<DataProvider>(context);
    gettingProvider.loadSF();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: bcolor),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            "My Cart",
            style: TextStyle(color: bcolor),
          ),
          actions:const [
             Padding(
              padding: EdgeInsets.only(right: 12),
              child: CircleAvatar(
                backgroundColor: Colors.red,
              ),
            )
          ],
          elevation: 0,
        ),
        body: Consumer<DataProvider>(
          builder: (context, getdata, child) => Column(
            children: [
              Container(
                width: double.infinity,
                height: 600,
                color: const Color.fromARGB(255, 255, 255, 255),
                child: ListView.builder(
                  itemCount: getdata.CartSample.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        width: double.infinity,
                        height: 125,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          children: [ 
                            Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: Container(
                                width: 110,
                                height: 120,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                    ),
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(
                                          gettingProvider.data.products[gettingProvider.CartSample[index]].thumbnail,
                                        )),
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            ),
                            Container(
                              width: 150,
                              height: 100,
                              color: Colors.transparent,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    gettingProvider.data.products[gettingProvider.CartSample[index]].title,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 6),
                                    child: Text(
                                      "\$ " +
                                          '${gettingProvider.data.products[gettingProvider.CartSample[index]].price}',
                                      style: const TextStyle(fontSize: 17),
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        getdata.removeitem(index);
                                      },
                                      icon: const Icon(Icons.delete_rounded))
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Container(
                                width: 40,
                                height: 70,
                                child: NumberSelection(
                                  theme: NumberSelectionTheme(
                                      draggableCircleColor: Colors.white,
                                      iconsColor: Colors.black,
                                      numberColor: Colors.red,
                                      backgroundColor:
                                          const Color.fromARGB(255, 157, 154, 154)),
                                  initialValue: 1,
                                  minValue: 0,
                                  maxValue: 10,
                                  direction: Axis.vertical,
                                  withSpring: true,
                                  onChanged: (int initialValue) {
                                    if (initialValue == 0) {
                                      getdata.removeitem(index);
                                    }
                                    print("value: $initialValue");
                                    enableOnOutOfConstraintsAnimation:
                                    true;
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const Divider(
                thickness: 3,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:const [
                     Text(
                      "Total",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                     Text(
                      "\$ 5009",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 50,
                width: 220,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    ),
                  ),
                  child: const Text(
                    'Place Order',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
