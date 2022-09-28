import 'package:flutter/material.dart';
import 'package:trifs_app/view/Components/app_bar.dart';
import 'package:trifs_app/view/Favorites%20Screen/Components/favorite_packages.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: TrifsAppBar(
          title: 'Favourites',
          isLocation: false,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Expanded(child: FavoritePackageCardList()),
          ],
        ),
      ),
    );
  }
}
