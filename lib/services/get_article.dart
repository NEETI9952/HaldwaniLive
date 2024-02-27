// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:flutter/foundation.dart';
// import '../models/simple_article_model.dart';
//
// class GetArticle {
//   Future<SimpleArticleModel> getArticleDetails() async {
//     String url = "https://haldwanilive.com/wp-json/wp/v2/posts?_embed";
//     var response = await http.get(Uri.parse(url));
//
//     var jsonData = jsonDecode(response.body);
//     // stderr.writeln(jsonData);
//     // developer.log('log neeti', name: 'my.app.category');
//     debugPrint('responseneeti: $jsonData');
//
//     jsonData.forEach((element) {
//       debugPrint('responseneeti: $element');
//       if (element["title"] != null &&
//           element['content'] != null &&
//           element["_embedded"]["wp:featuredmedia"][0]["source_url"] != null &&
//           element['link'] != null) {
//         SimpleArticleModel article = SimpleArticleModel(
//             title: element["title"]["rendered"], //titleModel.rendered,
//             description: element["content"]["rendered"],
//             link: element["link"],
//             urlToImage: element["_embedded"]["wp:featuredmedia"][0]
//                 ["source_url"] //embeddedModel.featuredmedia[0].["sourceUrl"]
//             );
//         return article;
//         debugPrint('responseneeti: $article');
//       }
//     });
//   }
// }
