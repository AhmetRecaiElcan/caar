import 'package:flutter/material.dart';
import 'package:caar/data/brand_data.dart';
import 'package:caar/data/car_urls.dart';
import 'package:caar/cars/webview_screen.dart';
import 'package:caar/main.dart';
import 'package:caar/pages/car_model_prices_page.dart';

class PricesPage extends StatefulWidget {
  @override
  _PricesPageState createState() => _PricesPageState();
}

class _PricesPageState extends State<PricesPage> {
  List<Brand> brands = getBrandList();

  void _handleBrandTap(Brand brand) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CarModelPricesPage(brandName: brand.name),
      ),
    );
  }

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
                  onTap: () => _handleBrandTap(brands[index]),
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

class ModelSelectionSheet extends StatelessWidget {
  final String brand;
  final List<String> models;

  ModelSelectionSheet({required this.brand, required this.models});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "$brand Modelleri",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: models.length + 1, // +1 for general price list
              itemBuilder: (context, index) {
                if (index == 0) {
                  return ListTile(
                    title: Text("Genel Fiyat Listesi"),
                    onTap: () {
                      final url = CarUrls.getBrandMainUrl(brand);
                      if (url != null) {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WebViewScreen(url: url),
                          ),
                        );
                      }
                    },
                  );
                }
                final model = models[index - 1];
                return ListTile(
                  title: Text(model),
                  onTap: () {
                    final url = CarUrls.getModelUrl(brand, model);
                    if (url != null) {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WebViewScreen(url: url),
                        ),
                      );
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
