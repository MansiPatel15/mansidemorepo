import 'package:flutter/material.dart';
import 'package:mentaltraining/Custom%20Widget/customHeaderText.dart';
import 'package:mentaltraining/HomeScreen.dart';
import 'package:mentaltraining/Resources/string_resource.dart';
import 'package:mentaltraining/UI/Library_Screen/DownloadAudios.dart';

import '../../Model/SubCategoryResponse.dart';
import '../../Resources/color_resource.dart';
import '../../Resources/image_resource.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  int index = 0;
  List<SubItems> allSubCategory = <SubItems>[];
  List<SubItems> allUseSubCategory = <SubItems>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPurchaseData();
  }

  void getPurchaseData() {
    for (int i = 0; HomeScreen.allSubCategoriesData.length > i; i++) {
      setState(() {
        allSubCategory.addAll(HomeScreen.allSubCategoriesData[i]);
      });
    }
    for (int i = 0; allSubCategory.length > i; i++) {
      if (HomeScreen.allPurchase.contains(allSubCategory[i].sku!)) {
        if (allUseSubCategory.isEmpty) {
          allUseSubCategory.add(allSubCategory[i]);
        } else {
          var flag = false;
          for (int j = 0; allUseSubCategory.length > j; j++) {
            if (allUseSubCategory[j].sku == allSubCategory[i].sku!) {
              flag = true;
              break;
            }
          }
          if (!flag) {
            allUseSubCategory.add(allSubCategory[i]);
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
                      btnLabel: library,
                      color: AppColor.black,
                    ),
                  ),
                ),
                Positioned(
                    right: 20,
                    child: GestureDetector(
                      child: SizedBox(
                          height: 42,
                          width: 42,
                          child: Image.asset(refreshImg)),
                    )),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemCount: allUseSubCategory.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return DownloadAudio(
                            allUseSubCategory: allUseSubCategory[index]);
                      },
                    ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              allUseSubCategory![index].imageUrl!,
                              height: 90,
                              width: 120,
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              allUseSubCategory[index].name!,
                              style: TextStyle(
                                  color: AppColor.greyDark,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          GestureDetector(
                              onTap: () {},
                              child: Image.asset(
                                downloadImg,
                                height: 20,
                                width: 20,
                              ))
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      )),
    );
  }
}
