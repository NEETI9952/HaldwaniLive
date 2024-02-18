import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:haldwani_live/models/simple_article_model.dart';
import 'package:haldwani_live/pages/article_view.dart';
import 'package:haldwani_live/services/news.dart';

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
    setState(() {
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "लेटेस्ट न्यूज़!",
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
                  desc: Html(
                    data: articles[index].description!
                        .split(' ')
                        .take(25)
                        .join(' '),
                            ),
                  title: articles[index].title!,
                  url: articles[index].link!);
            }),
      ),
    );
  }
}

class AllNewsSection extends StatelessWidget {
  String Image,  title, url;
  Widget desc; // Accepts a Widget instead of a String
  AllNewsSection(
      {required this.Image,
        required this.desc,
        required this.title,
        required this.url});

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ArticleView(blogUrl: url)),
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
                  color: Color.fromRGBO(160, 160, 160, 1.0),  // light grey box as placeholder
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
            desc, // Display the description directly as a Widget
            const SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }

}