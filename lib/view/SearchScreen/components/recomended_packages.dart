import 'package:flutter/material.dart';
import 'package:trifs_app/utils/constants/asset_path.dart';
import 'package:trifs_app/utils/constants/colors.dart';

class RecommendedSearchPackages extends StatelessWidget {
  RecommendedSearchPackages({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 207,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        separatorBuilder: (context, index) => SizedBox(),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.only(left: 8),
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    Container(
                      height: 130,
                      width: 220,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            AppImages.placeHolderLandscape,
                            fit: BoxFit.cover,
                            width: 1000,
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 220,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: Text(
                                  'River Woods',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_pin,
                                    size: 12,
                                    color: Color(0xFF00A6F6),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: Text(
                                      'Wayanad',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: AppColors.green,
                                          overflow: TextOverflow.ellipsis,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '₹1000',
                                style: TextStyle(
                                    fontFamily: 'Lato',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryColor),
                              ),
                              Text(
                                '₹1500',
                                style: TextStyle(
                                    color: AppColors.grey,
                                    fontSize: 12,
                                    fontFamily: 'Lato',
                                    // line text
                                    decoration: TextDecoration.lineThrough),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '20%Off',
                                style: TextStyle(
                                    fontFamily: 'Lato',
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.yellow),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
