import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trifs_app/utils/constants/asset_path.dart';
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
    ExploreScreen(),
    const FavoriteScreen(),
    OfferScreen(),
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
                icon: SvgPicture.asset(AppIcons.homeUnselected),
                activeIcon: SvgPicture.asset(AppIcons.homeSelected),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(AppIcons.exploreUnselected),
                activeIcon: SvgPicture.asset(AppIcons.exploreSelected),
                label: 'Explore'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(AppIcons.favoritesUnselected),
                activeIcon: SvgPicture.asset(AppIcons.favoritesSelected),
                label: 'Favorite'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(AppIcons.offersUnselected),
                activeIcon: SvgPicture.asset(AppIcons.offersSelected),
                label: 'Offers'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(AppIcons.profileUnselected),
                activeIcon: SvgPicture.asset(AppIcons.profileSelected),
                label: 'Account'),
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
