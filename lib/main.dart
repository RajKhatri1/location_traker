import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location_traker/screen/Homepage/view/Home_screen.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes:{
        '/' : (p0) => Homescreen(),
      } ,

    )
  );
}

