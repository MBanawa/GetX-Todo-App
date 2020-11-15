import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'package:flutter_getx_todo_app/screens/home_screen.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
  ));
}
