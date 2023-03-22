import 'package:e_commerce_app/model/apiModels.dart';
import 'package:e_commerce_app/views/splash_scrren.dart';
import 'package:e_commerce_app/views/LoginPage/RegistrationPage.dart';
import 'package:e_commerce_app/views/LoginPage/loginpage.dart';
import 'package:e_commerce_app/views/SecondPage/detailPage.dart';
import 'package:e_commerce_app/views/homepage/homepage.dart';
import 'package:e_commerce_app/controller/provierpage.dart';
import 'package:e_commerce_app/views/profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DataProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
