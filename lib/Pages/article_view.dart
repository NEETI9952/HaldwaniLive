import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  final String blogUrl;

  ArticleView({required
  this.blogUrl});

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  bool _isLoading = true;

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
      body: Stack(
        children: [
          WebView(
            initialUrl: widget.blogUrl,
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (_) {
              setState(() {
                _isLoading = false;
              });
            },
            onPageStarted: (_) {
              setState(() {
                _isLoading = true;
              });
            },
            onWebResourceError: (error) {
              // Handle web resource errors
            },
          ),
          if (_isLoading)
            Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
