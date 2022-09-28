import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:trifs_app/utils/constants/asset_path.dart';

class FeaturedOffers extends StatelessWidget {
  const FeaturedOffers({
    Key? key,
    required double w,
    required this.columnCount,
  })  : _w = w,
        super(key: key);

  final double _w;
  final int columnCount;

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.all(_w / 60),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columnCount),
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return AnimationConfiguration.staggeredGrid(
            position: index,
            duration: Duration(milliseconds: 500),
            columnCount: columnCount,
            child: ScaleAnimation(
              duration: Duration(milliseconds: 900),
              curve: Curves.fastLinearToSlowEaseIn,
              child: FadeInAnimation(
                  child: Container(
                // height: 120,
                margin: EdgeInsets.only(
                    bottom: _w / 30, left: _w / 60, right: _w / 60),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(AppImages.placeHolderSquare),
                        fit: BoxFit.cover),
                    color: Color.fromARGB(255, 185, 182, 182),
                    borderRadius: BorderRadius.circular(10)),
                // child: Center(child: Text('$index')),
              )),
            ),
          );
        },
      ),
    );
  }
}

class OtherOffers extends StatelessWidget {
  const OtherOffers({
    Key? key,
    required double w,
    required this.columnCount,
  })  : _w = w,
        super(key: key);

  final double _w;
  final int columnCount;

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.all(_w / 60),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columnCount),
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return AnimationConfiguration.staggeredGrid(
            position: index,
            duration: Duration(milliseconds: 500),
            columnCount: columnCount,
            child: ScaleAnimation(
              duration: Duration(milliseconds: 900),
              curve: Curves.fastLinearToSlowEaseIn,
              child: FadeInAnimation(
                  child: Container(
                // height: 120,
                margin: EdgeInsets.only(
                    bottom: _w / 30, left: _w / 60, right: _w / 60),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(AppImages.placeHolderSquare),
                        fit: BoxFit.cover),
                    color: Color.fromARGB(255, 185, 182, 182),
                    borderRadius: BorderRadius.circular(10)),
                // child: Center(child: Text('$index')),
              )),
            ),
          );
        },
      ),
    );
  }
}

