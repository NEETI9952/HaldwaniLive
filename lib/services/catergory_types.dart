import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:haldwani_live/models/category_model.dart';
import 'package:http/http.dart' as http;

// class CategoryTypes{
//   List<CategoryModel> categories = [];

List<CategoryModel> getCategories() {
  List<CategoryModel> category = [];

  CategoryModel categoryModel = new CategoryModel(id: 49 ,categoryName: "Uttarakhand");
  category.add(categoryModel);
  categoryModel = new CategoryModel(id: 4856 ,categoryName: "Election 2024");
  category.add(categoryModel);
  categoryModel = new CategoryModel(id: 48 ,categoryName: "National News");
  category.add(categoryModel);
  categoryModel = new CategoryModel(id: 9467 ,categoryName: "CM Corner");
  category.add(categoryModel);
  categoryModel = new CategoryModel(id: 56 ,categoryName: "Kumaon");
  category.add(categoryModel);
  categoryModel = new CategoryModel(id: 50 ,categoryName: "Garhwal");
  category.add(categoryModel);
  categoryModel = new CategoryModel(id: 57 ,categoryName: "Garhwali");
  category.add(categoryModel);
  categoryModel = new CategoryModel(id: 7656 ,categoryName: "Delhi");
  category.add(categoryModel);
  categoryModel = new CategoryModel(id: 7657 ,categoryName: "Uttar Pradesh");
  category.add(categoryModel);
  categoryModel = new CategoryModel(id: 53 ,categoryName: "Sports News");
  category.add(categoryModel);
  categoryModel = new CategoryModel(id: 2593 ,categoryName: "Job Alerts");
  category.add(categoryModel);
  categoryModel = new CategoryModel(id: 192 ,categoryName: "Govt Schemes");
  category.add(categoryModel);
  categoryModel = new CategoryModel(id: 9896 ,categoryName: "Schools");
  category.add(categoryModel);
  categoryModel = new CategoryModel(id: 2592 ,categoryName: "Culture");
  category.add(categoryModel);
  categoryModel = new CategoryModel(id: 54 ,categoryName: "Literature");
  category.add(categoryModel);
  categoryModel = new CategoryModel(id: 55 ,categoryName: "Poems");
  category.add(categoryModel);
  categoryModel = new CategoryModel(id: 52 ,categoryName: "Entertainment");
  category.add(categoryModel);
  categoryModel = new CategoryModel(id: 1 ,categoryName: "Uncategorized");
  category.add(categoryModel);


  return category;
}

  // Future<void> getCategories()async {
  //   String url = "https://haldwanilive.com/wp-json/wp/v2/categories?per_page=100";
  //   var response = await http.get(Uri.parse(url));
  //
  //   var jsonData = jsonDecode(response.body);
  //   debugPrint('responseneeti: $jsonData');
  //
  //   jsonData.forEach((element) {
  //     debugPrint('responseneeti: $element');
  //     if (element["id"] != null && element['name'] != null) {
  //       CategoryModel category = CategoryModel(
  //           id: element["id"],
  //           image: "images/health.jpg",
  //           categoryName: element["name"]);
  //       categories.add(category);
  //       debugPrint('responseneeticategories:'+category.toString());
  //     }
  //   });
  //   categories.forEach((category) {
  //     debugPrint('responseneeticategories: categoryModel = new CategoryModel(id: ${category.id} ,categoryName: "${category.categoryName}",image: "${category.image}")');
  //     debugPrint('responseneeticategories: category.add(categoryModel)');
  //   });
  // }
// }
