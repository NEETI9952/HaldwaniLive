import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:haldwani_live/models/simple_article_model.dart';
import '../models/category_model.dart';
import '../services/catergory_types.dart';
import '../services/news.dart';
import 'all_news.dart';
import 'article_view.dart';
import 'category_news.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // List<CategoryModel> categories = [];
  List<SimpleArticleModel> articles = [];
  bool _loading = true, loading2 = true;

  int activeIndex = 0;
  @override
  void initState() {
    getCategories();
    // getSlider();
    getNews();
    super.initState();
  }

  // getCategories() async {
  //   CategoryTypes categoryTypes = CategoryTypes();
  //   await categoryTypes.getCategories();
  //   categories = categoryTypes.categories;
  //   setState(() {
  //     _loading3 = false;
  //   });
  // }

  List<CategoryModel> categories =getCategories();


  getNews() async {
    News newsclass = News();
    await newsclass.getNews();
    articles = newsclass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Khabar",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ), //खबर
            Text(
              "पहाड़    ",
              style: TextStyle(color: Color(0xFFB0DAB9), fontWeight: FontWeight.bold),
            )
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10.0),
                      height: 80,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return CategoryTile(
                            categoryName: categories[index].categoryName,
                            id: categories[index].id,
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 30.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Latest News!", //ब्रेकिंग न्यूज़ · समाचार तोड़ · ताज़ा ख़बर
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              fontFamily: 'Pacifico',
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      AllNews(news: "Trending"),
                                ),
                              );
                            },
                            child: Text(
                              "View All",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.blue,
                                color: Colors.blue,
                                fontWeight: FontWeight.w500,
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.0),
                    _loading
                        ? Center(child: CircularProgressIndicator())
                        : Container(
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              itemCount: articles.length,
                              itemBuilder: (context, index) {
                                return BlogTile(
                                    url: articles[index].link!,
                                    desc: articles[index].description!,
                                    // Html(
                                    //   data: articles[index].description!
                                    //       .split(' ')
                                    //       .take(10)
                                    //       .join(' '),
                                    // ),
                                    imageUrl: articles[index].urlToImage!,
                                    title: articles[index].title!,
                                    author: articles[index].author!,
                                    lastModifiedDate:
                                        articles[index].lastModifiedDate!);
                              },
                            ),
                          ),
                  ],
                ),
              ),
            ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final categoryName, id;
  CategoryTile({this.categoryName,  this.id});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    CategoryNews(categoryId: id, name: categoryName)));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        child: Stack(
          children: <Widget>[
            Container(
              width: 120,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                gradient: LinearGradient(
                  colors: [Color(0xFFDAD299), Color(0xFFB0DAB9)], //#D8B5FF → #1EAE98 #c0392b-.#8e44ad #b31217
                  begin: Alignment.topLeft, // Define the start point of the gradient
                  end: Alignment.bottomRight, // Define the end point of the gradient
                  // You can also set stops to control the distribution of colors
                  // stops: [0.0, 0.5, 1.0],
                  // tileMode: TileMode.clamp, // Define how the gradient should fill the container
                ),
              ),
              child: Container(
                margin: EdgeInsets.only(left: 6,right: 6),
                child: Center(
                    child: Text(
                      categoryName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imageUrl, title, url, desc, author, lastModifiedDate;
  // Widget desc;

  BlogTile(
      {required this.desc,
      required this.imageUrl,
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
              imageUrl: imageUrl,
              desc: desc,
              lastModified: lastModifiedDate,
              author: author,
            ),
          ),
        );
      },
      child: Container(
        height: 160,
        margin: EdgeInsets.only(bottom: 10.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Material(
            elevation: 3.0,
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:5,top:10,right:10,bottom:10), // Add padding here
                    child: Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                          imageUrl: imageUrl,
                          height: 150,
                          width: 120,
                          fit: BoxFit.cover,
                          errorWidget: (context, url, error) => Container(
                            color: Color.fromRGBO(160, 160, 160, 1.0),
                            height: 140,
                            width: 120,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 4.0,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10.0),
                          child: Text(
                            title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 17.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Html(
                              data: '${(desc.split(RegExp('<p>')).take(2).join(' ')).split(RegExp(r'\s+')).take(11).join(' ').replaceAll('\n', '').replaceAll('\t', '')}...',
                              style: {
                                "*": Style(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.normal,
                                  fontSize: FontSize(13.0),
                                  lineHeight: LineHeight.number(0),
                                ),
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }



}
