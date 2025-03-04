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
      "assets/images/fiat.png",
    ),
    Dealer(
      "Toyota",
      126,
      "assets/images/toyota.jpg",
    ),
    Dealer(
      "Ford",
      89,
      "assets/images/ford.png",
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