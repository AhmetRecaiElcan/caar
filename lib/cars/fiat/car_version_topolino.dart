import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CarVersionsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> carVersions = [
    {
      'image': 'assets/images/fiat/fiat_topolino3.jpg',
      'name': 'Topolino',
      'features': ['Cam Tavan','• Gümüş detaylar','• Vintage Aynalar','• Jant kapakları',
      '• Siyah Paspaslar',' Telefon Tutucu',]
    },
    {
      'image': 'assets/images/fiat/fiat_topolino4.jpg',
      'name': 'Plus Paket',
      'features': ['Topolino donanımına ek olarak:','Arka Taşıma Ünitesi',
      'Dolcevita Box ( Ön Konsol Saklama Alanı)']
    },
    {
      'image': 'assets/images/fiat/fiat_topolino5.jpg',
      'name': 'Urban',
      'features': ['Easy versiyona ilave olarak;','16" Stil Jantlar',
      'Ön Sis Farı',' İmza LED Gündüz Farları','Full LED Ön Farlar',' Carplay / Android Auto Destekli 7’’ Tablet Ekran',
      'Deri Direksiyon Simidi ve Vites Topuzu','Otomatik Klima',' Ön Sis Farları']
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