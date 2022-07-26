import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mentaltraining/Resources/string_resource.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xml2json/xml2json.dart';

import '../HomeScreen.dart';
import '../Model/CategoryResponse.dart';
import '../Model/NewsResponse.dart';
import '../Model/SubCategoryResponse.dart';
import 'UrlResource.dart';

class Api {
  getCategory() async {
    HomeScreen.categoriesList = <Items>[];
    HomeScreen.categoriesListUse = <Items>[];
    HomeScreen.allSubCategoriesData = <List<SubItems>>[];
    HomeScreen.subCategory = <SubItems>[];
    HomeScreen.subCategoryTemp = <SubItems>[];

    final uri = Uri.parse(CATEGORIES_URL);
    final newURI = uri.replace(queryParameters: {
      'token': "MXmLgvLuTG1RBQfvx6Z37u5jaeGZ3PfR",
    });

    final response = await http.get(newURI);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      var data = json["items"];
      HomeScreen.categoriesList =
          List<Items>.from(data.map((i) => Items.fromJson(i)).toList());
      for (int i = 0; i < HomeScreen.categoriesList.length; i++) {
        if (HomeScreen.categoriesList[i].parentId == 2833264) {
          HomeScreen.categoriesListUse.add(HomeScreen.categoriesList[i]);

          final uri = Uri.parse(SUB_CATEGORIES_URL);
          final newURI = uri.replace(queryParameters: {
            'category': HomeScreen.categoriesList[i].id.toString(),
            'token': "MXmLgvLuTG1RBQfvx6Z37u5jaeGZ3PfR",
          });

          final response = await http.get(newURI);
          if (response.statusCode == 200) {
            var json = jsonDecode(response.body);
            var data = json["items"];
            HomeScreen.subCategory = List<SubItems>.from(
                data.map((i) => SubItems.fromJson(i)).toList());
            HomeScreen.subCategory.sort((a, b) =>
                a.name!.toLowerCase().compareTo(b.name!.toLowerCase()));

            HomeScreen.subCategoryTemp = <SubItems>[];
            for (int i = 0; i < HomeScreen.subCategory.length; i++) {
              if (HomeScreen.subCategory[i].files!.isNotEmpty) {
                HomeScreen.subCategoryTemp.add(HomeScreen.subCategory[i]);
              }
            }
            HomeScreen.allSubCategoriesData.add(HomeScreen.subCategoryTemp);
          }
        }
      }
    }

    HomeScreen.newsList = <NewsResponse>[];
    final uri1 = Uri.parse(NEWS_JSON);
    Map<String, String> headers = {"Accept": "text/html,application/xml"};
    final response1 = await http.get(uri1, headers: headers);
    if (response1.statusCode == 200) {
      final Xml2Json xml2Json = Xml2Json();
      xml2Json.parse(response1.body);
      var jsonData = jsonDecode(xml2Json.toParker());
      var data = jsonData["rss"]["channel"]["item"];
      HomeScreen.newsList = List<NewsResponse>.from(
          data.map((i) => NewsResponse.fromJson(i)).toList());
    }

    addItems(CategoriesList, HomeScreen.categoriesList);
    addItems(CategoriesListUse, HomeScreen.categoriesListUse);
    allAddSubItems(AllSubCategoriesData, HomeScreen.allSubCategoriesData);
    addSubItems(SubCategory, HomeScreen.subCategory);
    allAddNews(NewsList, HomeScreen.newsList);
  }

  Future<void> addItems(String key, List<Items> tList) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, jsonEncode(tList));
  }

  Future<void> addSubItems(String key, List<SubItems> tList) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, jsonEncode(tList));
  }

  Future<void> allAddSubItems(String key, List<List<SubItems>> tList) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, jsonEncode(tList));
  }

  Future<void> allAddNews(String key, List<NewsResponse> tList) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, jsonEncode(tList));
  }

// List<Items> list = [];
// void getSP() async {
//   final prefs = await SharedPreferences.getInstance();
//   final List<dynamic> jsonData =
//   jsonDecode(prefs.getString('graphLists') ?? '[]');
//   list = jsonData.map<Items>((jsonList) {
//     return jsonList.map<Items>((jsonItem) {
//       return Items.fromJson(jsonItem);
//     }).toList();
//   }).toList();
// }
}
