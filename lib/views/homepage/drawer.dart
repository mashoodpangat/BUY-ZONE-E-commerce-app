import 'package:e_commerce_app/controller/firebasemodelclass.dart';
import 'package:e_commerce_app/views/CartPage/cartPage.dart';
import 'package:e_commerce_app/views/LoginPage/loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final users = FirebaseAuth.instance.currentUser;
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                  'https://img.freepik.com/free-vector/colourful-dynamic-flow-background_52683-42964.jpg?w=2000',
                ),
              ),
            ),
            child: UserAccountsDrawerHeader(
                decoration: const BoxDecoration(color: Colors.transparent),
                accountName: Text(
                  FirebaseAuth.instance.currentUser!.displayName ?? "",
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                accountEmail: Text(
                  FirebaseAuth.instance.currentUser!.email ?? "",
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      FirebaseAuth.instance.currentUser!.photoURL ?? ""),
                ),
                currentAccountPictureSize: const Size.square(50)),
          ),
          const ListTile(
            leading: Icon(Icons.person),
            title: Text("My profile"),
          ),
          ListTile(
              leading: const Icon(Icons.card_travel),
              title: const Text("My Cart"),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CartPage(),
                  ))),
          const ListTile(
            leading: Icon(Icons.workspace_premium),
            title: Text("Go premium"),
          ),
          const ListTile(
            leading: Icon(Icons.desktop_mac),
            title: Text("Account Details"),
          ),
          const ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("log out"),
            // onTap: () => Navigator.of(context).push(MaterialPageRoute(
            //   builder: (context) => Loginpage(),
            // )),

            onTap: () async {
              await firebasegoogleauth().signout();
              // showDialog(
              //     context: context,
              //     builder: ((context) {
              //       return AlertDialog(
              //         title: const Text('LogOut'),
              //         content: const Text("Are you sure you want to logout"),
              //         actions: [
              //           IconButton(
              //               onPressed: () {
              //                 Navigator.pop(context);
              //               },
              //               icon: const Icon(
              //                 Icons.cancel,
              //                 color: Colors.red,
              //               )),
              //           IconButton(
              //               onPressed: () async {
              //                 await firebasegoogleauth().signout();

              //               },
              //               icon: const Icon(
              //                 Icons.done,
              //                 color: Colors.green,
              //               )),
              //         ],
              //       );
              //     }));
            },
          )
        ],
      ),
    );
  }
}
