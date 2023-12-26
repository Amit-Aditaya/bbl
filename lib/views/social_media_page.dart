import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/custom_widgets/custom_app_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaPage extends StatelessWidget {
  const SocialMediaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: Colors.white,
        title: 'Social Media',
      ),
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.transparent,
              height: 100,
              width: 100,
              child: Center(
                child: InkWell(
                  onTap: () async {
                    await launchUrl(Uri.parse(
                        "https://www.youtube.com/channel/UChzsJRXDRYsRcLNaM7Vt2Pg"));
                  },
                  child: CircleAvatar(
                    radius: 69.5,
                    backgroundColor: Colors.black,
                    child: Center(
                      child: CircleAvatar(
                        radius: 68,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: SvgPicture.asset(
                            'assets/images/youtube.svg',
                            height: 150,
                            width: 150,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text('Youtube'),
            const SizedBox(height: 40),
            Container(
              color: Colors.transparent,
              height: 100,
              width: 100,
              child: Center(
                child: InkWell(
                  onTap: () async {
                    await launchUrl(
                        Uri.parse("https://www.facebook.com/babulanders/"));
                  },
                  child: CircleAvatar(
                    radius: 69.5,
                    backgroundColor: Colors.black,
                    child: Center(
                      child: CircleAvatar(
                        radius: 68,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: SvgPicture.asset(
                            'assets/images/facebook.svg',
                            height: 150,
                            width: 150,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text('facebook'),
            const SizedBox(height: 40),
            Container(
              color: Colors.transparent,
              height: 100,
              width: 100,
              child: Center(
                child: InkWell(
                  onTap: () async {
                    await launchUrl(
                        Uri.parse("https://www.instagram.com/babulandbd/"));
                  },
                  child: CircleAvatar(
                    radius: 69.5,
                    backgroundColor: Colors.black,
                    child: Center(
                      child: CircleAvatar(
                        radius: 68,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: SvgPicture.asset(
                            'assets/images/instagram_1_.svg',
                            height: 150,
                            width: 150,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text('Instagram'),
          ],
        ),
      ),
    );
  }
}
