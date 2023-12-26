import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_babuland_app/custom_widgets/app_button.dart';
import 'package:flutter_babuland_app/custom_widgets/gender_radio_buttons.dart';
import 'package:flutter_babuland_app/custom_widgets/profile_picture_container.dart';
import 'package:flutter_babuland_app/data/repository/children_repo.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:image_picker/image_picker.dart';

class EditChildProfilePage extends StatelessWidget {
  File? image;

  final int childId;
  final String childName;
  final String childImage;
  final String childSchool;
  final String childClass;
  final String gender;
  final String dob;
  EditChildProfilePage(
      {Key? key,
      required this.childId,
      required this.childName,
      required this.childImage,
      required this.childSchool,
      required this.childClass,
      required this.gender,
      required this.dob})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameTextEditingController =
        TextEditingController(text: childName);

    final TextEditingController schoolTextEditingController =
        TextEditingController(text: childSchool);

    final TextEditingController classTextEditingController =
        TextEditingController(text: childClass);

    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        iconTheme: IconThemeData(color: AppColors.primaryColor),
        title: Text(
          'Edit Child Information',
          style: TextStyle(color: AppColors.primaryColor),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 6),
        color: Colors.transparent,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProfilePictureContainer(image: childImage),
              const SizedBox(height: 5),
              Container(
                margin: const EdgeInsets.all(1),
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                width: double.infinity,
                color: Colors.transparent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name',
                      style: TextStyle(color: AppColors.primaryColor),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black, width: 1.5),
                      ),
                      height: 50,
                      width: double.infinity,
                      child: TextFormField(
                        controller: nameTextEditingController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Date Of Birth',
                      style: TextStyle(color: AppColors.primaryColor),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 50,
                      width: double.infinity,
                      child: TextField(
                        enabled: false,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            //  hintText: '12 December 2012',
                            hintText: dob),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'School',
                      style: TextStyle(color: AppColors.primaryColor),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black, width: 1.5),
                      ),
                      height: 50,
                      width: double.infinity,
                      child: TextField(
                        controller: schoolTextEditingController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Class',
                      style: TextStyle(color: AppColors.primaryColor),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black, width: 1.5),
                      ),
                      height: 50,
                      width: double.infinity,
                      child: TextField(
                        controller: classTextEditingController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Gender',
                      style: TextStyle(color: AppColors.primaryColor),
                    ),
                    GenderRadioButtons(
                      initialGender:
                          gender == 'Girl' ? RadioValue.girl : RadioValue.boy,
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () async {
                        await ChildrenRepository.updateChildInfo(
                          childId: childId,
                          childName: nameTextEditingController.text,
                          gender:
                              GenderRadioButtons.currentValue == RadioValue.girl
                                  ? 'Girl'
                                  : 'Boy',
                          eduClass: classTextEditingController.text,
                          school: schoolTextEditingController.text,
                        );

                        ProfilePictureContainer.imageFile == null
                            ? null
                            : await ChildrenRepository.postChildImage(
                                childId: childId,
                                f: ProfilePictureContainer.imageFile!);

                        imageCache.clear();

                        Navigator.pop(context);

                        Navigator.pop(context);

                        (context as Element).markNeedsBuild();

                        Navigator.pushNamed(context, '/');

                        Navigator.pushNamed(context, 'profilePage');
                      },
                      child: Center(
                        child: AppButton(
                          height: 50,
                          width: 300,
                          text: 'Confirm Changes',
                        ),
                      ),
                    ),
                    const SizedBox(height: 13),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  dynamic _uploadFromCamera() async {
    try {
      final image = await ImagePicker().pickImage(
        source: ImageSource.camera,
      );
      if (image == null) return;
      final imagetemp = File(image.path);
      //this.image = imagetemp;
      File compressedFile = await FlutterNativeImage.compressImage(image.path,
          percentage: 1, quality: 1);

      this.image = compressedFile;
    } on PlatformException catch (e) {
      throw Exception(e);
    }
  }

  dynamic _chooseFromGallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imagetemp = File(image.path);
      this.image = imagetemp;
    } on PlatformException catch (e) {
      throw Exception(e);
    }
  }
}
