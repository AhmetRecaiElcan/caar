import 'package:flutter/material.dart';
import 'package:caar/data/brand_data.dart';
import 'package:caar/cars/webview_screen.dart';
import 'package:caar/main.dart';

class PricesPage extends StatefulWidget {
  @override
  _PricesPageState createState() => _PricesPageState();
}

class _PricesPageState extends State<PricesPage> {
  List<Brand> brands = getBrandList();
  
  // Brand URL mappings
  final Map<String, String> brandUrls = {
    'BMW': 'https://www.bmw.com.tr/tr/fastlane/bmw-fiyat-listesi.html',
    'Mercedes': 'https://fiyat.mercedes-benz.com.tr/one-cikan-modeller',
    'Audi': 'https://fiyatlistesi.audi.com.tr/',
    'Toyota': 'https://turkiye.toyota.com.tr/middle/fiyat-listesi/',
    'Honda': 'https://www.honda.com.tr/otomobil/otomobil-fiyat-listesi-2024',
    'Ford': 'https://www.ford.com.tr/fiyat-listesi/otomobil/',
    'BYD': 'https://www.bydauto.com.tr/fiyat-listesi',
    'Fiat': 'https://kampanya.fiat.com.tr/Pdf/Fiyatlar/OtomobilFiyatListesi.pdf',
    // Add more brand URLs as needed
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Güncel Fiyatlar",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Marka Fiyat Listesi",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.1,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemCount: brands.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    final url = brandUrls[brands[index].name];
                    if (url != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WebViewScreen(url: url),
                        ),
                      );
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            brands[index].image,
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              brands[index].name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            if (brands[index].isVerified)
                              Padding(
                                padding: const EdgeInsets.only(left: 4),
                                child: Icon(
                                  Icons.verified,
                                  color: Colors.blue,
                                  size: 16,
                                ),
                              ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Fiyat Listesi",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
