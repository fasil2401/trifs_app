import 'package:flutter/material.dart';

class CategoryScrollList extends StatelessWidget {
  const CategoryScrollList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: places.length,
        itemBuilder: (context, index) {
          return TopDestination(
            placesList: places[index],
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 10,
          );
        },
      ),
    );
  }
}

class TopDestination extends StatelessWidget {
  final PlacesList placesList;
  TopDestination({
    Key? key,
    required this.placesList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        placesList.place,
        style: TextStyle(color: Colors.black),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          //border color
          side: BorderSide(color: Colors.grey, width: 0.4),
        ),
      ),
    );
  }
}

class PlacesList {
  final String place;

  PlacesList({required this.place});
}

List<PlacesList> places = <PlacesList>[
  PlacesList(place: 'All'),
  PlacesList(place: 'Mysuru'),
  PlacesList(place: 'Kovalam'),
  PlacesList(place: 'Munnar'),
  PlacesList(place: 'Idukki'),
  PlacesList(place: 'Ooty'),
  PlacesList(place: 'Kollam'),
];
