import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:mentaltraining/Custom%20Widget/CustomButtonUI.dart';
import 'package:mentaltraining/Custom%20Widget/customHeaderText.dart';
import 'package:mentaltraining/HomeScreen.dart';
import 'package:mentaltraining/Resources/color_resource.dart';
import 'package:mentaltraining/Resources/string_resource.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Model/SubCategoryResponse.dart';
import '../../Resources/image_resource.dart';

class AudioScreen extends StatefulWidget {
  SubItems? subCategory;

  AudioScreen({Key? key, this.subCategory}) : super(key: key);

  @override
  State<AudioScreen> createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  var color = AppColor.blue;
  var label = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    label = r"$ " + widget.subCategory!.price.toString();
  }

  @override
  Widget build(BuildContext context) {
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
                    child: Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(left: 80),
                      child: customHeaderText(
                        btnLabel: widget.subCategory!.name,
                        color: AppColor.black,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Image.asset(
                        backImg,
                        height: 42,
                        width: 42,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Image.network(
              widget.subCategory!.imageUrl!,
              fit: BoxFit.fill,
              height: 250,
              width: MediaQuery.of(context).size.width,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                widget.subCategory!.name!,
                overflow: TextOverflow.visible,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: AppColor.black),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            (!HomeScreen.allPurchase.contains(widget.subCategory!.sku))
                ? CustomButtonUI(
                    onTap: () async {
                      if (!HomeScreen.allPurchase
                          .contains(widget.subCategory!.sku)) {
                        HomeScreen.allPurchase.add(widget.subCategory!.sku!);

                        final prefs = await SharedPreferences.getInstance();
                        prefs.setStringList(AllPurchase, HomeScreen.allPurchase);

                        setState(() {
                          color = AppColor.greyLight;
                          label = allReadyPurchase;
                        });
                      }
                    },
                    color: color,
                    btnLabel: label,
                  )
                : CustomButtonUI(
                    color: AppColor.greyLight,
                    btnLabel: allReadyPurchase,
                  ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                description,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: AppColor.greyDark),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: SingleChildScrollView(
                  child: Html(
                    data: widget.subCategory!.description.toString(),
                    // textAlign: TextAlign.justify,
                    // style: TextStyle(
                    //     fontWeight: FontWeight.w400,
                    //     fontSize: 14,
                    //     color: AppColor.greyLight),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
