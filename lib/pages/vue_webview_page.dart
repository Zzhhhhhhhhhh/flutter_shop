import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VueWebView extends StatefulWidget {
  const VueWebView({super.key});

  @override
  State<VueWebView> createState() => _VueWebViewState();
}

class _VueWebViewState extends State<VueWebView> {
  late final WebViewController controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            print('WebView加载进度: $progress%');
          },
          onPageStarted: (String url) {
            setState(() {
              _isLoading = true;
            });
            print('🚀 开始加载: $url');
          },
          onPageFinished: (String url) {
            setState(() {
              _isLoading = false;
            });
            print('✅ 加载完成: $url');
          },
          onWebResourceError: (WebResourceError error) {
            print('❌ 加载错误: ${error.errorCode} - ${error.description}');
            setState(() {
              _isLoading = false;
            });
          },
          onUrlChange: (UrlChange change) {
            print('🔗 URL变化: ${change.url}');
          },
        ),
      )
      ..loadRequest(Uri.parse('http://192.168.1.187/#/'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   actions: [
      //     IconButton(
      //       icon: const Icon(Icons.refresh),
      //       onPressed: () {
      //         controller.reload();
      //       },
      //     ),
      //   ],
      // ),
      body: Stack(
        children: [
          WebViewWidget(controller: controller),
          if (_isLoading)
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}