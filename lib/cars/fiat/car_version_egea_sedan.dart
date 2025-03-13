import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CarVersionsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> carVersions = [
    {
      'image': 'assets/images/fiat/fiat_limited0.jpg',
      'name': 'Limited',
      'features': ['Lounge versiyona ilave olarak;', '17’’ Bronz Alaşım Jantlar',
       'Parlak Siyah Ayna Kapakları ve Kapı Kolları', 'Kahverengi Eco-Leather Kaplı Ön Konsol',
       'Ön Izgara Dağ Figürü','Eller Serbest Bagaj Kapağı','Kahverengi Eco-Leather Koltuklar ve Kapı Paneller',
       'Arka Kolçak','Isıtmalı Ön Koltuklar','Kör Nokta Uyarı Sistemi','Ön Park Sensörü',
       'Sürücü Koltuğu Elektrik Ayarlı Bel Desteği']
    },
    {
      'image': 'assets/images/fiat/fiat_lounge0.jpg',
      'name': 'Lounge',
      'features': ['Urban versiyona ilave olarak;', ' 10’’ Tablet Ekran', '7'' Renkli TFT Gösterge Paneli',
      '17’’ Elmas Kesim Alaşım Jantlar','Kablosuz Apple Carplay / Android Auto',' Kablosuz Akıllı Telefon Şarj',
      'Anahtarsız Giriş ve Çalıştırma',' Yağmur ve Karanlık Sensörü','Karartılmış Arka Camlar','Anahtarsız Giriş ve Çalıştırma',
      ' Akıllı Uzun Farlar','Otomatik Kararan İç Dikiz Aynası','Karanlık Sensörü','Yağmur Sensörü','Otomatik Kararan İç Dikiz Aynası']
    },
    {
      'image': 'assets/images/fiat/fiat_urban0.jpg',
      'name': 'Urban',
      'features': ['Easy versiyona ilave olarak;','16" Stil Jantlar',
      'Ön Sis Farı',' İmza LED Gündüz Farları','Full LED Ön Farlar',' Carplay / Android Auto Destekli 7’’ Tablet Ekran',
      'Deri Direksiyon Simidi ve Vites Topuzu','Otomatik Klima',' Ön Sis Farları']
    },
    {
      'image': 'assets/images/fiat/fiat_easy.jpg',
      'name': 'Easy',
      'features': ['15’’ Kapaklı Saç Jantlar','5" Renkli TFT Ekranlı Radyo','3,5’’ TFT Gösterge Paneli','Parlak Siyah Ön Izgara'
      ,'Geri Görüş Kamerası','Karartılmış Arka Stop Farlar','Arka Park Sensörü','Yorgunluk Asistanı','Şerit Takip Asistanı'
      ,'Trafik İşareti Tanıma Sistemi','Akıllı Hız Destek Sistemi','Çarpışma Riski Uyarı Sistemi','Otomatik Acil Durum Freni'
      ,'Sürücü ve Yolcu Ön Hava Yastıkları','Yan Hava Yastıkları''Perde Hava Yastıkları']
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
                      child: Image.network(
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