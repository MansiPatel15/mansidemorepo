import 'package:flutter/material.dart';
import 'package:mentaltraining/Resources/color_resource.dart';
import 'package:mentaltraining/UI/splash.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      fontFamily: 'MyriadPro',
      primaryColor: AppColor.blue,
    ),
    home: const Splash(),
  ));
}
