import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/custom_widgets/custom_app_bar.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';

class MomVaccineListPage extends StatelessWidget {
  const MomVaccineListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: AppColors.primaryColor,
        title: 'Vaccines For Mom ',
      ),
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: ListView.separated(
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, 'finalMomVaccineInfoPage');
              },
              child: Material(
                elevation: 3,
                shadowColor: Colors.black,
                child: ListTile(
                  contentPadding: const EdgeInsets.all(10),
                  textColor: AppColors.primaryColor,
                  tileColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  title: Text(
                    'Vaccine name $index',
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 15,
            );
          },
          itemCount: 6,
        ),
      ),
    );
  }
}
