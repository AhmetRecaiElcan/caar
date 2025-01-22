
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
      isVerified: false
    ),
    Brand(
      name: "Toyota",
      image: "assets/images/toyota.jpg",
      productCount: 95,
      isVerified: false
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
      isVerified: false
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
      isVerified: false
    ),
    Brand(
      name: "Dacia",
      image: "assets/images/dacia.jpg",
      productCount: 88,
      isVerified: false
    ),
    Brand(
      name: "Hyundai",
      image: "assets/images/hyundai.png",
      productCount: 88,
      isVerified: false
    ),
    Brand(
      name: "Kia",
      image: "assets/images/kia.png",
      productCount: 88,
      isVerified: false
    ),
    Brand(
      name: "Opel",
      image: "assets/images/opel.png",
      productCount: 88,
      isVerified: false
    ),
    Brand(
      name: "Togg",
      image: "assets/images/togg.png",
      productCount: 88,
      isVerified: false
    ),
    Brand(
      name: "Toyota",
      image: "assets/images/toyota.jpg",
      productCount: 88,
      isVerified: false
    ),
    Brand(
      name: "Volkswagen",
      image: "assets/images/volkswagen.png",
      productCount: 88,
      isVerified: false
    ),
    Brand(
      name: "Renault",
      image: "assets/images/renault.jpg",
      productCount: 88,
      isVerified: false
    ),
    Brand(
      name: "Mercedes",
      image: "assets/images/mercedes.png",
      productCount: 88,
      isVerified: false
    ),
    Brand(
      name: "Volvo",
      image: "assets/images/volvo.png",
      productCount: 88,
      isVerified: false
    ),
    Brand(
      name: "Nissan",
      image: "assets/images/nissan.jpg",
      productCount: 88,
      isVerified: false
    ),
    Brand(
      name: "Land Rover",
      image: "assets/images/landrover.png",
      productCount: 88,
      isVerified: false
    ),
    Brand(
      name: "Byd",
      image: "assets/images/byd.png",
      productCount: 6,
      isVerified: true
    ),
    Brand(
      name: "Honda",
      image: "assets/images/honda.png",
      productCount: 88,
      isVerified: false
    ),
    Brand(
      name: "Bmw",
      image: "assets/images/bmw.png",
      productCount: 88,
      isVerified: false
    ),
    Brand(
      name: "Alfa Romeo",
      image: "assets/images/alfaromeo.png",
      productCount: 88,
      isVerified: false
    ),
    Brand(
      name: "Cupra",
      image: "assets/images/cupra.png",
      productCount: 88,
      isVerified: false
    ),
    Brand(
      name: "Citroen",
      image: "assets/images/citroen.png",
      productCount: 88,
      isVerified: false
    ),
    Brand(
      name: "Dfsk",
      image: "assets/images/dfsk.png",
      productCount: 88,
      isVerified: false
    ),
    Brand(
      name: "Ds",
      image: "assets/images/ds.png",
      productCount: 88,
      isVerified: false
    ),
    Brand(
      name: "Jaecco",
      image: "assets/images/jaecco.png",
      productCount: 88,
      isVerified: false
    ),
    Brand(
      name: "Jeep",
      image: "assets/images/jeep.jpg",
      productCount: 88,
      isVerified: false
    ),
    Brand(
      name: "Lexus",
      image: "assets/images/lexus.png",
      productCount: 88,
      isVerified: false
    ),
    Brand(
      name: "Mg",
      image: "assets/images/mg.png",
      productCount: 88,
      isVerified: false
    ),
    Brand(
      name: "Mini",
      image: "assets/images/mini.png",
      productCount: 88,
      isVerified: false
    ),
    Brand(
      name: "Mitsubishi",
      image: "assets/images/mitsubishi.png",
      productCount: 88,
      isVerified: false
    ),
    Brand(
      name: "Peugeot",
      image: "assets/images/peugeot.png",
      productCount: 88,
      isVerified: false
    ),
    Brand(
      name: "Koltuk",
      image: "assets/images/Koltuk.png",
      productCount: 88,
      isVerified: false
    ),
    Brand(
      name: "Skoda",
      image: "assets/images/skoda.png",
      productCount: 88,
      isVerified: false
    ),
    Brand(
      name: "Ssangyong",
      image: "assets/images/ssangyong.png",
      productCount: 88,
      isVerified: false
    ),
    Brand(
      name: "Subaru",
      image: "assets/images/subaru.jpg",
      productCount: 88,
      isVerified: false
    ),
    Brand(
      name: "Suzuki",
      image: "assets/images/suzuki.png",
      productCount: 88,
      isVerified: false
    ),

    // Diğer markalar buraya eklenebilir...
  ];
} 