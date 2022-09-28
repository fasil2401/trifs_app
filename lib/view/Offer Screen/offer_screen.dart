import 'package:flutter/material.dart';
import 'package:trifs_app/view/Components/app_bar.dart';
import 'package:trifs_app/view/Components/category_slider.dart';
import 'package:trifs_app/view/Components/custom_text.dart';
import 'package:trifs_app/view/Offer%20Screen/Components/featured_offers.dart';

class OfferScreen extends StatelessWidget {
  OfferScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    int columnCount = 2;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: TrifsAppBar(
          title: 'Offers',
          isLocation: false,
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              CategoryScrollList(),
              SizedBox(
                height: 10,
              ),
              CustomText.buildTitleText(
                title: 'Featured Offers',
              ),
              FeaturedOffers(w: _w, columnCount: columnCount),
              SizedBox(
                height: 5,
              ),
              CustomText.buildTitleText(
                title: 'Other Offers',
              ),
              OtherOffers(w: _w, columnCount: columnCount)
            ],
          ),
        ),
      ),
    );
  }
}
