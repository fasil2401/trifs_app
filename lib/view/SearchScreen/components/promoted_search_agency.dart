import 'package:flutter/material.dart';
import 'package:trifs_app/utils/constants/asset_path.dart';

List<int> listHouseboatId = [];

class PromotedAgencySearch extends StatelessWidget {
  PromotedAgencySearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.18,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          // itemCount: 1,
          separatorBuilder: (context, index) => SizedBox(
            width: 4,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Container(
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 40,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: Image.asset(
                              AppImages.placeHolderSquare,
                              fit: BoxFit.cover,
                            )),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Name',
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
