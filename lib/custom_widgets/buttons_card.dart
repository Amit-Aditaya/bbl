import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/custom_classes/local_notification.dart';

import 'package:flutter_babuland_app/custom_classes/rating_prompt_class.dart';
import 'package:flutter_babuland_app/router/app_routes.dart';
import 'package:flutter_babuland_app/theme_helpers/shadows.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonsCard extends StatefulWidget {
  const ButtonsCard({Key? key}) : super(key: key);

  @override
  State<ButtonsCard> createState() => _ButtonsCardState();
}

class _ButtonsCardState extends State<ButtonsCard> {
  @override
  Widget build(BuildContext context) {
    bool showLoading = false;

    return Container(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            child: Column(
              children: [
                Container(
                  height: 100,
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 90,
                        color: Colors.transparent,
                        child: Column(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                boxShadow: [AppShadows.buttonShadow],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, 'offersPage');
                                },
                                icon: SvgPicture.asset(
                                  'assets/images/gift icon tiny 101.svg',
                                  height: 45,
                                  width: 45,
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Text('Offers'),
                          ],
                        ),
                      ),
                      Container(
                        width: 90,
                        color: Colors.transparent,
                        child: Column(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                boxShadow: [AppShadows.buttonShadow],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, 'membershipPage');
                                },
                                icon: SvgPicture.asset(
                                  'assets/images/membership_icons.svg',
                                  height: 45,
                                  width: 45,
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Text('Membership'),
                          ],
                        ),
                      ),
                      Container(
                        width: 90,
                        color: Colors.transparent,
                        child: Column(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                boxShadow: [AppShadows.buttonShadow],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, 'ticketsPage');
                                },
                                icon: SvgPicture.asset(
                                  'assets/images/ticket.svg',
                                  height: 50,
                                  width: 50,
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Text('Tickets'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 100,
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 90,
                        color: Colors.transparent,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                boxShadow: [AppShadows.buttonShadow],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, 'bookNowPage');
                                },
                                icon: SvgPicture.asset(
                                  'assets/images/book now icon.svg',
                                  height: 45,
                                  width: 45,
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Text('Book Now'),
                          ],
                        ),
                      ),
                      Container(
                        width: 90,
                        color: Colors.transparent,
                        child: Column(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                boxShadow: [AppShadows.buttonShadow],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, 'eventsPage');
                                },
                                icon: SvgPicture.asset(
                                  'assets/images/calendar.svg',
                                  height: 45,
                                  width: 45,
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Text('Events'),
                          ],
                        ),
                      ),
                      Container(
                        width: 90,
                        color: Colors.transparent,
                        child: Column(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                boxShadow: [AppShadows.buttonShadow],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  RatingPrompt.ratingPromptShowDialogue(
                                      context);
                                },
                                icon: SvgPicture.asset(
                                  'assets/images/service_review.svg',
                                  height: 45,
                                  width: 45,
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Text('Reviews'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 100,
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 90,
                        color: Colors.transparent,
                        child: Column(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                boxShadow: [AppShadows.buttonShadow],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, 'foodPage');
                                },
                                icon: SvgPicture.asset(
                                  'assets/images/burger.svg',
                                  height: 45,
                                  width: 45,
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Text('Food'),
                          ],
                        ),
                      ),
                      Container(
                        width: 90,
                        color: Colors.transparent,
                        child: Column(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                boxShadow: [AppShadows.buttonShadow],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, 'socialMediaPage');
                                },
                                icon: SvgPicture.asset(
                                  'assets/images/social_media.svg',
                                  height: 45,
                                  width: 45,
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Text('Social Media'),
                          ],
                        ),
                      ),
                      Container(
                        width: 90,
                        color: Colors.transparent,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                boxShadow: [AppShadows.buttonShadow],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, 'classSchedulePage');
                                },
                                icon: SvgPicture.asset(
                                  'assets/images/class_schedule.svg',
                                  height: 45,
                                  width: 45,
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              'Classes',
                              overflow: TextOverflow.visible,
                              softWrap: false,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Container(
                //   height: 100,
                //   color: Colors.transparent,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //     children: [
                //       Container(
                //         width: 90,
                //         color: Colors.transparent,
                //         child: Column(
                //           children: [
                //             Container(
                //               height: 65,
                //               width: 65,
                //               decoration: BoxDecoration(
                //                 boxShadow: [AppShadows.buttonShadow2],
                //                 color: Colors.white,
                //                 borderRadius: BorderRadius.circular(20),
                //               ),
                //               child: IconButton(
                //                 onPressed: () {
                //                   Navigator.pushNamed(
                //                       context, AppRoutes.parentingPage);
                //                 },
                //                 icon: SvgPicture.asset(
                //                   'assets/images/happy_family.svg',
                //                   height: 45,
                //                   width: 45,
                //                   fit: BoxFit.scaleDown,
                //                 ),
                //               ),
                //             ),
                //             const SizedBox(height: 5),
                //             const Text('Parenting'),
                //           ],
                //         ),
                //       ),
                //       Container(
                //         width: 90,
                //         color: Colors.transparent,
                //         child: Column(
                //           children: [
                //             Container(
                //               height: 65,
                //               width: 65,
                //               decoration: BoxDecoration(
                //                 boxShadow: [AppShadows.buttonShadow],
                //                 color: Colors.white,
                //                 borderRadius: BorderRadius.circular(20),
                //               ),
                //               child: IconButton(
                //                 onPressed: () {
                //                   Navigator.pushNamed(context, 'showsPage');
                //                 },
                //                 icon: SvgPicture.asset(
                //                   'assets/images/drama_show.svg',
                //                   height: 50,
                //                   width: 50,
                //                   fit: BoxFit.scaleDown,
                //                 ),
                //               ),
                //             ),
                //             const SizedBox(height: 5),
                //             const Text('Shows'),
                //           ],
                //         ),
                //       ),
                //       Container(
                //         width: 90,
                //         color: Colors.transparent,
                //         child: Column(
                //           children: [
                //             Container(
                //               height: 65,
                //               width: 65,
                //               decoration: BoxDecoration(
                //                 boxShadow: [AppShadows.buttonShadow],
                //                 color: Colors.white,
                //                 borderRadius: BorderRadius.circular(20),
                //               ),
                //               child: IconButton(
                //                 onPressed: () {},
                //                 icon: SvgPicture.asset(
                //                   'assets/images/play_date.svg',
                //                   height: 45,
                //                   width: 45,
                //                   fit: BoxFit.scaleDown,
                //                 ),
                //               ),
                //             ),
                //             const SizedBox(height: 5),
                //             const Text('Play Date'),
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
