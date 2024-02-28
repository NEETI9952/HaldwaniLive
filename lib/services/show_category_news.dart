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
      if(element["title"]!=null && element['link']!=null && element['content']!=null && element["_embedded"]["wp:featuredmedia"][0]["source_url"]!=null){
          SimpleArticleModel article= SimpleArticleModel(
              title: element["title"]["rendered"],//titleModel.rendered,
              description: element["content"]["rendered"],
              link: element["link"],
              urlToImage: element["_embedded"]["wp:featuredmedia"][0]["source_url"], //embeddedModel.featuredmedia[0].["sourceUrl"]
              lastModifiedDate: element["modified"],
              author:element["_embedded"]["author"][0]["name"]
          );
          debugPrint('responsecategory: $article');
          categoriesNews.add(article);
      }

    });

  }
}