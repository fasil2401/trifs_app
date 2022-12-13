import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewSinglePage extends StatelessWidget {
   WebViewSinglePage({Key? key, required this.name, required this.url}) : super(key: key);

  final String url;
  final String name ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('$name',style: TextStyle(color: Colors.blue),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.blue,),
          onPressed: (){
            Get.back();
          },
        ),
      ),
      body: SafeArea(
        child: WebView(
          initialUrl: '$url',
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
