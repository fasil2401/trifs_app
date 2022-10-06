import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trifs_app/utils/constants/asset_path.dart';
import 'package:trifs_app/utils/constants/colors.dart';
import 'package:trifs_app/view/Components/category_slider.dart';
import 'package:trifs_app/view/SearchScreen/components/promoted_search_agency.dart';
import 'package:trifs_app/view/SearchScreen/components/recomended_packages.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.close,
                    color: AppColors.grey,
                  ),
                ),
                Flexible(
                  child: TextFormField(
                    decoration: InputDecoration(
                        filled: true,
                        hintText: 'Search here...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: CircleAvatar(
                            backgroundColor: AppColors.primaryColor,
                            child: SvgPicture.asset(
                              AppIcons.search,
                              color: AppColors.white,
                              width: 22,
                              height: 22,
                            ),
                          ),
                        ),
                        fillColor: AppColors.lightGrey),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
            ListView.separated(
              itemCount: 0,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 45),
                  child: ListTile(
                    title: Text('Search Result $index'),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: AppColors.lightGrey,
                  height: 0,
                );
              },
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  CategoryScrollList(),
                  SizedBox(
                    height: 10,
                  ),
                  _buildHeading(
                    title: 'Recommended packages',
                    subtitle: 'enjoy your life with happiest moments',
                  ),
                  RecommendedSearchPackages(),
                  _buildHeading(
                    title: 'Popular Agencies',
                    subtitle: 'enjoy your life with happiest moments',
                  ),
                  PromotedAgencySearch()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  ListTile _buildHeading({
    required String title,
    required String subtitle,
  }) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          color: AppColors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          color: AppColors.grey,
          fontSize: 12,
        ),
      ),
      trailing: TextButton(
        onPressed: () {},
        child: Text(
          'View All',
          style: TextStyle(
            color: AppColors.black,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
