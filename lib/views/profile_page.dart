import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(children: [
        Container(
            height: MediaQuery.of(context).size.height / 3.1,
            width: MediaQuery.of(context).size.width,
            color: Colors.transparent,
            child: Stack(children: [
              Container(
                height: MediaQuery.of(context).size.height / 3.8,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(150),
                      bottomRight: Radius.circular(150)),
                  color: Color.fromARGB(255, 39, 34, 33),
                ),
              ),
              const Positioned(
                left: 140,
                top: 160,
                child: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 92, 86, 86),
                  radius: 55,
                  child: Icon(
                    Icons.camera_alt_outlined,
                    size: 35,
                  ),
                ),
              )
            ]))

     
      ]),
    ));
  }
}
