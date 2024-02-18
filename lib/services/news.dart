import 'dart:convert';
import 'package:haldwani_live/models/content_model.dart';
import 'package:haldwani_live/models/simple_article_model.dart';
import 'package:haldwani_live/models/title_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
// import 'dart:developer' as developer;
// import 'dart:io';

class News{
  List<SimpleArticleModel> news=[];


  Future<void> getNews()async{
    // String url="https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=34c3bea4d49c4122bab34ea3b62a57f6";
    String url="https://haldwanilive.com/wp-json/wp/v2/posts?_embed";
    var response= await http.get(Uri.parse(url));

    var jsonData= jsonDecode(response.body);
    // stderr.writeln(jsonData);
    // developer.log('log neeti', name: 'my.app.category');
    debugPrint('responseneeti: $jsonData');

    jsonData.forEach((element){
      debugPrint('responseneeti: $element');
      if(element["title"]!=null && element['content']!=null){
        // ArticlesModel articleModel= ArticlesModel(
        //     title: element["title"],
        //     content: element["content"]
        // );
        //
        // TitleModel? titleModel= articleModel.title;
        // ContentModel? contentModel = articleModel.content;

        TitleModel titleModel = TitleModel.fromJson(element["title"]);
        ContentModel contentModel = ContentModel.fromJson(element["content"]);

        SimpleArticleModel article= SimpleArticleModel(
          title: element["title"]["rendered"],//titleModel.rendered,
          description: contentModel.rendered,
          link: element["link"],
          urlToImage: element["_embedded"]["wp:featuredmedia"][0]["source_url"]//embeddedModel.featuredmedia[0].["sourceUrl"]
        );
        debugPrint('responseneeti: $article');
        news.add(article);
      }
    });

    // if(jsonData['status']=='ok'){
    //   jsonData["articles"].forEach((element){
    //     if(element["urlToImage"]!=null && element['description']!=null){
    //       ArticlesModel articlesModel= ArticlesModel(
    //         title: element["title"],
    //         description: element["description"],
    //         url: element["url"],
    //         urlToImage: element["urlToImage"],
    //         content: element["content"],
    //         author: element["author"],
    //       );
    //       news.add(articlesModel);
    //     }
    //   });
    // }

  }
}