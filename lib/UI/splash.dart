import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mentaltraining/HomeScreen.dart';
import 'package:mentaltraining/Resources/color_resource.dart';
import 'package:mentaltraining/Resources/image_resource.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  goNext() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return HomeScreen(0, true, false, false, false);
        },
      ));
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    goNext();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColor.white,
      statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
      statusBarBrightness: Brightness.light, // F
    ));
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Column(
        children: [
          Center(
              child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Image.asset(splashImg)))
        ],
      ),
    );
  }
}
