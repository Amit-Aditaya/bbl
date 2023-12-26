import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class PastEventCard extends StatefulWidget {
  //const PastEventCard({Key? key}) : super(key: key);
  int eventId;
  String eventName;
  String imageName;
  String eventDate;
  String eventDetails;
  PastEventCard({
    Key? key,
    required this.eventId,
    required this.eventName,
    required this.imageName,
    required this.eventDate,
    required this.eventDetails,
  }) : super(key: key);

  @override
  State<PastEventCard> createState() => _PastEventCardState();
}

class _PastEventCardState extends State<PastEventCard> {
  double _animatedHeight = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.transparent,
      child: Column(
        children: [
          Container(
            height: 170,
            width: double.infinity,
            color: Colors.transparent,
            child: CachedNetworkImage(
              imageUrl:
                  'http://apps.babuland.org/bblapi/apiv2/apiv1/appevant/${widget.eventId}',
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              placeholder: (context, url) => Center(
                  child: SpinKitHourGlass(
                color: AppColors.primaryColor,
              )),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          const SizedBox(height: 5),
          Container(
            width: double.infinity,
            color: Colors.transparent,
            padding: const EdgeInsets.symmetric(horizontal: 11),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 2.5),
                Text(
                  widget.eventDate,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(height: 2.5),
                Text(
                  widget.eventName,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 120),
                  height: _animatedHeight,
                  color: Colors.transparent,
                  width: MediaQuery.of(context).size.width,
                  child: HtmlWidget(
                    widget.eventDetails,
                    renderMode: RenderMode.listView,
                  ),
                ),
                const SizedBox(height: 5),
              ],
            ),
          ),
          Container(
            height: 60,
            width: double.infinity,
            color: Colors.transparent,
            padding: const EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 30,
                  width: 90,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Text(
                      'Going',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  height: 30,
                  width: 90,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Text(
                      'Interested',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const Spacer(
                  flex: 3,
                ),
                InkWell(
                  onTap: () => setState(() {
                    _animatedHeight != 250
                        ? _animatedHeight = 250
                        : _animatedHeight = 0;
                  }),
                  child: Container(
                    height: 30,
                    width: 90,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Text(
                        'More Info',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}
