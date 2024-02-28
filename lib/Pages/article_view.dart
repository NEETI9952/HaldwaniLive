import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ArticleView extends StatelessWidget {
  final String imageUrl, title, desc;
  final String author,lastModified;
  // final DateTime lastModified;

  ArticleView({
    required this.imageUrl,
    required this.title,
    required this.desc,
    required this.author,
    required this.lastModified,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50, // Adjust the height as needed
              width: 80,  // Adjust the width as needed
              child: Image.asset(
                "images/logo.jpg", // Replace 'your_image.png' with your actual image path
                fit: BoxFit.contain, // Ensure the image fits within the constraints
              ),
            ),
            // Text(
            //   "हल्द्वानी",
            //   style:
            //       TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            // ), //खबर
            // Text(
            //   "लाइव    ",
            //   style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            // )
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
              padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 4),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 4, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Author: $author, ',
                    style: TextStyle(
                      fontSize: 10.0,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    'Last Modified: $lastModified',
                    // '// ${DateFormat('dd/MM/yyyy').format(lastModified)}',
                    style: TextStyle(
                      fontSize: 10.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(0),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                width: MediaQuery.of(context).size.width,
                height: 200,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => Container(
                  color: Color.fromRGBO(160, 160, 160, 1.0),
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(16.0),
              child: Html(
                data: desc,
                style: {
                  "p": Style(color: Colors.black54),
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
