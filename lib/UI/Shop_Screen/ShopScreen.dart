import 'dart:async';

import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mentaltraining/Custom%20Widget/customHeaderText.dart';
import 'package:mentaltraining/HomeScreen.dart';
import 'package:mentaltraining/Resources/Api.dart';
import 'package:mentaltraining/Resources/color_resource.dart';
import 'package:mentaltraining/Resources/image_resource.dart';
import 'package:mentaltraining/Resources/string_resource.dart';
import 'package:mentaltraining/UI/Shop_Screen/DetailScreen.dart';

import '../../Custom Widget/ConnectionStatus.dart';
import 'AudioScreen.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({Key? key}) : super(key: key);
  static var isOffline = false;

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  bool progress = false;
  int value = 0;

  late Timer _timer;
  final PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer.cancel();
    _pageController.dispose();
  }

  @override
  initState() {
    // TODO: implement initState
    super.initState();
    getAPi();
  }

  checkConnection() async {
    ConnectionStatusSingleton connectionStatus =
    ConnectionStatusSingleton.getInstance();
    connectionStatus.initialize();

    ShopScreen.isOffline = await connectionStatus.check();
    setState(() {
      ShopScreen.isOffline;
    });
    setState(() {});
  }

  void connectionChanged(dynamic hasConnection) {}

  Future<void> getAPi() async {
    if (HomeScreen.categoriesList.isEmpty ||
        HomeScreen.categoriesListUse.isEmpty ||
        HomeScreen.allSubCategoriesData.isEmpty) {
      Api obj = Api();
      progress = false;

      ConnectionStatusSingleton connectionStatus =
      ConnectionStatusSingleton.getInstance();
      connectionStatus.initialize();
      await checkConnection();

      if (!ShopScreen.isOffline) {
        await obj.getCategory();
        setState(() {
          progress = true;
          HomeScreen.categoriesList;
          HomeScreen.categoriesListUse;
          HomeScreen.allSubCategoriesData;
          HomeScreen.newsList;
          _timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
            if (value < HomeScreen.categoriesListUse.length - 1) {
              value++;
            } else {
              value = 0;
            }
            _pageController.animateToPage(
              value,
              duration: const Duration(milliseconds: 350),
              curve: Curves.easeIn,
            );
          });
        });
      } else {
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          showCupertinoDialog(
            context: context,
            builder: (BuildContext context) {
              return alert();
            },
          );
          setState(() {
            progress = true;
          });
        });
      }
    } else {
      setState(() {
        progress = true;
        _timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
          if (value < HomeScreen.categoriesListUse.length - 1) {
            value++;
          } else {
            value = 0;
          }
          _pageController.animateToPage(
            value,
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeIn,
          );
        });
      });
    }
  }

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
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      height: 50,
                      child: Center(
                        child: customHeaderText(
                          btnLabel: home,
                          color: AppColor.black,
                        ),
                      ),
                    ),
                    Positioned(
                        right: 20,
                        child: GestureDetector(
                          onTap: () {
                            // getCategory();
                            // getAPi();
                          },
                          child: SizedBox(
                              height: 42,
                              width: 42,
                              child: Image.asset(refreshImg)),
                        )),
                  ],
                ),
              ),
              Expanded(
                child: (!progress)
                    ? Center(
                  child: Container(
                      height: 40,
                      width: 40,
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator()),
                )
                    : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 0),
                              child: Center(
                                child: Container(
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  height: 250,
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width,
                                  child: PageView.builder(
                                      controller: _pageController,
                                      onPageChanged: (index) {
                                        setState(() {
                                          value = index;
                                        });
                                      },
                                      itemCount:
                                      HomeScreen.categoriesListUse.length,
                                      physics: const BouncingScrollPhysics(),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                                  builder: (context) {
                                                    return DetailScreen(
                                                      category: HomeScreen
                                                          .categoriesListUse[
                                                      index],
                                                      subCategory: HomeScreen
                                                          .allSubCategoriesData[
                                                      index],
                                                    );
                                                  },
                                                ));
                                          },
                                          child: Stack(
                                            children: [
                                              Center(
                                                child: Container(
                                                    margin:
                                                    const EdgeInsets.only(
                                                        left: 20,
                                                        right: 20),
                                                    height: 250,
                                                    width:
                                                    MediaQuery
                                                        .of(context)
                                                        .size
                                                        .width,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(15),
                                                    ),
                                                    child: ClipRRect(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(15),
                                                        child: Image.network(
                                                          HomeScreen
                                                              .categoriesListUse[
                                                          index]
                                                              .imageUrl!,
                                                          fit: BoxFit.fill,
                                                        ))),
                                              ),
                                              Center(
                                                  child: Text(
                                                      HomeScreen
                                                          .categoriesListUse[
                                                      index]
                                                          .name!,
                                                      style: TextStyle(
                                                          color:
                                                          AppColor.white,
                                                          fontWeight:
                                                          FontWeight.w600,
                                                          fontSize: 20))),
                                            ],
                                          ),
                                        );
                                      }),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            (HomeScreen.categoriesListUse.isNotEmpty)
                                ? Center(
                              child: Padding(
                                padding:
                                const EdgeInsets.only(top: 225),
                                child: CarouselIndicator(
                                  space: 5,
                                  height: 10,
                                  width: 10,
                                  activeColor: AppColor.white,
                                  // color: AppColor.greyLight,
                                  count: HomeScreen
                                      .categoriesListUse.length,
                                  index: value,
                                ),
                              ),
                            )
                                : Container(),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 10,
                          );
                        },
                        physics: const BouncingScrollPhysics(),
                        itemCount: HomeScreen.categoriesListUse.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Text(
                                      HomeScreen
                                          .categoriesListUse[index].name!,
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: AppColor.black,
                                          fontWeight: FontWeight.w600),
                                    )),
                                const SizedBox(
                                  height: 12,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: SizedBox(
                                    height: 165,
                                    child: ListView.builder(
                                      physics: const BouncingScrollPhysics(),
                                      itemCount: HomeScreen
                                          .allSubCategoriesData[index].length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, subIndex) {
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                                  builder: (context) {
                                                    return AudioScreen(
                                                        subCategory: HomeScreen
                                                            .allSubCategoriesData[
                                                        index][subIndex]);
                                                  },
                                                ));
                                          },
                                          child: SizedBox(
                                            // height: 150,
                                            width: 190,
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 130,
                                                  width: 170,
                                                  child: ClipRRect(
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(10),
                                                      child: Image.network(
                                                        HomeScreen
                                                            .allSubCategoriesData[
                                                        index]
                                                        [subIndex]
                                                            .imageUrl!,
                                                        fit: BoxFit.fill,
                                                      )),
                                                ),
                                                Container(
                                                  margin:
                                                  const EdgeInsets.only(
                                                      top: 10),
                                                  child: Text(
                                                    HomeScreen
                                                        .allSubCategoriesData[
                                                    index][subIndex]
                                                        .name!,
                                                    overflow:
                                                    TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color:
                                                        AppColor.greyDark,
                                                        fontWeight:
                                                        FontWeight.w400),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ]);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }

  Widget alert() {
    return CupertinoAlertDialog(
      title: const Text(network_error, textAlign: TextAlign.center),
      content: const Text(no_network_error, textAlign: TextAlign.center),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("OK")),
      ],
    );
  }
}
