import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_babuland_app/theme_helpers/shadows.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class OfferCard extends StatelessWidget {
  final int pk;
  final String comboTitle;
  final int comboMrp;
  final int costPrice;
  final double mrpExcludingVat;
  final double vatAmount;
  final double vatPercentage;
  final double discount;
  final String imageUrl;
  const OfferCard({
    Key? key,
    required this.pk,
    required this.comboTitle,
    required this.comboMrp,
    required this.costPrice,
    required this.mrpExcludingVat,
    required this.vatAmount,
    required this.vatPercentage,
    required this.discount,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      margin: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        boxShadow: [AppShadows.buttonShadow],
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),

        // child: CachedNetworkImage(
        //   fit: BoxFit.fill,
        //   imageUrl: imageUrl,
        //   placeholder: (context, url) => Center(
        //       child: SpinKitHourGlass(
        //     color: AppColors.primaryColor,
        //   )),
        //   errorWidget: (context, url, error) => const Icon(Icons.error),
        // ),

        ////
        // child: Image(
        //   fit: BoxFit.fill,
        //   image: NetworkImage(imageUrl),
        // ),
        ////

        child: Image.network(
          imageUrl,
          fit: BoxFit.fill,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
            );
          },
        ),
      ),
    );
  }
}
