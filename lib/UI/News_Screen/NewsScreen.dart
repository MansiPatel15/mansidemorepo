import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart' as http;
import 'package:mentaltraining/Custom%20Widget/customHeaderText.dart';
import 'package:mentaltraining/HomeScreen.dart';
import 'package:mentaltraining/Model/NewsResponse.dart';
import 'package:mentaltraining/Resources/color_resource.dart';
import 'package:mentaltraining/UI/Shop_Screen/ShopScreen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xml2json/xml2json.dart';

import '../../Resources/UrlResource.dart';
import '../../Resources/string_resource.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  bool progress = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (ShopScreen.isOffline) {
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
    } else {
      if (HomeScreen.newsList.isNotEmpty) {
        setState(() {
          progress = true;
        });
      }
    }
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

  Future<void> getCategory() async {
    setState(() {
      progress = false;
    });
    HomeScreen.newsList = <NewsResponse>[];
    final uri = Uri.parse(NEWS_JSON);
    Map<String, String> headers = {"Accept": "text/html,application/xml"};
    final response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      final Xml2Json xml2Json = Xml2Json();
      xml2Json.parse(response.body);
      var jsonData = jsonDecode(xml2Json.toParker());
      var data = jsonData["rss"]["channel"]["item"];
      setState(() {
        HomeScreen.newsList = List<NewsResponse>.from(
            data.map((i) => NewsResponse.fromJson(i)).toList());
      });
      progress = true;
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
                      btnLabel: news,
                      color: AppColor.black,
                    ),
                  ),
                ),
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
                : Container(
                    margin:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 15),
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 8,
                        );
                      },
                      shrinkWrap: true,
                      itemCount: HomeScreen.newsList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () async {
                            // launch(newsList[index].link!);
                            await launch(HomeScreen.newsList[index].link!);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColor.white,
                            ),
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Text(
                                    textAlign: TextAlign.justify,
                                    HomeScreen.newsList[index].title!,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: AppColor.black,
                                        fontSize: 14),
                                  ),
                                ),
                                // const SizedBox(
                                //   height: 5,
                                // ),
                                Html(
                                    data: HomeScreen
                                        .newsList[index].description!
                                        .toString()),
                                // Text(
                                //   textAlign: TextAlign.justify,
                                //   newsList[index].description!,
                                //   style: TextStyle(
                                //       fontWeight: FontWeight.w400,
                                //       color: AppColor.greyDark,
                                //       fontSize: 14),
                                // ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    HomeScreen.newsList[index].pubDate!,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: AppColor.greyLight,
                                        fontSize: 12),
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
        ],
      )),
    );
  }
}
