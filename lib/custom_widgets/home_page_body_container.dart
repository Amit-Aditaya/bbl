import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/custom_widgets/banner_container.dart';
import 'package:flutter_babuland_app/custom_widgets/buttons_card.dart';
import 'package:flutter_babuland_app/custom_widgets/home_page_membership_info_tabview_container.dart';

class HomePageBodyContainer extends StatelessWidget {
  const HomePageBodyContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.white,
      margin: const EdgeInsets.all(5),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const HomePageMembershipInfoTabviewContainer(),
            const SizedBox(height: 1),
            BannerContainer(),
            const SizedBox(height: 15),
            const ButtonsCard(),
          ],
        ),
      ),
    );
  }
}
