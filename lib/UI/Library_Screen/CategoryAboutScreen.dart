import 'package:flutter/material.dart';

import '../../Custom Widget/customHeaderText.dart';
import '../../Resources/color_resource.dart';
import '../../Resources/image_resource.dart';
import '../../Resources/string_resource.dart';

class CategoryAboutScreen extends StatefulWidget {
  const CategoryAboutScreen({Key? key}) : super(key: key);

  @override
  State<CategoryAboutScreen> createState() => _CategoryAboutScreenState();
}

class _CategoryAboutScreenState extends State<CategoryAboutScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: Center(
                      child: customHeaderText(
                        btnLabel: about1,
                        color: AppColor.black,
                      ),
                    ),
                  ),
                  Positioned(
                      left: 20,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SizedBox(
                            height: 42, width: 42, child: Image.asset(backImg)),
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text(
                aboutDescription,
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: AppColor.greyLight),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
