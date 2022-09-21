import 'package:flutter/material.dart';
import 'package:trifs_app/view/Explore%20Screen/explore_screen.dart';
import 'package:trifs_app/view/Favorites%20Screen/favorite_screen.dart';
import 'package:trifs_app/view/Home%20Screen/home_screen.dart';
import 'package:trifs_app/view/Offer%20Screen/offer_screen.dart';
import 'package:trifs_app/view/Profile%20Screen/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedPage = 0;

  final _pageOptions = [
     HomeScreen(),
    const ExploreScreen(),
    const FavoriteScreen(),
    const OfferScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: _pageOptions[selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.explore_outlined), label: 'Explore'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border_outlined), label: 'Favorite'),
            BottomNavigationBarItem(
                icon: Icon(Icons.local_offer_outlined), label: 'Offers'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline, size: 24), label: 'Account'),
          ],
          selectedItemColor: Color.fromARGB(255, 5, 114, 168),
          elevation: 5.0,
          unselectedItemColor: Color(0xFF00A6F6),
          currentIndex: selectedPage,
          backgroundColor: Colors.white,
          onTap: (index) {
            setState(() {
              selectedPage = index;
            });
          },
        ));
  }
}
