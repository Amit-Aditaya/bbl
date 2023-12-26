import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_babuland_app/custom_widgets/app_button.dart';
import 'package:flutter_babuland_app/custom_widgets/custom_app_bar.dart';
import 'package:flutter_babuland_app/data/repository/profile_delete_repository.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_babuland_app/views/new_login_page.dart';
import 'package:url_launcher/url_launcher.dart';

class DeleteProfilePage extends StatelessWidget {
  int phoneNumber;
  int customerId;

  DeleteProfilePage({required this.phoneNumber, required this.customerId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: Colors.white,
        title: 'Delete Profile',
      ),
      backgroundColor: Colors.white,
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 75),
            Center(
              child: Icon(
                Icons.warning,
                color: Colors.yellow.shade600,
                size: 50,
              ),
            ),
            const Center(
              child: Text(
                'Deleting your account is permanent',
                style: TextStyle(fontSize: 18, color: Colors.red),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 25),
              child: Center(
                child: Text(
                  'Your profile, children profile and images will be permanently deleted and all your active memberships will be cancelled. Click confirm to delete account',
                  style: TextStyle(color: AppColors.textGrey2),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            const SizedBox(height: 25),
            InkWell(
              onTap: () async {
                showDialog(
                    context: context,
                    builder: ((context) => AlertDialog(
                          title: Text(
                            'Are you sure you want to delete your account?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColors.primaryColor, fontSize: 16),
                          ),
                          content: Container(
                            color: Colors.transparent,
                            height: 125,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      await ProfileDelteRepository
                                          .deleteProfile(
                                              mobileNumber:
                                                  phoneNumber.toString(),
                                              customerId:
                                                  customerId.toString());
                                      final _auth = FirebaseAuth.instance;
                                      await _auth.signOut();
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: ((context) =>
                                                  NewLoginPage())));
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 120,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          border: Border.all(
                                              color: AppColors.primaryGreen,
                                              width: 3)),
                                      child: Center(
                                        child: Text(
                                          'Yes',
                                          style: TextStyle(
                                              color: AppColors.primaryGreen),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 25),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 120,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          border: Border.all(
                                              color: AppColors.primaryRed,
                                              width: 3)),
                                      child: Center(
                                        child: Text(
                                          'No',
                                          style: TextStyle(
                                              color: AppColors.primaryRed),
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                          ),
                        )));
              },
              child: Center(
                  child: AppButton(height: 50, width: 250, text: 'Confirm')),
            ),
          ]),
    );
  }
}
