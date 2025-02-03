import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart' show kIsWeb; // WEB kontrolü için

class WebViewScreen extends StatefulWidget {
  final String url;
  WebViewScreen({required this.url});

  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  String? pdfPath;
  bool isPDF = false;

  @override
  void initState() {
    super.initState();
    isPDF = widget.url.toLowerCase().endsWith('.pdf');

    if (isPDF && !kIsWeb) {
      _downloadAndSavePDF(widget.url);
    }
  }

  /// 📂 PDF dosyasını indir ve yerel kaydet (Sadece Android ve iOS için)
  Future<void> _downloadAndSavePDF(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final Uint8List bytes = response.bodyBytes;
        final dir = await getApplicationDocumentsDirectory();
        final file = File('${dir.path}/temp.pdf');
        await file.writeAsBytes(bytes, flush: true);

        setState(() {
          pdfPath = file.path;
        });
      } else {
        throw Exception("PDF indirilemedi: HTTP ${response.statusCode}");
      }
    } catch (e) {
      print("PDF indirme hatası: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isPDF) {
      if (kIsWeb) {
        // 🌐 **Web için PDF çözümü: iFrame ile aç**
        return Scaffold(
          appBar: AppBar(title: Text("PDF Görüntüleyici")),
          body: Center(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: HtmlElementView(viewType: 'iframeElement'),
            ),
          ),
        );
      } else {
        // 📱 **Android & iOS için PDF çözümü: flutter_pdfview**
        return Scaffold(
          appBar: AppBar(title: Text("PDF Görüntüleyici")),
          body: pdfPath == null
              ? Center(child: CircularProgressIndicator())
              : PDFView(
                  filePath: pdfPath!,
                  enableSwipe: true,
                  swipeHorizontal: false,
                  autoSpacing: true,
                  pageFling: true,
                  onError: (error) => print("PDF Hatası: $error"),
                ),
        );
      }
    } else {
      if (kIsWeb) {
        // 🌐 **Web için WebView çözümü: Tarayıcıda aç**
        return Scaffold(
          appBar: AppBar(title: Text("Web Sayfası")),
          body: Center(
            child: ElevatedButton(
              onPressed: () async {
                if (await canLaunch(widget.url)) {
                  await launch(widget.url);
                } else {
                  print("Bağlantı açılamadı: ${widget.url}");
                }
              },
              child: Text("Web sitesini aç"),
            ),
          ),
        );
      } else {
        // 📱 **Android & iOS için WebView çözümü**
        return Scaffold(
          appBar: AppBar(title: Text("Web Sayfası")),
          body: WebViewWidget(
            controller: WebViewController()
              ..setJavaScriptMode(JavaScriptMode.unrestricted)
              ..loadRequest(Uri.parse(widget.url)),
          ),
        );
      }
    }
  }
}
