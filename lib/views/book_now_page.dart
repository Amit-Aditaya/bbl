import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/custom_widgets/custom_app_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BookNowPage extends StatelessWidget {
  const BookNowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: Colors.white,
        title: 'Book Now',
      ),
      // appBar: AppBar(title: BlocBuilder<ChildrenBloc, ChildrenState>(
      //   builder: (context, state) {
      //     if (state is ChildrenLoadedState) {
      //       return Text('${state.childrenModel.items[1].childName}');
      //     } else {
      //       return Text('ee');
      //     }
      //   },
      // )),
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.transparent,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                //  Navigator.pushNamed(context, 'slotBookingPage');
                Navigator.pushNamed(context, 'slotBookingMediatorPage');
              },
              child: CircleAvatar(
                radius: 62,
                backgroundColor: Colors.teal,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 60,
                  child: SvgPicture.asset(
                    'assets/images/calendar-1.svg',
                    height: 90,
                    width: 90,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Slot Booking',
              style: TextStyle(
                color: Colors.teal,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 70),
            InkWell(
              onTap: () {
                //Navigator.pushNamed(context, 'partyBookingPage');
                Navigator.pushNamed(context, 'partyBookingMediatorPage');
              },
              child: CircleAvatar(
                radius: 62,
                backgroundColor: Colors.purple,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 60,
                  child: SvgPicture.asset(
                    'assets/images/balloons.svg',
                    height: 90,
                    width: 90,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Party Booking',
              style: TextStyle(
                color: Colors.purple,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
