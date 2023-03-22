import 'package:e_commerce_app/views/CartPage/cartPage.dart';
import 'package:e_commerce_app/views/SecondPage/detailPage.dart';
import 'package:e_commerce_app/views/homepage/drawer.dart';
import 'package:e_commerce_app/views/homepage/grindview.dart';
import 'package:e_commerce_app/model/apiModels.dart';
import 'package:e_commerce_app/constants/color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerPage(),
      backgroundColor: mcolor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "BUY ZONE",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: mcolor,
        leading: Builder(
          builder: (context) {
            return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(
                  Icons.menu,
                  color: Colors.black,
                ));
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 14),
            // child: CircleAvatar(
            //   backgroundImage: NetworkImage(
            //       FirebaseAuth.instance.currentUser!.photoURL ?? ""),
            //   backgroundColor: Colors.amber,
            //   radius: 25,
            // ),
          )
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              width: 350,
              height: 60,
              color: mcolor,
              child: TextField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(15)),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    hintText: "Search item",
                    fillColor: const Color.fromARGB(236, 233, 229, 229),
                    prefixIcon: const Icon(Icons.search)),
              ),
            ),
          ),
          const GrindviewProduct()
        ],
      ),
    );
  }
}
