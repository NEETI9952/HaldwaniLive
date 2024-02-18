import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:haldwani_live/models/slider_model.dart';
import 'package:flutter/foundation.dart';

class Sliders {
  List<sliderModel> sliders = [];

  Future<void> getSlider() async {
    String url =
        "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=34c3bea4d49c4122bab34ea3b62a57f6";
    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    debugPrint('responseneeti: $jsonData');

    if (jsonData['status'] == 'ok') {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element['description'] != null) {
          sliderModel slidermodel = sliderModel(
            title: element["title"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["content"],
            author: element["author"],
          );
          sliders.add(slidermodel);
        }
      });
    }
  }
}