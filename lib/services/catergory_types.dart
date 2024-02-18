import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:haldwani_live/models/category_model.dart';
import 'package:http/http.dart' as http;

class CategoryTypes{
  List<CategoryModel> categories = [];


  Future<void> getCategories()async {
    String url = "https://haldwanilive.com/wp-json/wp/v2/categories?per_page=100";
    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);
    debugPrint('responseneeti: $jsonData');


    jsonData.forEach((element) {
      debugPrint('responseneeti: $element');
      if (element["id"] != null && element['name'] != null) {
        CategoryModel category = CategoryModel(
            id: element["id"],
            image: "images/health.jpg",
            categoryName: element["name"]);
        categories.add(category);
      }

    });

  }


}

// List<CategoryModel> getCategories() {
//   List<CategoryModel> category = [];
//   CategoryModel categoryModel = new CategoryModel();
//
//   categoryModel.categoryName = "Business";
//   categoryModel.image = "images/business.jpg";
//   category.add(categoryModel);
//   categoryModel = new CategoryModel();
//
//   categoryModel.categoryName = "Entertainment";
//   categoryModel.image = "images/entertainment.jpg";
//   category.add(categoryModel);
//   categoryModel = new CategoryModel();
//
//   categoryModel.categoryName = "General";
//   categoryModel.image = "images/general.jpg";
//   category.add(categoryModel);
//   categoryModel = new CategoryModel();
//
//   categoryModel.categoryName = "Health";
//   categoryModel.image = "images/health.jpg";
//   category.add(categoryModel);
//   categoryModel = new CategoryModel();
//
//   categoryModel.categoryName = "Sports";
//   categoryModel.image = "images/sport.jpg";
//   category.add(categoryModel);
//   categoryModel = new CategoryModel();

//   return category;
// }