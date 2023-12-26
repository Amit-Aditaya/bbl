import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/custom_widgets/app_button.dart';
import 'package:flutter_babuland_app/custom_widgets/custom_app_bar.dart';
import 'package:flutter_babuland_app/custom_widgets/date_of_birth_picker.dart';
import 'package:flutter_babuland_app/custom_widgets/gender_radio_buttons.dart';
import 'package:flutter_babuland_app/custom_widgets/profile_picture_container.dart';
import 'package:flutter_babuland_app/data/repository/children_repo.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';

class AddChildPage extends StatelessWidget {
  // AddChildPage({Key? key}) : super(key: key);
  final int guardianId;

  AddChildPage({
    Key? key,
    required this.guardianId,
  }) : super(key: key);

  TextEditingController nameTextEditigController = TextEditingController();
  TextEditingController classTextEditigController = TextEditingController();
  TextEditingController schoolTextEditigController = TextEditingController();

  static String? dateString;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: Colors.white,
        title: 'Add a Child',
      ),
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.white,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(height: 15),
            const ProfilePictureContainer(image: ''),
            const SizedBox(height: 35),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Child Name',
                    style: TextStyle(color: AppColors.primaryColor),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black, width: 1.5),
                    ),
                    height: 50,
                    width: double.infinity,
                    child: TextField(
                      controller: nameTextEditigController,
                      decoration: const InputDecoration(
                        hintText: 'Enter Child Name',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Date Of Birth',
                    style: TextStyle(color: AppColors.primaryColor),
                  ),
                  const SizedBox(height: 5),
                  const DateOfBirthPicker(),
                  const SizedBox(height: 15),
                  Text(
                    'Class',
                    style: TextStyle(color: AppColors.primaryColor),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black, width: 1.5),
                    ),
                    height: 50,
                    width: double.infinity,
                    child: TextField(
                      controller: classTextEditigController,
                      decoration: const InputDecoration(
                        hintText: 'Enter Class',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'School',
                    style: TextStyle(color: AppColors.primaryColor),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black, width: 1.5),
                    ),
                    height: 50,
                    width: double.infinity,
                    child: TextField(
                      controller: schoolTextEditigController,
                      decoration: const InputDecoration(
                        hintText: 'Enter School Name',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Gender',
                    style: TextStyle(color: AppColors.primaryColor),
                  ),
                  const GenderRadioButtons(
                    initialGender: RadioValue.boy,
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      if (dateString == null) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text(
                            'Please enter child\u0027s date of birth',
                            style: TextStyle(fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                          backgroundColor: Colors.red,
                        ));
                      } else if (nameTextEditigController.text == '') {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text(
                            'Please enter child\u0027s name',
                            style: TextStyle(fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                          backgroundColor: Colors.red,
                        ));
                      } else {
                        ChildrenRepository.addAChild(
                          guardianId: guardianId,
                          childName: nameTextEditigController.text,
                          gender:
                              GenderRadioButtons.currentValue == RadioValue.girl
                                  ? 'Girl'
                                  : 'Boy',
                          dob: dateString!,
                          eduClass: classTextEditigController.text == ''
                              ? ' '
                              : classTextEditigController.text,
                          school: schoolTextEditigController.text == ''
                              ? ' '
                              : schoolTextEditigController.text,
                          addedBy: 'IOS',
                        ).then((response) {
                          var responseData = jsonDecode(response.body);

                          if (responseData['response'] == 200) {
                            if (ProfilePictureContainer.imageFile == null) {
                              print('no image');
                            } else {
                              ChildrenRepository.postChildImage(
                                  childId: responseData['ch_id'],
                                  f: ProfilePictureContainer.imageFile!);
                            }
                          } else {}
                          Navigator.pop(context);

                          Navigator.pop(context);

                          (context as Element).markNeedsBuild();

                          Navigator.pushNamed(context, '/');

                          Navigator.pushNamed(context, 'profilePage');
                        });

                        //get child id
                        //post child image
                        //pop context

                      }
                    },
                    child: Center(
                      child:
                          AppButton(height: 50, width: 300, text: 'Add Child'),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
