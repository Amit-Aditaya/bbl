import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/custom_widgets/app_button.dart';
import 'package:flutter_babuland_app/custom_widgets/branches_radio_button.dart';
import 'package:flutter_babuland_app/custom_widgets/gender_radio_buttons.dart';
import 'package:flutter_babuland_app/custom_widgets/profile_picture_container.dart';
import 'package:flutter_babuland_app/data/repository/customer_repository.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';

class EditProfilePage extends StatelessWidget {
  final int userId;
  final String userName;
  final String userEmail;
  final String userAddress;
  final String userSpouseName;
  final String userImage;
  final String userGender;
  final String prefferedBranch;

  EditProfilePage({
    Key? key,
    required this.userId,
    required this.userName,
    required this.userEmail,
    required this.userAddress,
    required this.userSpouseName,
    required this.userImage,
    required this.userGender,
    required this.prefferedBranch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameTextEditingController =
        TextEditingController(text: userName == 'null' ? '' : userName);
    TextEditingController emailTextEditingController =
        TextEditingController(text: userEmail == 'null' ? '' : userEmail);
    TextEditingController addressTextEditingController =
        TextEditingController(text: userAddress == 'null' ? '' : userAddress);
    TextEditingController spouseNameTextEditingController =
        TextEditingController(
            text: userSpouseName == 'null' ? '' : userSpouseName);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.primaryColor),
        title: Text(
          'Edit Information',
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
              ProfilePictureContainer(image: userImage),
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
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: userEmail == 'null' ? 'Enter Name' : '',
                          hintStyle: TextStyle(
                              color: AppColors.textGrey2.withOpacity(.6)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Email Address',
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
                        controller: emailTextEditingController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText:
                              userEmail == 'null' ? 'Enter Email Address' : '',
                          hintStyle: TextStyle(
                              color: AppColors.textGrey2.withOpacity(.6)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Address',
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
                        controller: addressTextEditingController,
                        decoration: InputDecoration(
                          hintText:
                              userAddress == 'null' ? 'Enter Address' : '',
                          hintStyle: TextStyle(
                              color: AppColors.textGrey2.withOpacity(.6)),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Spouse Name',
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
                        controller: spouseNameTextEditingController,
                        decoration: InputDecoration(
                          hintText: userSpouseName == 'null'
                              ? 'Enter Spouse Name'
                              : '',
                          hintStyle: TextStyle(
                              color: AppColors.textGrey2.withOpacity(.6)),
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
                      initialGender: userGender == 'Girl'
                          ? RadioValue.girl
                          : RadioValue.boy,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Preffered Branch',
                      style: TextStyle(color: AppColors.primaryColor),
                    ),
                    Text(
                      '(Branch you are most likely to visit)',
                      style:
                          TextStyle(color: AppColors.textGrey2, fontSize: 10),
                    ),
                    BranchesRadioButtons(
                      initialBranch: prefferedBranch == 'Mirpur'
                          ? BranchRadioValue.mirpur
                          : prefferedBranch == 'Badda'
                              ? BranchRadioValue.badda
                              : prefferedBranch == 'Wari'
                                  ? BranchRadioValue.wari
                                  : BranchRadioValue.uttara,
                    ),
                    const SizedBox(height: 13),
                    InkWell(
                      onTap: () async {
                        await CustomerRepository.updateCustomerInfo(
                            customerId: userId,
                            customerGender: GenderRadioButtons.currentValue ==
                                    RadioValue.girl
                                ? 'Girl'
                                : 'Boy',
                            customerName: nameTextEditingController.text,
                            customerSpouseName:
                                spouseNameTextEditingController.text,
                            emailAddress: emailTextEditingController.text,
                            address: addressTextEditingController.text,
                            prefferedBranch:
                                BranchesRadioButtons.currentValue ==
                                        BranchRadioValue.mirpur
                                    ? 'Mirpur'
                                    : BranchesRadioButtons.currentValue ==
                                            BranchRadioValue.badda
                                        ? 'Badda'
                                        : BranchesRadioButtons.currentValue ==
                                                BranchRadioValue.wari
                                            ? 'Wari'
                                            : 'Uttara');

                        ProfilePictureContainer.imageFile == null
                            ? null
                            : await CustomerRepository.postCustomerImage(
                                customerId: userId,
                                f: ProfilePictureContainer.imageFile!);

                        imageCache.clear();

                        Navigator.pop(context);

                        Navigator.pop(context);

                        (context as Element).markNeedsBuild();

                        Navigator.pushNamed(context, '/');

                        Navigator.pushNamed(context, 'profilePage');

                        ProfilePictureContainer.imageFile = null;
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
}
