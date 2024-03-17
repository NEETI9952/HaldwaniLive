import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:haldwani_live/models/simple_article_model.dart';
import 'package:haldwani_live/services/show_category_news.dart';

import 'article_view.dart';

class CategoryNews extends StatefulWidget {
  int categoryId;
  String name;
  CategoryNews({required this.categoryId, required this.name});

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<SimpleArticleModel> categoriesNewsList = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getNews();
  }

  getNews() async {
    ShowCategoryNews showCategoryNews = ShowCategoryNews();
    await showCategoryNews.getCategoriesNews(widget.categoryId);
    categoriesNewsList = showCategoryNews.categoriesNews;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.name,
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: _loading
            ? const Center(child: CircularProgressIndicator())
            : Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: categoriesNewsList.length,
                    itemBuilder: (context, index) {
                      return ShowCategory(
                          Image: categoriesNewsList[index].urlToImage!,
                          desc: categoriesNewsList[index].description!,
                          // Html(data: categoriesNewsList[index].description!
                          //       .split(' ')
                          //       .take(25)
                          //       .join(' '),),
                          title: categoriesNewsList[index].title!,
                          url: categoriesNewsList[index].link!,
                          author: categoriesNewsList[index].author!,
                          lastModifiedDate:
                              categoriesNewsList[index].lastModifiedDate!);
                    }),
              ));
  }
}

class ShowCategory extends StatelessWidget {
  String Image, title, url, desc, lastModifiedDate, author;
  // Widget desc;
  ShowCategory(
      {required this.Image,
      required this.desc,
      required this.title,
      required this.url,
      required this.lastModifiedDate,
      required this.author});

  @override
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
                  author: author,
                  lastModified: lastModifiedDate)),
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
            SizedBox(
              height: 5.0,
            ),
            Text(
              title,
              maxLines: 2,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Html(
              data: '<p>${desc.split(RegExp(r'\s+')).take(35).join(' ').replaceAll('\n', '').replaceAll('\t', '')}...</p>',
              style: {
                "*": Style(
                    color: Colors.black54,
                    fontWeight: FontWeight.normal,
                    fontSize: FontSize(13.0),
                    lineHeight: LineHeight.number(
                        0)), // Set color to black for all elements
              },
            ),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
