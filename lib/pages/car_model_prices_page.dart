import 'package:flutter/material.dart';
import 'package:caar/cars/webview_screen.dart';
import 'package:caar/data/car_urls.dart';

class CarModel {
  final String name;
  final String image;
  final String priceUrl;
  final String description;

  CarModel({
    required this.name,
    required this.image,
    required this.priceUrl,
    required this.description,
  });
}

Map<String, List<CarModel>> brandModels = {
  'Honda': [
    CarModel(
      name: 'Civic',
      image: 'assets/images/honda_civic0.png',
      priceUrl: 'https://honda.com.tr/civic',
      description: '1.5L VTEC Turbo',
    ),
    CarModel(
      name: 'City',
      image: 'assets/images/honda_city0.png',
      priceUrl: 'https://honda.com.tr/city',
      description: '1.5L i-VTEC',
    ),
    CarModel(
      name: 'CR-V',
      image: 'assets/images/honda_1.png',
      priceUrl: 'https://honda.com.tr/cr-v',
      description: '2.0L e:HEV Hibrit',
    ),
    CarModel(
      name: 'ZR-V',
      image: 'assets/images/honda_4.png',
      priceUrl: 'https://honda.com.tr/zr-v',
      description: '2.0L e:HEV Hibrit',
    ),
    CarModel(
      name: 'HR-V',
      image: 'assets/images/honda_hrv0.png',
      priceUrl: 'https://honda.com.tr/hr-v',
      description: '1.5L e:HEV Hibrit',
    ),
  ],
  'BMW': [
    CarModel(
      name: '3 Serisi',
      image: 'assets/images/bmw3.png',
      priceUrl: 'https://www.bmw.com.tr/tr/fastlane/bmw-3-serisi-sedan-fiyat.html',
      description: '320i M Sport',
    ),
    CarModel(
      name: '5 Serisi',
      image: 'assets/images/bmw5.png',
      priceUrl: 'https://www.bmw.com.tr/tr/fastlane/bmw-5-serisi-sedan-fiyat.html',
      description: '520i M Sport',
    ),
  ],
};

class CarModelPricesPage extends StatelessWidget {
  final String brandName;

  CarModelPricesPage({required this.brandName});

  @override
  Widget build(BuildContext context) {
    final models = brandModels[brandName] ?? [];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "$brandName Modelleri",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () {
                final url = CarUrls.getBrandMainUrl(brandName);
                if (url != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WebViewScreen(url: url),
                    ),
                  );
                }
              },
              child: Text('Genel Fiyat Listesi'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ),
          Expanded(
            child: models.isEmpty 
              ? Center(
                  child: Text('Bu marka için model bilgisi bulunmamaktadır.'),
                )
              : GridView.builder(
                  padding: EdgeInsets.all(16),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: models.length,
                  itemBuilder: (context, index) {
                    final model = models[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WebViewScreen(url: model.priceUrl),
                          ),
                        );
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(15),
                                ),
                                child: Image.asset(
                                  model.image,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    model.name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    model.description,
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    "Fiyat Listesi",
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
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
