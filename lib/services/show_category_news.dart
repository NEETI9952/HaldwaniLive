import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../models/simple_article_model.dart';

class ShowCategoryNews {
  List<SimpleArticleModel> categoriesNews = [];

  Future<void> getCategoriesNews(int categoryId) async {
    String url ="https://haldwanilive.com/wp-json/wp/v2/posts?_embed&categories=${categoryId}";
    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);
    debugPrint('responsecategory: $jsonData');

    jsonData.forEach((element){
      debugPrint('responsecategory: $element');
      if(element["title"]!=null && element['content']!=null){
          SimpleArticleModel article= SimpleArticleModel(
              title: element["title"]["rendered"],//titleModel.rendered,
              description: element["content"]["rendered"],
              link: element["link"],
              urlToImage: element["_embedded"]["wp:featuredmedia"][0]["source_url"]//embeddedModel.featuredmedia[0].["sourceUrl"]
          );
          debugPrint('responsecategory: $article');
          categoriesNews.add(article);
      }
        // if (element["urlToImage"] != null && element['description'] != null) {
        //   ShowCategoryModel categoryModel = ShowCategoryModel(
        //     title: element["title"],
        //     description: element["description"],
        //     url: element["url"],
        //     urlToImage: element["urlToImage"],
        //     content: element["content"],
        //     author: element["author"],
        //   );
        //   categories.add(categoryModel);
        // }

    });

  }
}