import 'package:flutter/material.dart';
import 'package:mentaltraining/Resources/color_resource.dart';
import 'package:mentaltraining/Resources/image_resource.dart';
import 'package:mentaltraining/UI/About_Screen/AboutScreen.dart';
import 'package:mentaltraining/UI/Library_Screen/LibraryScreen.dart';
import 'package:mentaltraining/UI/News_Screen/NewsScreen.dart';
import 'package:mentaltraining/UI/Shop_Screen/ShopScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Model/CategoryResponse.dart';
import 'Model/NewsResponse.dart';
import 'Model/SubCategoryResponse.dart';
import 'Resources/string_resource.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  int pageIndex;
  bool pressHome;
  bool pressLibrary;
  bool pressNews;
  bool pressAbout;
  static List<Items> categoriesList = <Items>[];
  static List<String> allPurchase = <String>[];
  static List<Items> categoriesListUse = <Items>[];
  static List<List<SubItems>> allSubCategoriesData = <List<SubItems>>[];
  static List<SubItems> subCategory = <SubItems>[];
  static List<SubItems> subCategoryTemp = <SubItems>[];
  static List<NewsResponse> newsList = <NewsResponse>[];
  HomeScreen(this.pageIndex, this.pressHome, this.pressLibrary, this.pressNews,
      this.pressAbout,
      {Key? key})
      : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List pageList = [
    const ShopScreen(),
    const LibraryScreen(),
    const NewsScreen(),
    const AboutScreen(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  Future<void> getData() async {
    final prefs = await SharedPreferences.getInstance();
    HomeScreen.allPurchase = prefs.getStringList(AllPurchase)!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildBottomBar(),
      body: pageList[widget.pageIndex],
    );
  }

  Widget buildBottomBar() {
    return BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle:
            const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        unselectedLabelStyle:
            const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        selectedItemColor: AppColor.blue,
        unselectedItemColor: AppColor.greyLight,
        type: BottomNavigationBarType.fixed,
        currentIndex: widget.pageIndex,
        onTap: (value) {
          setState(() {
            widget.pageIndex = value;
            if (widget.pageIndex == 0) {
              widget.pressHome = true;
            } else {
              widget.pressHome = false;
            }
            if (widget.pageIndex == 1) {
              widget.pressLibrary = true;
            } else {
              widget.pressLibrary = false;
            }
            if (widget.pageIndex == 2) {
              widget.pressNews = true;
            } else {
              widget.pressNews = false;
            }
            if (widget.pageIndex == 3) {
              widget.pressAbout = true;
            } else {
              widget.pressAbout = false;
            }
            if (widget.pageIndex == 0) {
              widget.pressHome = true;
            } else {
              widget.pressHome = false;
            }
            if (widget.pageIndex == 1) {
              widget.pressLibrary = true;
            } else {
              widget.pressLibrary = false;
            }
            if (widget.pageIndex == 2) {
              widget.pressNews = true;
            } else {
              widget.pressNews = false;
            }
            if (widget.pageIndex == 3) {
              widget.pressAbout = true;
            } else {
              widget.pressAbout = false;
            }
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: widget.pressHome
                ? Image.asset(
                    homeSelectImg,
                    height: 24,
                    width: 24,
                  )
                : Image.asset(
                    homeUnselectImg,
                    height: 24,
                    width: 24,
                  ),
            label: homeTab,
          ),
          BottomNavigationBarItem(
            icon: widget.pressLibrary
                ? Image.asset(
                    librarySelectImg,
                    height: 24,
                    width: 24,
                  )
                : Image.asset(
                    libraryUnselectImg,
                    height: 24,
                    width: 24,
                  ),
            label: library,
          ),
          BottomNavigationBarItem(
            icon: widget.pressNews
                ? Image.asset(
                    newsSelectImg,
                    height: 24,
                    width: 24,
                  )
                : Image.asset(
                    newsUnselectImg,
                    height: 24,
                    width: 24,
                  ),
            label: news,
          ),
          BottomNavigationBarItem(
            icon: widget.pressAbout
                ? Image.asset(
                    aboutSelectImg,
                    height: 24,
                    width: 24,
                  )
                : Image.asset(
                    aboutUnselectImg,
                    height: 24,
                    width: 24,
                  ),
            label: about,
          ),
        ]);
  }
}