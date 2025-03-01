import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CarVersionsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> carVersions = [
    {
      'image': 'assets/images/fiat_limited.jpg',
      'name': 'Limited',
      'features': ['Lounge versiyona ilave olarak;', '17’’ Limited Çizgi Tasarım Alaşım Jantlar',
       'Çizgi Tasarım Tavan Rayları', 'Özel Limited Logosu','Ön Izgara Dağ Figürü',
       'Kahverengi Eco-Leather Koltuklar ve Kapı Paneller','Arka Kolçak','Isıtmalı Ön Koltuklar',
       'Isıtmalı Ön Koltuklar','Kör Nokta Uyarı Sistemi0','Ön Park Sensörü',
       'Sürücü Koltuğu Elektrik Ayarlı Bel Desteği']
    },
    {
      'image': 'assets/images/fiat/fiat_lounge.jpg',
      'name': 'Lounge',
      'features': ['250 HP', 'Manual', 'Sport Mode', 'Navigation System']
    },
    {
      'image': 'assets/images/fiat/fiat_street.jpg',
      'name': 'Street',
      'features': ['300 HP', 'Automatic', 'Luxury Interior', 'Adaptive Cruise Control']
    },
    {
      'image': 'assets/images/fiat/fiat_urban.jpg',
      'name': 'Urban',
      'features': ['350 HP', 'Hybrid', 'Sunroof', '360 Camera']
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Versions', style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: carVersions.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              margin: EdgeInsets.only(bottom: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        carVersions[index]['image'],
                        height: 150,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      carVersions[index]['name'],
                      style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: carVersions[index]['features']
                          .map<Widget>((feature) => Padding(
                                padding: EdgeInsets.symmetric(vertical: 2.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(Icons.check, color: Colors.green, size: 18),
                                    SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        feature,
                                        style: GoogleFonts.poppins(fontSize: 14),
                                        softWrap: true,
                                        overflow: TextOverflow.visible,
                                      ),
                                    ),
                                  ],
                                ),
                              ))
                          .toList(),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}