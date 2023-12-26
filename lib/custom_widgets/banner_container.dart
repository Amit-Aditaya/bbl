import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_babuland_app/theme_helpers/shadows.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class BannerContainer extends StatefulWidget {
  const BannerContainer({Key? key}) : super(key: key);

  @override
  State<BannerContainer> createState() => _BannerContainerState();
}

class _BannerContainerState extends State<BannerContainer> {
  DatabaseReference db = FirebaseDatabase.instance.ref().child('banner');

  late int bannerListLength;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getBanners(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return SpinKitCircle(
              color: AppColors.primaryColor,
            );
          } else {
            return Center(
              child: Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width * .95,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [AppShadows.buttonShadow],
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: CarouselSlider.builder(
                    itemCount: bannerListLength,
                    itemBuilder: (context, index, i) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image(
                          fit: BoxFit.fill,
                          image:
                              NetworkImage((snapshot.data as dynamic)[index]),
                        ),
                      );
                    },
                    options: CarouselOptions(
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      viewportFraction: 1,
                      disableCenter: true,
                    ),
                  )),
            );
          }
        });
  }

  getBanners() async {
    List list = [];

    await db.once().then((val) {
      val.snapshot.children.forEach((element) {
        if (element.child('activation').value == 'Y') {
          list.add(element.child('imgUrl').value);
        }
        bannerListLength = list.length;
      });
    });

    return list;
  }
}
