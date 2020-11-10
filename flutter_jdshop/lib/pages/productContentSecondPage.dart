import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../model/ProductContentModel.dart';

class ProductContentSecondPage extends StatefulWidget {
  final ProductContentModel _productContentModel;
  ProductContentSecondPage(this._productContentModel);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProductContentSecondState();
  }
}

class _ProductContentSecondState extends State<ProductContentSecondPage> with AutomaticKeepAliveClientMixin{
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          Scaffold.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }

  String _webViewRequestUrl= "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._webViewRequestUrl = 'http://jd.itying.com/pcontent?id=${widget._productContentModel.result.sId}';
    print(this._webViewRequestUrl);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WebView(
      initialUrl: this._webViewRequestUrl,
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) {
        _controller.complete(webViewController);
      },
      // TODO(iskakaushik): Remove this when collection literals makes it to stable.
      // ignore: prefer_collection_literals
      javascriptChannels: <JavascriptChannel>[
        _toasterJavascriptChannel(context),
      ].toSet(),
      navigationDelegate: (NavigationRequest request) {
        if (request.url.startsWith('https://www.youtube.com/')) {
          print('blocking navigation to $request}');
          return NavigationDecision.prevent;
        }
        print('allowing navigation to $request');
        return NavigationDecision.navigate;
      },
      onPageStarted: (String url) {
        print('Page started loading: $url');
      },
      onPageFinished: (String url) {
        print('Page finished loading: $url');
      },
      gestureNavigationEnabled: true,
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
