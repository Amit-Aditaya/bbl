import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_babuland_app/custom_widgets/custom_app_bar.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TermsandCoditionsPage extends StatefulWidget {
  const TermsandCoditionsPage({Key? key}) : super(key: key);

  @override
  State<TermsandCoditionsPage> createState() => _TermsandCoditionsPageState();
}

class _TermsandCoditionsPageState extends State<TermsandCoditionsPage> {
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: Colors.white,
        title: 'Terms & Conditions',
      ),
      body: Stack(children: [
        WebView(
          onProgress: (int x) {
            isLoading = true;
          },
          onPageFinished: (url) {
            setState(() {
              isLoading = false;
            });
          },
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: Uri.encodeFull(
              'https://babuland.com/app_ios/terms/terms_&_conditions_ios.html'),
        ),
        isLoading == true
            ? Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.white,
                child: Center(
                    child: CupertinoActivityIndicator(
                  color: AppColors.primaryColor,
                )),
              )
            : const SizedBox(
                height: 1,
              )
      ]),
    );
  }
}
