import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:haldwani_live/models/simple_article_model.dart';
import 'package:haldwani_live/services/news.dart';

import 'article_view.dart';

class AllNews extends StatefulWidget {
  String news;
  AllNews({required this.news});

  @override
  State<AllNews> createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  List<SimpleArticleModel> articles = [];
  void initState() {
    getNews();
    super.initState();
  }

  getNews() async {
    News newsclass = News();
    await newsclass.getNews();
    articles = newsclass.news;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Latest News   ",
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemCount: articles.length,
            itemBuilder: (context, index) {
              print(articles.length);
              return AllNewsSection(
                  Image: articles[index].urlToImage!,
                  desc: articles[index].description!,
                  title: articles[index].title!,
                  url: articles[index].link!,
                  author: articles[index].author!,
                  lastModifiedDate: articles[index].lastModifiedDate!);
            }),
      ),
    );
  }
}

class AllNewsSection extends StatelessWidget {
  String Image, title, url, desc, author, lastModifiedDate;
  // Widget desc; // Accepts a Widget instead of a String
  AllNewsSection(
      {required this.Image,
      required this.desc,
      required this.title,
      required this.author,
      required this.lastModifiedDate,
      required this.url});

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ArticleView(
                    title: title,
                    imageUrl: Image,
                    desc: desc,
                    lastModified: lastModifiedDate,
                    author: author,
                  )),
        );
      },
      child: Container(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: Image,
                width: MediaQuery.of(context).size.width,
                height: 200,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => Container(
                  color: Color.fromRGBO(
                      160, 160, 160, 1.0), // light grey box as placeholder
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                ),
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Text(
              title,
              maxLines: 2,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Html(
              data: desc.split(RegExp(r'\s+')).take(25).join(' '),
              style: {
                "*": Style(
                    color: Colors.black54,
                    fontWeight: FontWeight.normal,
                    lineHeight: LineHeight.number(
                        0)), // Set color to black for all elements
              },
            ), // Display the description directly as a Widget
            const SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
