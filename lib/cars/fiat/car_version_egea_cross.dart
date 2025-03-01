import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CarVersionsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> carVersions = [
    {
      'image': 'assets/images/fiat/fiat_limited.jpg',
      'name': 'Limited',
      'features': ['Lounge versiyona ilave olarak;', '17’’ Limited Çizgi Tasarım Alaşım Jantlar',
       'Çizgi Tasarım Tavan Rayları', 'Özel Limited Logosu','Ön Izgara Dağ Figürü',
       'Kahverengi Eco-Leather Koltuklar ve Kapı Paneller','Arka Kolçak',
       'Isıtmalı Ön Koltuklar','Kör Nokta Uyarı Sistemi0','Ön Park Sensörü',
       'Sürücü Koltuğu Elektrik Ayarlı Bel Desteği']
    },
    {
      'image': 'assets/images/fiat/fiat_lounge.jpg',
      'name': 'Lounge',
      'features': ['Urban versiyona ilave olarak;', ' 10’’ Tablet Ekran',
      '7'' Renkli TFT Gösterge Paneli','Kablosuz Apple Carplay / Android Auto',' Kablosuz Akıllı Telefon Şarj',
      'Anahtarsız Giriş ve Çalıştırma',' Yağmur ve Karanlık Sensörü','Karartılmış Arka Camlar',
      ' Akıllı Uzun Farlar','Otomatik Kararan İç Dikiz Aynası']
    },
    {
      'image': 'assets/images/fiat/fiat_street.jpg',
      'name': 'Street',
      'features': ['Street versiyona ilave olarak;', '17’’ Elmas Kesim Alaşımlı Jantlar', 
      'Buz Grisi Cross Ön Tampon ve Gövde Kaplamaları', 'Deri Direksiyon Simidi ve Vites Topuzu',
      'Full LED Ön Farlar & LED Arka Farlar','Carplay / Android Auto Destekli 7’’ Tablet Ekran',
      'Otomatik Klima']
    },
    {
      'image': 'assets/images/fiat/fiat_urban.jpg',
      'name': 'Urban',
      'features': ['16" Cross Stil Jantlar', '5" Renkli TFT Ekranlı Radyo', '3,5’’ TFT Gösterge Paneli',
      'Traction+','Ön Sis Farı','Geri Görüş Kamerası','Arka Park Sensörü','Yorgunluk Asistanı',
      'Şerit Takip Asistanı',' Trafik İşareti Tanıma Sistemi','Akıllı Hız Destek Sistemi',
      ' Çarpışma Riski Uyarı Sistemi','Otomatik Acil Durum Freni','Ön, Yan ve Perde Hava Yastıkları']
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