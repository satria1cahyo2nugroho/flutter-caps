import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class Pages extends StatefulWidget {
  const Pages({Key? key}) : super(key: key);

  @override
  State<Pages> createState() => _WebviewPageState();
}

class _WebviewPageState extends State<Pages> {
  WebViewController? _controller;
  
  @override
  void initState() {
  super.initState();
  _controller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..setBackgroundColor(const Color(0x00000000))
  ..setNavigationDelegate(
    NavigationDelegate(
      onProgress: (int progress) {
        // Update loading bar.
      },
      onPageStarted: (String url) {},
      onPageFinished: (String url) {},
      onWebResourceError: (WebResourceError error) {},
      onNavigationRequest: (NavigationRequest request) {
        if (request.url.startsWith('https://www.youtube.com/')) {
          return NavigationDecision.prevent;
        }
        return NavigationDecision.navigate;
      },
    ),
  )
  ..loadRequest(Uri.parse('http://192.168.0.102:8501/'));
  
     }
  @override
  Widget build(BuildContext context) {
  return Scaffold(
       body: WebViewWidget(controller: _controller!));
  }
}