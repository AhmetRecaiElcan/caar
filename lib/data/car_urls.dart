import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'car_data.dart';
class CarUrls {
  static final Map<String, Map<String, String>> modelUrls = {
    'Honda': {
      'Genel Fiyat Listesi': 'https://www.honda.com.tr/otomobil/otomobil-fiyat-listesi-2024',
      'Civic': 'https://honda.com.tr/civic',
      'City': 'https://honda.com.tr/city',
      'CR-V': 'https://honda.com.tr/cr-v',
    },
    'Byd' : {
      'Genel Fiyat Listesi':'https://www.bydauto.com.tr/fiyat-listesi',
      'Atto 3' : 'https://www.bydauto.com.tr/fiyat-listesi',
      'Seal U Ev' : 'https://www.bydauto.com.tr/fiyat-listesi' ,
      'Byd Seal U DM-İ' : 'https://www.bydauto.com.tr/fiyat-listesi',
      'Byd Seal U AWD' : 'https://www.bydauto.com.tr/fiyat-listesi',
      'Byd Seal Han' : 'https://www.bydauto.com.tr/fiyat-listesi',
    },
    
    // PDF formatındaki fiyat listeleri
    'Fiat': {
      'Genel Fiyat Listesi': 'https://kampanya.fiat.com.tr/Pdf/Fiyatlar/OtomobilFiyatListesi.pdf',
    },
    'Dacia': {
      'Genel Fiyat Listesi': 'https://cdn.cetas.com.tr/Delivery/Public/File/dacia-Fiyat-Listesi_yeni_5ll3w6psd5.pdf',
    },
  };

  static String? getModelUrl(String brand, String model) {
    return modelUrls[brand]?[model];
  }

  static String? getBrandMainUrl(String brand) {
    return modelUrls[brand]?['Genel Fiyat Listesi'];
  }

  static List<String> getBrandModels(String brand) {
    final models = modelUrls[brand]?.keys.where((key) => key != 'Genel Fiyat Listesi').toList();
    return models ?? [];
  }
}
