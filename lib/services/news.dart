import 'dart:convert';
import 'package:haldwani_live/models/simple_article_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
// import 'dart:developer' as developer;
// import 'dart:io';

class News{
  List<SimpleArticleModel> news=[];


  Future<void> getNews()async{
    String url="https://khabarpahad.com/wp-json/wp/v2/posts?_embed";
    var response= await http.get(Uri.parse(url));

    var jsonData= jsonDecode(response.body);
    // stderr.writeln(jsonData);
    // developer.log('log neeti', name: 'my.app.category');
    debugPrint('responseneeti: $jsonData');

    jsonData.forEach((element){
      debugPrint('responseneeti: $element');
      if(element["title"]!=null && element['content']!=null && element["_embedded"]["wp:featuredmedia"][0]["source_url"]!=null && element['link']!=null ){
        SimpleArticleModel article= SimpleArticleModel(
          title: element["title"]["rendered"],//titleModel.rendered,
          description: element["content"]["rendered"],
          link: element["link"],
          urlToImage: element["_embedded"]["wp:featuredmedia"][0]["source_url"], //embeddedModel.featuredmedia[0].["sourceUrl"]
            lastModifiedDate: element["modified"],
            author:element["_embedded"]["author"][0]["name"]
        );
        debugPrint('responseneeti: $article');
        news.add(article);
      }
    });
  }
}