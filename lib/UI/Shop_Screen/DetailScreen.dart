import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mentaltraining/Model/CategoryResponse.dart';
import 'package:mentaltraining/Resources/image_resource.dart';
import 'package:mentaltraining/UI/Shop_Screen/AudioScreen.dart';

import '../../Custom Widget/customHeaderText.dart';
import '../../Model/SubCategoryResponse.dart';
import '../../Resources/color_resource.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({Key? key, this.category, this.subCategory}) : super(key: key);

  Items? category;
  List<SubItems>? subCategory;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: AppColor.background));
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SafeArea(
        child: Column(
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
                        btnLabel: widget.category!.name,
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
            Container(
              width: MediaQuery.of(context).size.width,
              height: 250,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(widget.category!.imageUrl!))),
              alignment: Alignment.center,
              child: Text(
                widget.category!.name!,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                    color: AppColor.white),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: widget.subCategory!.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return AudioScreen(
                                subCategory: widget.subCategory![index]);
                          },
                        ));
                      },
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              widget.subCategory![index].imageUrl!,
                              height: 90,
                              width: 120,
                              fit: BoxFit.fill,
                            ),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          // width: MediaQuery.of(context).size.width,
                          Expanded(
                            child: Text(
                              widget.subCategory![index].name!,
                              overflow: TextOverflow.visible,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: AppColor.greyDark,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      // ),
    );
  }
}
