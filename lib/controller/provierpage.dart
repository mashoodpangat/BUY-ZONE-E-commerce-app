// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:e_commerce_app/model/apiModels.dart';
import 'package:e_commerce_app/views/homepage/grindview.dart';

import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

enum providerstatus { LOADING, COMPLETED }

class DataProvider extends ChangeNotifier {
  List<Product> mylist = [];
  late ECommerce data;
  late SharedPreferences _prefs;
  String? temp;

  providerstatus status = providerstatus.LOADING;

  fetchApi() async {
    final response =
        await http.get(Uri.parse('https://dummyjson.com/products'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      data = eCommerceFromJson((response.body));
      status = providerstatus.COMPLETED;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load');
    }
    notifyListeners();
  }

  void addeditemlist() {
    mylist.add(data.products[buttonindex]);
    print(mylist);

    notifyListeners();
  }

  removeitem(int index) async {
    CartSample.removeAt(index);
    await saveSF();
    notifyListeners();
  }

  // void hive() async {
  //   Box<dynamic> box = await Hive.openBox('myBox');
  //   mylist.add(data.products[buttonindex]);
  //   box.put('myBox', mylist);

  //   notifyListeners();
  // }

  // saveToShared_Preferences() async {
  //   final s_prefs = await SharedPreferences.getInstance();
  //   await s_prefs.setString("KEY_1", mylist.toString());
  //   print(saveToShared_Preferences());
  //   notifyListeners();
  // }

  List<int> CartSample = [];

  Future<void> saveSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> stringNumbers = CartSample.map(
      (CartSample) => CartSample.toString(),
    ).toList();
    await prefs.setStringList("number", stringNumbers);
  }

  loadSF() async {
    _prefs = await SharedPreferences.getInstance();
    List<String>? stringNumbers = _prefs.getStringList("number");
    if (stringNumbers != null) {
      List<int> numbers = stringNumbers
          .map((stringNumbers) => int.parse(stringNumbers))
          .toList();
      CartSample = numbers;
    }
  }

//   showSavedValue() async {
//     prefs = await SharedPreferences.getInstance();

//     temp = prefs.getString("KEY_1").toString();

//     notifyListeners();
//   }
}
