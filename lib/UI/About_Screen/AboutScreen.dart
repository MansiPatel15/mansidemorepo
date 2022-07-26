import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mentaltraining/Custom%20Widget/CustomButtonUI.dart';
import 'package:mentaltraining/Custom%20Widget/customHeaderText.dart';
import 'package:mentaltraining/Resources/image_resource.dart';
import 'package:mentaltraining/Resources/string_resource.dart';

import '../../Resources/color_resource.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: AppColor.background));
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: Center(
                      child: customHeaderText(
                        btnLabel: about,
                        color: AppColor.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 50),
              child: Center(
                  child: Image.asset(
                logoImg,
                height: 200,
                width: 200,
              )),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                aboutBack,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColor.black,
                    fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                welcome,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColor.yellow,
                    fontSize: 30),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: SizedBox(
                height: 110,
                width: 348,
                child: Text(
                  welcomeBack,
                  style: TextStyle(
                    color: AppColor.greyLight,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 22,
            ),
            CustomButtonUI(
              color: AppColor.blue,
              onTap: () {},
              btnLabel: button4,
            )
          ],
        ),
      ),
    );
  }
}
