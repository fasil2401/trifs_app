import 'package:flutter/material.dart';
import 'package:trifs_app/utils/constants/asset_path.dart';
import 'package:trifs_app/utils/constants/colors.dart';

class TravelPackage extends StatelessWidget {
  TravelPackage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      separatorBuilder: (context, index) => SizedBox(
        height: 10,
      ),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            // padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Container(
                  height: 130,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20)),
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20)),
                      child: Image.asset(
                        AppImages.placeHolderLandscape,
                        fit: BoxFit.cover,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: Text(
                                    'GWagon Benz',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black.withOpacity(0.5)),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_pin,
                                      size: 15,
                                      color: Color(0xFF00A6F6),
                                    ),
                                    Text(
                                      'Wayanad',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black.withOpacity(0.5)),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '₹1000',
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF00A6F6)),
                                  ),
                                  Text(
                                    '₹₹1500',
                                    maxLines: 1,
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                        // line text
                                        decoration: TextDecoration.lineThrough),
                                  ),
                                  Text(
                                    '20%Off',
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFF6B100),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          left: 0,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                              child: RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                  text: 'Provided by ',
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Color.fromARGB(255, 58, 58, 58)),
                                ),
                                TextSpan(
                                    text: 'Jiss Travels',
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(255, 65, 64, 64))),
                              ])),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
