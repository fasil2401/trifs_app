import 'package:flutter/material.dart';
import 'package:trifs_app/utils/constants/colors.dart';

class VehicleCategoryList extends StatelessWidget {
  const VehicleCategoryList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: places.length,
        itemBuilder: (context, index) {
          return Category(
            categoryList: places[index],
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

class Category extends StatelessWidget {
  final CategoryList categoryList;
  Category({
    Key? key,
    required this.categoryList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
      padding: EdgeInsets.all(15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          categoryList.icon == null
              ? Container()
              : Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Icon(
                    categoryList.icon,
                    color: AppColors.grey,
                  ),
                ),
          Text(
            categoryList.category,
            style: TextStyle(
              color: AppColors.black,
            ),
          ),
        ],
      ),
    ));
  }
}

class CategoryList {
  final String category;
  final IconData? icon;

  CategoryList({required this.category, this.icon});
}

List<CategoryList> places = <CategoryList>[
  CategoryList(category: 'All'),
  CategoryList(category: 'Car', icon: Icons.car_rental_outlined),
  CategoryList(category: 'Bus', icon: Icons.bus_alert_outlined),
  CategoryList(category: 'Traveller', icon: Icons.fire_truck_outlined),
];
