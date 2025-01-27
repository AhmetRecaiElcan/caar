import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class WebViewScreen extends StatelessWidget {
  final String url;

  WebViewScreen({required this.url});

  bool isPDF() {
    return url.toLowerCase().endsWith('.pdf');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          isPDF() ? "PDF Görüntüleyici" : "Web Sayfası",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: isPDF()
          ? PDFViewWidget(url: url)
          : WebViewWidget(
              controller: WebViewController()
                ..setJavaScriptMode(JavaScriptMode.unrestricted)
                ..loadRequest(Uri.parse(url)),
            ),
    );
  }
}

class PDFViewWidget extends StatefulWidget {
  final String url;
  PDFViewWidget({required this.url});

  @override
  _PDFViewWidgetState createState() => _PDFViewWidgetState();
}

class _PDFViewWidgetState extends State<PDFViewWidget> {
  late PDFViewController _pdfViewController;
  bool _isReady = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PDFView(
          filePath: widget.url,
          onRender: (pages) {
            setState(() {
              _isReady = true;
            });
          },
          onViewCreated: (controller) {
            _pdfViewController = controller;
          },
          onError: (error) {
            print(error.toString());
          },
        ),
        if (!_isReady)
          Center(
            child: CircularProgressIndicator(),
          ),
      ],
    );
  }
}
