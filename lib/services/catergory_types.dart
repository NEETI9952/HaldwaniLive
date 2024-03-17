import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:haldwani_live/models/category_model.dart';
import 'package:http/http.dart' as http;

// class CategoryTypes{
//   List<CategoryModel> categories = [];

List<CategoryModel> getCategories() {
  List<CategoryModel> category = [];

  CategoryModel categoryModel = new CategoryModel(id: 16 ,categoryName: "Uttarakhand News");
  category.add(categoryModel);
  categoryModel = new CategoryModel(id: 52 ,categoryName: "Nainital-Haldwani News");
  category.add(categoryModel);
  categoryModel = new CategoryModel(id: 5479 ,categoryName: "Breaking News");
  category.add(categoryModel);
  categoryModel = new CategoryModel(id: 62360 ,categoryName: "Politics");
  category.add(categoryModel);
  categoryModel = new CategoryModel(id: 30 ,categoryName: "Sports News");
  category.add(categoryModel);
  categoryModel = new CategoryModel(id: 28356 ,categoryName: "Tourism");
  category.add(categoryModel);
  categoryModel = new CategoryModel(id: 63 ,categoryName: "National News");
  category.add(categoryModel);
  categoryModel = new CategoryModel(id: 1123 ,categoryName: "World News");
  category.add(categoryModel);
  categoryModel = new CategoryModel(id: 10044 ,categoryName: "Regional News");
  category.add(categoryModel);
  categoryModel = new CategoryModel(id: 13458 ,categoryName: "CM Corner");
  category.add(categoryModel);
  categoryModel = new CategoryModel(id: 15379 ,categoryName: "Business Live");
  category.add(categoryModel);
  categoryModel = new CategoryModel(id: 57400 ,categoryName: "Election Talks");
  category.add(categoryModel);
  categoryModel = new CategoryModel(id: 62363 ,categoryName: "Health");
  category.add(categoryModel);
  categoryModel = new CategoryModel(id: 12255 ,categoryName: "Auto Tech");
  category.add(categoryModel);
  categoryModel = new CategoryModel(id: 14874 ,categoryName: "Viral");
  category.add(categoryModel);
  categoryModel = new CategoryModel(id: 701 ,categoryName: "Featured");
  category.add(categoryModel);
  categoryModel = new CategoryModel(id: 12141 ,categoryName: "Editorial");
  category.add(categoryModel);
  categoryModel = new CategoryModel(id: 794 ,categoryName: "Women Power");
  category.add(categoryModel);
  categoryModel = new CategoryModel(id: 3264 ,categoryName: "Women Voice");
  category.add(categoryModel);
  categoryModel = new CategoryModel(id: 692 ,categoryName: "Jobs");
  category.add(categoryModel);
  categoryModel = new CategoryModel(id: 795 ,categoryName: "Start Up");
  category.add(categoryModel);
  categoryModel = new CategoryModel(id: 6582 ,categoryName: "Life Style");
  category.add(categoryModel);
  categoryModel = new CategoryModel(id: 6791 ,categoryName: "Entertainment");
  category.add(categoryModel);
  categoryModel = new CategoryModel(id: 11133 ,categoryName: "Bollywood");
  category.add(categoryModel);
categoryModel  = new CategoryModel(id: 3 ,categoryName: "Almora News");
  category.add(categoryModel);
  categoryModel = new CategoryModel(id: 623 ,categoryName: "Bageshwar News");
  category.add(categoryModel);
  categoryModel = new CategoryModel(id: 792 ,categoryName: "Chamoli News");
  category.add(categoryModel);
  categoryModel = new CategoryModel(id: 207 ,categoryName: "Champawat News");
  category.add(categoryModel);
  categoryModel = new CategoryModel(id: 38 ,categoryName: "Dehradun News");
  category.add(categoryModel);
  categoryModel = new CategoryModel(id: 1 ,categoryName: "Haridwar News");
   category.add(categoryModel);
   categoryModel = new CategoryModel(id: 313 ,categoryName: "Pauri News");
   category.add(categoryModel);
   categoryModel = new CategoryModel(id: 401 ,categoryName: "Pithoragarh News");
   category.add(categoryModel);
   categoryModel = new CategoryModel(id: 53125 ,categoryName: "Rajasthan");
   category.add(categoryModel);
   categoryModel = new CategoryModel(id: 165 ,categoryName: "Rudraprayag News");
   category.add(categoryModel);
   categoryModel = new CategoryModel(id: 793 ,categoryName: "Tehri News");
   category.add(categoryModel);
   categoryModel = new CategoryModel(id: 181 ,categoryName: "Udham Singh Nagar News");
   category.add(categoryModel);
   categoryModel = new CategoryModel(id: 357 ,categoryName: "Uttar Pradesh");
   category.add(categoryModel);
   categoryModel = new CategoryModel(id: 791 ,categoryName: "Uttarkashi News");
   category.add(categoryModel);
  categoryModel = new CategoryModel(id: 927 ,categoryName: "Other News");
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
