import 'package:flutter/material.dart';



class NavigationItem {
  IconData iconData;
  String title;

  NavigationItem(this.iconData, this.title);
}

List<NavigationItem> getNavigationItemList(){
  return <NavigationItem>[
    NavigationItem(Icons.home, "Ana Sayfa"),
    NavigationItem(Icons.directions_car, "Markalar"),
    NavigationItem(Icons.attach_money, "Fiyat Listesi"),
    NavigationItem(Icons.person, "Profil"),
  ];
}

class Car {
//https://drive.google.com/file/d/1IGiDqyrsjVBMQbatwcF5UeCgGxUQRH13/view?usp=drive_link
//https://drive.google.com/uc?id=1IGiDqyrsjVBMQbatwcF5UeCgGxUQRH13
  String brand;
  String model;
  String price;
  String condition;
  List<String> images;

  Car(this.brand, this.model, this.price, this.condition, this.images);

}

class Dealer {

  String name;
  int offers;
  String image;


  Dealer(this.name, this.offers, this.image);

}

List<Dealer> getDealerList(){
  return <Dealer>[
    Dealer(
      "Fiat",
      174,
      "https://drive.google.com/uc?id=1eB9KTa8n_jXGbaIHy609bUda_5ZTn43S",
    ),
    Dealer(
      "Toyota",
      126,
      "https://drive.google.com/uc?id=1_EkAjdbfOOYMLWZW2fiWktDDRrLYrhBb",
    ),
    Dealer(
      "Ford",
      89,
      "https://drive.google.com/uc?id=1kizs4vox1a2t43AHisVzf5NDBqoctpdM",
    ),
  ];
}

class Filter {

  String name;

  Filter(this.name);

}

List<Filter> getFilterList(){
  return <Filter>[
    Filter("Best Match"),
    Filter("Highest Price"),
    Filter("Lowest Price"),
  ];
}