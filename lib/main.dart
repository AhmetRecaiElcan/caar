import 'package:flutter/material.dart';
import 'package:caar/showroom.dart';
import 'package:caar/all_cars_grid.dart';
import 'package:caar/data.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MainNavigation(),
  ));
}

class MainNavigation extends StatefulWidget {
  @override
  _MainNavigationState createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;
  
  final List<Widget> _pages = [
    Showroom(isInitialScreen: true),
    AllCarsGrid(),
    Scaffold(body: Center(child: Text("Bildirimler"))),
    Scaffold(body: Center(child: Text("Profil"))),
  ];

  @override
  Widget build(BuildContext context) {
    List<NavigationItem> navigationItems = getNavigationItemList();
    
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 10,
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey[400],
            items: navigationItems.map((item) => BottomNavigationBarItem(
              icon: Icon(item.iconData),
              label: item.title,
            )).toList(),
          ),
        ),
      ),
    );
  }
}