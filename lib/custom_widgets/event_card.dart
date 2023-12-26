import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class UpComingEventCard extends StatefulWidget {
  final int eventId;
  final String eventName;
  final String imageName;
  final String eventDate;
  final String eventDetails;
  const UpComingEventCard({
    Key? key,
    required this.eventId,
    required this.eventName,
    required this.imageName,
    required this.eventDate,
    required this.eventDetails,
  }) : super(key: key);

  @override
  State<UpComingEventCard> createState() => _UpComingEventCardState();
}

class _UpComingEventCardState extends State<UpComingEventCard> {
  double _animatedHeight = 0;
  late double x;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          Container(
            //height: 60,
            width: double.infinity,
            color: Colors.transparent,
            padding: const EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 2.5,
                ),
                Text(
                  widget.eventDate,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(
                  height: 2.5,
                ),
                Text(
                  widget.eventName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 120),
                  height: _animatedHeight,
                  color: Colors.transparent,
                  width: double.infinity,
                  child: HtmlWidget(
                    widget.eventDetails,
                    renderMode: RenderMode.listView,
                  ),
                ),
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
        ],
      ),
    );
  }
}
