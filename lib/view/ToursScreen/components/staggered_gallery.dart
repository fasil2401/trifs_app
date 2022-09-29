import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:trifs_app/utils/constants/common_list.dart';

class StaggeredGallery extends StatelessWidget {
  const StaggeredGallery({
    Key? key,
  }) : super(key: key);

  static const tiles = [
    GridTile(2, 2),
    GridTile(2, 3),
    GridTile(2, 2),
    GridTile(2, 1),
    // GridTile(2, 2),
    // GridTile(1, 2),
    // GridTile(2, 1),
    // GridTile(3, 1),
    // GridTile(1, 1),
    // GridTile(4, 1),
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>TourInnerScreen()));
      },
      child: StaggeredGrid.count(
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: [
          ...tiles.mapIndexed((index, tile) {
            return StaggeredGridTile.count(
              crossAxisCellCount: tile.crossAxisCount,
              mainAxisCellCount: tile.mainAxisCount,
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Container(
                  child: Center(
                    child: Text(
                      index == 3 ? 'More' : '',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Lato',
                          fontSize: 20),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.black,
                        width: 0.3,
                      ),
                      image: index == 3
                          ? DecorationImage(
                              colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.4),
                                  BlendMode.darken),
                              image: AssetImage(
                                DistrictList.districtImages[index],
                              ),
                              fit: BoxFit.cover,
                            )
                          : DecorationImage(
                              // colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
                              image: AssetImage(
                                DistrictList.districtImages[index],
                              ),
                              fit: BoxFit.cover,
                            )),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

class GridTile {
  const GridTile(this.crossAxisCount, this.mainAxisCount);
  final int crossAxisCount;
  final int mainAxisCount;
}
