// import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:portal_demo/example_app.dart';
import 'package:portal_demo/resources/subcategory_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'category_model.dart';

class ComplainBloc {
  // StreamController<String> complain = StreamController<String>();
  //Stream<int> get category => _categoryStream.stream;
  //Function(dynamic) get selectCategory => _categoryStream.sink.add;

  int selectedCategory = 0;
  int selectedSubcategory = 0;
  String complainBody = '';
  List<CategoryModel> allCategories;
  Map<int, List<SubcategoryModel>> keyedSubcategories;
  List<DropdownMenuItem<int>> categoryDropdown;
  List<DropdownMenuItem<int>> subcategoryDropdown;

  //
  fetchCategories() async {
    String data;

    //sp = await SharedPreferences.getInstance();

    //if (!sp.containsKey("categories")) {
    final response = await http.get(
        "http://phpmaya.com/api/complain/categories",
        headers: {"Content-Type": "application/json"});

    data = response.body;
    //  sp.setString('categories', data);
    // } else {
    //  data = sp.getString("categories");
    // }

    final parsedJson = json.decode(data) as List;

    List<CategoryModel> categories = parsedJson
        .map<CategoryModel>((i) => CategoryModel.fromJson(i))
        .toList();

    allCategories = categories;

    keyedSubcategories = Map.fromIterable(categories,
        key: (i) => i.id, value: (i) => i.subcategories);

    categoryDropdown = allCategories
        .map(
          (i) => DropdownMenuItem<int>(value: i.id, child: Text("${i.name}")),
        )
        .toList()
        .cast<DropdownMenuItem<int>>();

    categoryDropdown.insert(
      0,
      DropdownMenuItem<int>(
        value: 0,
        child: Text("Do not know"),
      ),
    );
  }

  loadComplainScreen() async {
    await fetchCategories();
  }

  getSubcategoryDropdown() {
    if (selectedCategory == 0) {
      subcategoryDropdown = [
        DropdownMenuItem<int>(
          value: 0,
          child: Text("Do not know"),
        )
      ];
    } else {
      subcategoryDropdown = [];
      subcategoryDropdown = keyedSubcategories[selectedCategory]
          .map(
            (f) => DropdownMenuItem<int>(
              value: f.id,
              child: Text("${f.name}"),
            ),
          )
          .toList()
          .cast<DropdownMenuItem<int>>();

      subcategoryDropdown.insert(
        0,
        DropdownMenuItem<int>(
          value: 0,
          child: Text("Do not know"),
        ),
      );
    }
    return subcategoryDropdown;
  }

  submitComplain() async {
    String c = selectedCategory != 0
        ? allCategories.where((i) => i.id == selectedCategory).first.name
        : "Unspecified";

    String s = selectedSubcategory != 0
        ? keyedSubcategories[selectedCategory]
            .where((i) => i.id == selectedSubcategory)
            .first
            .name
        : "Unspecified";

    print(" category: $c ,  subcategory: $s ,  body: $complainBody");

    var data = {};
    data['body'] = complainBody;
    data['category_id'] = selectedCategory != 0 ? selectedCategory : null;
    data['subcategory_id'] =
        selectedSubcategory != 0 ? selectedSubcategory : null;

    final response = await http.post(
      'http://phpmaya.com/api/complain',
      headers: {"Content-Type": "application/json"},
      body: json.encode(data),
    );

    print(response.body);

    //after submit reset everything
  }

  // dispose() {
  //   complain.close();
  // }
}

final cpBloc = ComplainBloc();
