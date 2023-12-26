import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/custom_classes/hive_box_utils.dart';
import 'package:flutter_babuland_app/custom_widgets/app_button.dart';
import 'package:flutter_babuland_app/data/model/current_user.dart';
import 'package:flutter_babuland_app/data/model/customer_model.dart';
import 'package:flutter_babuland_app/data/repository/children_repo.dart';
import 'package:flutter_babuland_app/data/repository/customer_repository.dart';
import 'package:flutter_babuland_app/data/repository/free_ticket_repository.dart';
import 'package:flutter_babuland_app/data/repository/membership_subscription_repository.dart';
import 'package:flutter_babuland_app/data/repository/reward_points_repository/reward_points_sum_repository.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_babuland_app/views/home_page.dart';
import 'package:flutter_babuland_app/views/terms_and_conditions_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class NewLoginPage extends StatefulWidget {
  NewLoginPage({Key? key}) : super(key: key);

  @override
  State<NewLoginPage> createState() => _NewLoginPageState();
}

enum MobileVerificationState { loginState, otpState }

class _NewLoginPageState extends State<NewLoginPage> {
  MobileVerificationState currentState = MobileVerificationState.loginState;
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController otpTextEditingController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? verificationId;
  bool showLoading = false;
  String countryCode = '+880';
  bool hasError = false;
  bool resendButtonEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: showLoading == true
          ? Center(
              child: CupertinoActivityIndicator(
                color: AppColors.primaryColor,
              ),
            )
          : currentState == MobileVerificationState.loginState
              ? getLoginPage(context)
              : getOTPPage(context),
    );
  }

  getLoginPage(context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.only(bottom: 15),
        color: Colors.transparent,
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.transparent,
                margin: const EdgeInsets.only(top: 100),
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 75),
              SvgPicture.asset(
                'assets/images/logo_svg.svg',
                height: 100,
                width: 100,
              ),
              const SizedBox(height: 15),
              showLoading == true
                  ? Center(
                      child: CupertinoActivityIndicator(
                        color: AppColors.primaryColor,
                      ),
                    )
                  : const Text(''),
              const SizedBox(height: 40),
              Container(
                height: 50,
                width: 350,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 0.0,
                ),
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 2.5,
                  ),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: IntrinsicWidth(
                    child: TextField(
                      onTap: () {
                        phoneTextEditingController.clear();
                      },
                      controller: phoneTextEditingController,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: const InputDecoration(
                        hintText: '017XXXXXXXX',
                        border: InputBorder.none,
                        icon: Icon(Icons.phone),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () async {
                  if (phoneTextEditingController.text == '') {
                    const snackBar = SnackBar(
                      duration: Duration(milliseconds: 1300),
                      backgroundColor: Colors.red,
                      content: Text(
                        'Please enter your 11 digit phone number',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else if (phoneTextEditingController.text.length != 11) {
                    const snackBar = SnackBar(
                      duration: Duration(milliseconds: 1300),
                      backgroundColor: Colors.red,
                      content: Text(
                        'Please enter the 11 digitls of your phone number',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else {
                    setState(() {
                      showLoading = true;
                    });

                    String _verificationId = "";
                    int? _resendToken;

                    await _auth.verifyPhoneNumber(
                      phoneNumber:
                          '$countryCode ${phoneTextEditingController.text.substring(1, 5)}-${phoneTextEditingController.text.substring(5, 11)}',
                      verificationCompleted:
                          (PhoneAuthCredential phoneAuthCredential) async {
                        setState(() {
                          showLoading = false;
                        });
                      },
                      verificationFailed: (FirebaseAuthException e) async {
                        setState(() {
                          showLoading = false;
                        });

                        if (e.code == 'invalid-phone-number') {
                          throw Exception(e);
                        }

                        print(e);
                      },
                      codeSent: (verificationID, resendToken) async {
                        _resendToken = resendToken;
                        _verificationId = verificationID;
                        setState(() {
                          showLoading = false;
                          currentState = MobileVerificationState.otpState;
                          verificationId = verificationID;
                        });
                      },
                      codeAutoRetrievalTimeout: (verificationID) async {
                        verificationId = _verificationId;
                      },
                      timeout: const Duration(seconds: 30),
                      forceResendingToken: _resendToken,
                    );
                  }
                },
                child: AppButton(
                  height: 50,
                  width: 350,
                  text: 'Continue',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TermsandCoditionsPage()));
                },
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text:
                        'By pressing continue, you are agreeing to Babuland App\'s \n',
                    style: TextStyle(color: AppColors.textGrey2, fontSize: 13),
                    children: [
                      TextSpan(
                        text: 'EULA & Privacy Policy',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  getOTPPage(context) {
    DatabaseReference db =
        FirebaseDatabase.instance.ref().child('ios_installation_offer_check');
    Future.delayed(const Duration(seconds: 30), () {
      if (mounted == true) {
        setState(() {
          resendButtonEnabled = true;
        });
      }
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.transparent,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 75),
                CircleAvatar(
                  radius: 75,
                  backgroundColor: Colors.transparent,
                  child: SvgPicture.asset(
                    'assets/images/logo_svg.svg',
                    height: 125,
                    width: 125,
                    //fit: BoxFit.scaleDown,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  'Please enter the 6 digit OTP code that will be sent to your device shortly',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.primaryColor),
                ),
                const SizedBox(height: 25),
                Container(
                  height: 100,
                  color: Colors.transparent,
                  child: PinCodeTextField(
                    autofocus: true,
                    controller: otpTextEditingController,
                    hideCharacter: false,
                    highlight: true,
                    highlightColor: Colors.orange,
                    defaultBorderColor: Colors.black,
                    hasTextBorderColor: Colors.green,
                    highlightPinBoxColor: Colors.white,
                    maxLength: 6,
                    hasError: hasError,
                    onTextChanged: (text) {
                      setState(() {
                        hasError = false;
                      });
                    },
                    onDone: (pin) async {
                      showLoading = true;

                      CustomerModel getCustomerInfo =
                          await CustomerRepository.getCustomerByMobileNumber(
                              mobileNumber: phoneTextEditingController.text);

                      if (getCustomerInfo.items.isEmpty) {
                        await CustomerRepository.postCustomerInfo(
                            mobileNumber: phoneTextEditingController.text);

                        showLoading = true;
                        Future.delayed(const Duration(milliseconds: 1000), () {
                          try {
                            final phoneAuthCred = PhoneAuthProvider.credential(
                              verificationId: verificationId!,
                              smsCode: otpTextEditingController.text,
                            );
                            signInWithPhoneAuthCredential(phoneAuthCred)
                                .then((value) {
                              DateTime? offerStartDate;
                              db.once().then((val) async {
                                String offerStartDateString =
                                    (val.snapshot as dynamic)
                                        .children
                                        .elementAt(2)
                                        .value;

                                String offerExpDateUnix =
                                    (val.snapshot as dynamic)
                                        .children
                                        .elementAt(1)
                                        .value;

                                String isOfferActive = (val.snapshot as dynamic)
                                    .children
                                    .elementAt(0)
                                    .value;

                                DateTime dateFormat = DateFormat('dd-MMM-yy')
                                    .parse(offerStartDateString);

                                if (Platform.isIOS && isOfferActive == 'true' ||
                                    isOfferActive == 'TRUE' &&
                                        dateFormat.isAfter(DateTime.now())) {
                                  print('aaaa');
                                  // post free tickets
                                  await FreeTicketRepository
                                          .postTicketRepository(
                                              phoneNumber:
                                                  phoneTextEditingController
                                                      .text,
                                              expDateUnix: offerExpDateUnix,
                                              productName:
                                                  'Welcome Ticket: CHILD ENTRY')
                                      .then((value) async {
                                    await FreeTicketRepository
                                        .postTicketRepository(
                                            phoneNumber:
                                                phoneTextEditingController.text,
                                            expDateUnix: offerExpDateUnix,
                                            productName:
                                                'Welcome Ticket: MASSAGE CHAIR');
                                  });
                                  //show pop up of free ticket
                                }
                              });
                            });
                          } catch (e) {
                            throw Exception(e);
                          }
                        });
                      } else {
                        try {
                          final phoneAuthCred = PhoneAuthProvider.credential(
                            verificationId: verificationId!,
                            smsCode: otpTextEditingController.text,
                          );
                          signInWithPhoneAuthCredential(phoneAuthCred);
                        } catch (e) {
                          throw Exception(e);
                        }
                      }
                    },
                    pinBoxWidth: 50,
                    pinBoxHeight: 64,
                    hasUnderline: true,
                    wrapAlignment: WrapAlignment.spaceAround,
                    pinBoxDecoration:
                        ProvidedPinBoxDecoration.defaultPinBoxDecoration,
                    pinTextStyle: const TextStyle(fontSize: 22.0),
                    pinTextAnimatedSwitcherTransition:
                        ProvidedPinBoxTextAnimation.scalingTransition,
                    pinTextAnimatedSwitcherDuration:
                        const Duration(milliseconds: 300),
                    highlightAnimationBeginColor: Colors.black,
                    highlightAnimationEndColor: Colors.white12,
                    keyboardType: TextInputType.number,
                  ),
                ),
                resendButtonEnabled == false
                    ? Text(
                        'OTP Resend available after 30 seconds',
                        style: TextStyle(color: AppColors.textGrey2),
                      )
                    : const SizedBox(),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: resendButtonEnabled == false
                        ? MaterialStateProperty.all(Colors.grey)
                        : MaterialStateProperty.all(AppColors.primaryColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 30),
                    ),
                  ),
                  onPressed: () async {
                    resendButtonEnabled == false
                        ? null
                        : setState(() {
                            showLoading = true;
                          });

                    String _verificationId = "";
                    int? _resendToken;
                    await _auth.verifyPhoneNumber(
                      phoneNumber:
                          '$countryCode ${phoneTextEditingController.text.substring(1, 5)}-${phoneTextEditingController.text.substring(5, 11)}',
                      verificationCompleted:
                          (PhoneAuthCredential phoneAuthCredential) async {
                        setState(() {
                          showLoading = false;
                        });
                      },
                      verificationFailed: (FirebaseAuthException e) async {
                        setState(() {
                          showLoading = false;
                        });
                        if (e.code == 'invalid-phone-number') {
                          throw Exception(e);
                        }
                      },
                      codeSent: (verificationID, resendToken) async {
                        _resendToken = resendToken;
                        _verificationId = verificationID;
                        setState(() {
                          showLoading = false;
                          currentState = MobileVerificationState.otpState;
                          verificationId = verificationID;
                        });
                      },
                      codeAutoRetrievalTimeout: (verificationID) async {
                        verificationId = _verificationId;
                      },
                      timeout: const Duration(seconds: 30),
                      forceResendingToken: _resendToken,
                    );
                    setState(() {
                      showLoading = false;
                      resendButtonEnabled = false;
                    });
                  },
                  child: const Text(
                    'Resend OTP',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCred) async {
    setState(() {
      showLoading = true;
    });

    try {
      final authCredential = await _auth.signInWithCredential(phoneAuthCred);
      setState(() {
        showLoading = false;
      });

      if (authCredential.user != null) {
        HiveBoxUtils.box.put('user_current',
            CurrentUser(phoneNumber: authCredential.user!.phoneNumber));

        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => MultiRepositoryProvider(
                      providers: [
                        RepositoryProvider(
                          create: (context) => ChildrenRepository(),
                        ),
                        RepositoryProvider(
                          create: (context) =>
                              MembershipSubscriptionRepository(),
                        ),
                        RepositoryProvider(
                          create: (context) => RewardPointsSumRepository(),
                        ),
                      ],
                      child: HomePage(
                        currentUser: authCredential.user,
                      ),
                    )));
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        showLoading = false;
      });

      otpTextEditingController.clear();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text(
          'Wrong OTP',
          textAlign: TextAlign.center,
        ),
        backgroundColor: AppColors.primaryRed,
      ));
    }
  }
}
