import 'package:flutter/material.dart';
import 'package:caar/constants.dart';
import 'package:caar/data.dart';
import '../webview_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:caar/cars/fiat/car_version_egea_cross.dart';


class Fiat600Details extends StatefulWidget {
  final Car car;
  const Fiat600Details({required this.car});

  @override
  _Fiat600DetailsState createState() => _Fiat600DetailsState();
}

class _Fiat600DetailsState extends State<Fiat600Details> {
  int _currentImage = 0;
  final borderColor = Colors.grey[300] ?? Colors.grey;

  // Sadece motor tipini tutacağız, fiyatı Car nesnesinden alacağız
  String _currentType = "benzinli";
  
  // Özellikler için bir liste tanımlamak yerine, direkt metodlar kullanacağız
  List<Map<String, dynamic>> getSpecifications(String type) {
    if (type == "benzinli") {
      return [
        {"Hız(0-100)": "12.9sn", "svg": "assets/svg/hızsny.svg"},
        {"Motor": "1.4|95 HP", "svg": "assets/svg/motor.svg"},
        {"Maks. Hız": "174 km/h", "svg": "assets/svg/makshız.svg"}
      ];
    } else { // dizel
      return [
        {"Hız(0-100)": "10.2sn", "svg": "assets/svg/hızsny.svg"},
        {"Motor": "1.6|130HP", "svg": "assets/svg/motor.svg"},
        {"Maks. Hız": "200 km/s", "svg": "assets/svg/makshız.svg"}
      ];
    }
  }

  // Varsayılan olarak benzinli tipi
  

  List<Widget> buildPageIndicator() {
    List<Widget> list = [];
    for (var i = 0; i < widget.car.images.length; i++) {
      list.add(buildIndicator(i == _currentImage));
    }
    return list;
  }

  Widget buildIndicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 6),
      height: 8,
      width: isActive ? 20 : 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.black : Colors.grey[400],
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                width: 45,
                                height: 45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                  border: Border.all(
                                    color: borderColor,
                                    width: 1,
                                  ),
                                ),
                                child: Icon(
                                  Icons.keyboard_arrow_left,
                                  color: Colors.black,
                                  size: 28,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 45,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: kPrimaryColor,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.bookmark_border,
                                    color: Colors.white,
                                    size: 22,
                                  ),
                                ),
                                SizedBox(width: 16),
                                Container(
                                  width: 45,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                    border: Border.all(
                                      color: borderColor,
                                      width: 1,
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.share,
                                    color: Colors.black,
                                    size: 22,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          widget.car.model,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          widget.car.brand,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Expanded(
                        child: Container(
                          child: PageView(
                            physics: BouncingScrollPhysics(),
                            onPageChanged: (int page) {
                              setState(() {
                                _currentImage = page;
                              });
                            },
                            children: widget.car.images.map((path) {
                              return Container(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: Hero(
                                  tag: widget.car.model,
                                  child: Image.asset(
                                    path,
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      widget.car.images.length > 1
                          ? Container(
                              margin: EdgeInsets.symmetric(vertical: 16),
                              height: 30,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: buildPageIndicator(),
                              ),
                            )
                          : Container(),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _currentType = "benzinli";
                                  // Fiyatı artık burada değiştirmiyoruz
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: _currentType == "benzinli" ? Colors.blue : Colors.white,
                                foregroundColor: _currentType == "benzinli" ? Colors.white : Colors.black,
                                padding:
                                    EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  side: BorderSide(color: borderColor),
                                ),
                              ),
                              child: Text('Benzinli'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _currentType = "dizel";
                                  // Fiyatı artık burada değiştirmiyoruz
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: _currentType == "dizel" ? Colors.blue : Colors.white,
                                foregroundColor: _currentType == "dizel" ? Colors.white : Colors.black,
                                padding:
                                    EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  side: BorderSide(color: borderColor),
                                ),
                              ),
                              child: Text('Dizel'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CarVersionsScreen(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,
                                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: Text('Versiyonlar'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                      child: Text(
                        "ÖZELLİKLER",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[400],
                        ),
                      ),
                    ),
                    Container(
                      height: 100, // Yüksekliği artırdık (80'den 100'e)
                      padding: EdgeInsets.only(top: 8, left: 16),
                      margin: EdgeInsets.only(bottom: 16),
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: getSpecifications(_currentType)
                            .map((spec) => buildSpecificationCar(
                                spec.keys.first.toString(), 
                                spec.values.first.toString(),
                                spec["svg"]
                              ))
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 90,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Başlangıç Fiyatı",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "₺ ${widget.car.price}", // Car nesnesindeki price değerini kullanıyoruz
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WebViewScreen(
                            url:
                                'https://www.otomobil.fiat.com.tr/modeller/egea/cross',
                          ),
                        ),
                      );
                    },
                    child: Text(
                      "Ayrıntılar...",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSpecificationCar(String title, String data, [String? svgPath]) {
  return Container(
    width: 160,
    height: 90, // Container'a sabit yükseklik ekledik
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
    ),
    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16), // Padding'i biraz arttırdık
    margin: EdgeInsets.only(right: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
        SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center, // Ortalamayı sağlar
          children: [
            if (svgPath != null) ...[
              Container(
                width: 36,
                height: 36,
                child: SvgPicture.asset(
                  svgPath,
                  fit: BoxFit.contain, // SVG'nin container içinde uygun şekilde sığdırılmasını sağlar
                ),
              ),
              SizedBox(width: 8),
            ],
            Expanded(
              child: Text(
                data,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2, // Uzun metinler için 2 satıra izin ver
                overflow: TextOverflow.ellipsis, // Taşan metni ... ile göster
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
}