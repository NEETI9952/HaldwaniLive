import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:haldwani_live/models/simple_article_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../models/category_model.dart';
import '../models/slider_model.dart';
import '../services/catergory_types.dart';
import '../services/news.dart';
import '../services/slider_data.dart';
import 'all_news.dart';
import 'article_view.dart';
import 'category_news.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  List<sliderModel> sliders = [];
  List<SimpleArticleModel> articles = [];
  bool _loading = true, loading2=true, _loading3=true;

  int activeIndex = 0;
  @override
  void initState() {
    getCategories();
    // getSlider();
    getNews();
    super.initState();
  }

  getCategories() async {
    CategoryTypes categoryTypes = CategoryTypes();
    await categoryTypes.getCategories();
    categories = categoryTypes.categories;
    setState(() {
      _loading3 = false;
    });
  }

  getNews() async {
    News newsclass = News();
    await newsclass.getNews();
    articles = newsclass.news;
    setState(() {
      _loading = false;
    });
  }

  // getSlider() async {
  //   Sliders slider= Sliders();
  //   await slider.getSlider();
  //   sliders = slider.sliders;
  //   setState(() {
  //     loading2=false;
  //   });
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Haldwani"),
            Text(
              "Live",
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            )
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: _loading3
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
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
                        image: categories[index].image,
                        categoryName: categories[index].categoryName,
                        id: categories[index].id,
                      );
                    }),
              ),
              const SizedBox(
                height: 30.0,
              ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       const Text(
              //         "Breaking News!",
              //         style: TextStyle(
              //             color: Colors.black,
              //             fontWeight: FontWeight.bold,
              //             fontSize: 18.0,
              //             fontFamily: 'Pacifico'),
              //       ),
              //       GestureDetector(
              //         onTap: (){
              //           Navigator.push(context, MaterialPageRoute(builder: (context)=> AllNews(news: "Breaking")));
              //         },
              //         child: const Text(
              //           "View All",
              //           style: TextStyle(
              //               decoration: TextDecoration.underline,
              //               decorationColor: Colors.blue,
              //               color: Colors.blue,
              //               fontWeight: FontWeight.w500,
              //               fontSize: 14.0),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // const SizedBox(
              //   height: 20.0,
              // ),
              // // loading2? const Center(child: CircularProgressIndicator()):  CarouselSlider.builder(
              // //     itemCount: 5,
              // //     itemBuilder: (context, index, realIndex) {
              // //       String? res = sliders[index].urlToImage;
              // //       String? res1 = sliders[index].title;
              // //       return buildImage(res!, index, res1!);
              // //     },
              // //     options: CarouselOptions(
              // //         height: 250,
              // //         autoPlay: true,
              // //         enlargeCenterPage: true,
              // //         enlargeStrategy: CenterPageEnlargeStrategy.height,
              // //         onPageChanged: (index, reason) {
              // //           setState(() {
              // //             activeIndex = index;
              // //           });
              // //         })),
              // // const SizedBox(
              // //   height: 30.0,
              // // ),
              // // Center(child: buildIndicator()),--dot progress bar
              // const SizedBox(
              //   height: 30.0,
              // ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Trending News!",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          fontFamily: 'Pacifico'),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> AllNews(news: "Trending")));
                      },
                      child: const Text(
                        "View All",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.blue,
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.0),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              // _loading? const Center(child: CircularProgressIndicator()):  CarouselSlider.builder(
              //     itemCount: 5,
              //     itemBuilder: (context, index, realIndex) {
              //       String? res = articles[index].urlToImage;
              //       String? res1 = articles[index].title;
              //       return buildImage(res!, index, res1!);
              //     },
              //     options: CarouselOptions(
              //         height: 250,
              //         autoPlay: true,
              //         enlargeCenterPage: true,
              //         enlargeStrategy: CenterPageEnlargeStrategy.height,
              //         onPageChanged: (index, reason) {
              //           setState(() {
              //             activeIndex = index;
              //           });
              //         }))
              _loading? const Center(child: CircularProgressIndicator()):Container(
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: articles.length,
                    itemBuilder: (context, index) {
                      return BlogTile(
                          url:  articles[index].link!,
                          desc: Html(
                            data: articles[index].description!
                                .split(' ')
                                .take(10)
                                .join(' '),
                          ),
                          imageUrl: articles[index].urlToImage!,
                          title: articles[index].title!);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Widget buildImage(String image, int index, String name) => Container(
  //     margin: EdgeInsets.symmetric(horizontal: 5.0),
  //     child: Stack(children: [
  //       ClipRRect(
  //         borderRadius: BorderRadius.circular(10),
  //         child: CachedNetworkImage(
  //
  //           height: 250,
  //           fit: BoxFit.cover,
  //           width: MediaQuery.of(context).size.width, imageUrl: image,
  //         ),
  //       ),
  //       Container(
  //         height: 250,
  //         padding: const EdgeInsets.only(left: 10.0),
  //         margin: const EdgeInsets.only(top: 170.0),
  //         width: MediaQuery.of(context).size.width,
  //         decoration: const BoxDecoration(
  //             color: Colors.black45,
  //             borderRadius: BorderRadius.only(
  //                 bottomLeft: Radius.circular(10),
  //                 bottomRight: Radius.circular(10))),
  //         child: Center(
  //           child: Text(
  //             name,
  //             maxLines: 2,
  //             style: const TextStyle(
  //                 color: Colors.white,
  //                 fontSize: 20.0,
  //                 fontWeight: FontWeight.bold),
  //           ),
  //         ),
  //       )
  //     ]));

  // Widget buildIndicator() => AnimatedSmoothIndicator(
  //   activeIndex: activeIndex,
  //   count: 5,
  //   effect: const SlideEffect(
  //       dotWidth: 15, dotHeight: 15, activeDotColor: Colors.blue),
  // );
}

class CategoryTile extends StatelessWidget {
  final image, categoryName, id;
  CategoryTile({this.categoryName, this.image, this.id});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> CategoryNews(categoryId:id,name: categoryName)));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset(
                image,
                width: 120,
                height: 80,
                fit: BoxFit.cover,

              ),
            ),
            Container(
              width: 120,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black38,
              ),
              child: Center(
                  child: Text(
                    categoryName,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  String imageUrl, title, url;
  Widget desc;
  BlogTile({required this.desc, required this.imageUrl, required this.title, required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> ArticleView(blogUrl:url )));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Material(
            elevation: 3.0,
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Container(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            imageUrl: imageUrl,
                            height: 140,
                            width: 120,
                            fit: BoxFit.cover,
                          ))),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 1.7,
                        child: Text(
                          title,
                          maxLines: 2,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 17.0),
                        ),
                      ),
                      const SizedBox(
                        height: 7.0,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.7,
                        child: desc,
                      ),
                    ],
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



