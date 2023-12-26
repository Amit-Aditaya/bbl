import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SlotTimeCard extends StatelessWidget {
  //SlotTimeCard({Key? key}) : super(key: key);

  // String str = "08:00 PM - 08:59 PM";

  final String timeSlotRange;
  final int remainingSlots;

  const SlotTimeCard(
      {Key? key, required this.timeSlotRange, required this.remainingSlots})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(7.5),
      height: 175,
      width: 150,
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 125,
            width: 125,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
                border: Border.all(width: 6, color: Colors.black)),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  timeSlotRange.split(' - ').first,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                  textAlign: TextAlign.center,
                ),
                const Text(
                  'to',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                  textAlign: TextAlign.center,
                ),
                Text(
                  timeSlotRange.split(' - ').last,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ],
            )),
          ),
          Container(
            height: 40,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(50)),
            child: Center(
                child: Text(
              '$remainingSlots Slots Remaining',
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            )),
          )
        ],
      ),
    );
  }
}
