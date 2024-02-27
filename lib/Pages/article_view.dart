import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
// import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatelessWidget{
  final String imageUrl,  title, desc;
  // Widget desc; // Accepts a Widget instead of a String

  ArticleView({required this.imageUrl,
    required this.desc,
    required this.title,
    });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("हल्द्वानी",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),//खबर
            Text(
              "लाइव    ",
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            )
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                width: MediaQuery.of(context).size.width,
                height: 200,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => Container(
                  color: Color.fromRGBO(160, 160, 160, 1.0),  // light grey box as placeholder
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                ),
              ),
            ),
            // desc,
            Html(data: desc),
          ],
        ),
      ),
    );
  }
}
