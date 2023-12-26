import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_babuland_app/views/take_picture_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePictureContainer extends StatefulWidget {
  final String image;
  static File? imageFile;

  const ProfilePictureContainer({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  State<ProfilePictureContainer> createState() =>
      _ProfilePictureContainerState();
}

class _ProfilePictureContainerState extends State<ProfilePictureContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      color: Colors.transparent,
      margin: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            height: double.infinity,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(80),
              color: Colors.transparent,
            ),
            child: ProfilePictureContainer.imageFile == null
                ? Image.network(
                    widget.image,
                    fit: BoxFit.cover,
                    height: 120,
                    width: 120,
                    errorBuilder: ((context, error, stackTrace) {
                      return SvgPicture.asset(
                        'assets/images/user.svg',
                        height: 110,
                        width: 110,
                      );
                    }),
                  )
                : Image.file(
                    ProfilePictureContainer.imageFile!,
                    fit: BoxFit.cover,
                    height: 120,
                    width: 120,
                  ),
          ),
          const Spacer(),
          Container(
            height: double.infinity,
            color: Colors.transparent,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () async {
                      final cameras = await availableCameras();

                      final firstCamera = cameras.first;

                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  TakePictureScreen(camera: firstCamera)));

                      setState(() {});
                    },
                    child: Container(
                      height: 35,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border:
                            Border.all(color: AppColors.primaryColor, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'Upload Photo',
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 11,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      _chooseFromGallery();
                    },
                    child: FittedBox(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        height: 35,
                        width: 120,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: AppColors.primaryColor, width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: FittedBox(
                            child: Text(
                              'Choose From Gallery',
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 11,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  dynamic _chooseFromGallery() async {
    try {
      final image = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 10);
      if (image == null) return;
      final imagetemp = File(image.path);

      setState(() {
        ProfilePictureContainer.imageFile = imagetemp;
      });
    } on PlatformException catch (e) {
      throw Exception(e);
    }
  }
}
