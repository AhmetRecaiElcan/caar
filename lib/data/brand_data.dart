import 'package:flutter/material.dart';

class Brand {
  String name;
  String image;
  int productCount;
  bool isVerified;

  Brand({
    required this.name, 
    required this.image, 
    required this.productCount, 
    this.isVerified = false
  });
}

List<Brand> getBrandList() {
  return <Brand>[
    Brand(
      name: "Ford",
      image: "assets/images/ford.png",
      productCount: 265,
      isVerified: true
    ),
    Brand(
      name: "Toyota",
      image: "assets/images/toyota.jpg",
      productCount: 95,
      isVerified: true
    ),
    Brand(
      name: "Fiat",
      image: "assets/images/fiat.png",
      productCount: 85
    ),
    Brand(
      name: "Tesla",
      image: "assets/images/tesla.jpg",
      productCount: 36,
      isVerified: true
    ),
    Brand(
      name: "Chery",
      image: "assets/images/chery.png",
      productCount: 65
    ),
    Brand(
      name: "Audi",
      image: "assets/images/audi.png",
      productCount: 88,
      isVerified: true
    ),
    Brand(
      name: "Dacia",
      image: "assets/images/dacia.jpg",
      productCount: 88,
      isVerified: true
    ),
    Brand(
      name: "Hyundai",
      image: "assets/images/hyundai.png",
      productCount: 88,
      isVerified: true
    ),
    Brand(
      name: "Kia",
      image: "assets/images/kia.png",
      productCount: 88,
      isVerified: true
    ),
    Brand(
      name: "Opel",
      image: "assets/images/opel.png",
      productCount: 88,
      isVerified: true
    ),
    Brand(
      name: "Togg",
      image: "assets/images/togg.png",
      productCount: 88,
      isVerified: true
    ),
    Brand(
      name: "Toyota",
      image: "assets/images/toyota.jpg",
      productCount: 88,
      isVerified: true
    ),
    Brand(
      name: "Volkswagen",
      image: "assets/images/volkswagen.png",
      productCount: 88,
      isVerified: true
    ),
    Brand(
      name: "Renault",
      image: "assets/images/renault.jpg",
      productCount: 88,
      isVerified: true
    ),
    Brand(
      name: "Mercedes",
      image: "assets/images/mercedes.png",
      productCount: 88,
      isVerified: true
    ),
    Brand(
      name: "Volvo",
      image: "assets/images/volvo.png",
      productCount: 88,
      isVerified: true
    ),
    Brand(
      name: "Nissan",
      image: "assets/images/nissan.jpg",
      productCount: 88,
      isVerified: true
    ),
    Brand(
      name: "Land Rover",
      image: "assets/images/landrover.png",
      productCount: 88,
      isVerified: true
    ),
    Brand(
      name: "Audi",
      image: "assets/images/audi.png",
      productCount: 88,
      isVerified: true
    ),
    Brand(
      name: "Audi",
      image: "assets/images/audi.png",
      productCount: 88,
      isVerified: true
    ),
    Brand(
      name: "Audi",
      image: "assets/images/audi.png",
      productCount: 88,
      isVerified: true
    ),
    Brand(
      name: "Audi",
      image: "assets/images/audi.png",
      productCount: 88,
      isVerified: true
    ),
    Brand(
      name: "Audi",
      image: "assets/images/audi.png",
      productCount: 88,
      isVerified: true
    ),
    Brand(
      name: "Audi",
      image: "assets/images/audi.png",
      productCount: 88,
      isVerified: true
    ),
    Brand(
      name: "Audi",
      image: "assets/images/audi.png",
      productCount: 88,
      isVerified: true
    ),
    Brand(
      name: "Audi",
      image: "assets/images/audi.png",
      productCount: 88,
      isVerified: true
    ),
    Brand(
      name: "Audi",
      image: "assets/images/audi.png",
      productCount: 88,
      isVerified: true
    ),
    Brand(
      name: "Audi",
      image: "assets/images/audi.png",
      productCount: 88,
      isVerified: true
    ),
    Brand(
      name: "Audi",
      image: "assets/images/audi.png",
      productCount: 88,
      isVerified: true
    ),
    Brand(
      name: "Audi",
      image: "assets/images/audi.png",
      productCount: 88,
      isVerified: true
    ),
    Brand(
      name: "Audi",
      image: "assets/images/audi.png",
      productCount: 88,
      isVerified: true
    ),
    Brand(
      name: "Audi",
      image: "assets/images/audi.png",
      productCount: 88,
      isVerified: true
    ),
    Brand(
      name: "Audi",
      image: "assets/images/audi.png",
      productCount: 88,
      isVerified: true
    ),
    

    // Diğer markalar buraya eklenebilir...
  ];
} 