import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'mainpage.dart';

void main() {
  runApp(GetMaterialApp(
      title: "Pokémone Démo App",
      theme: ThemeData(primaryColor: Colors.deepPurpleAccent),
      darkTheme: ThemeData(primaryColor: Colors.lime),
      home: MyHomePage()));
}
