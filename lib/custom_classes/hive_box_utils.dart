import 'package:flutter_babuland_app/data/model/running_ticket_counter.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveBoxUtils {
  static late Box box;

  static Box<RunningTicketCounter> getRunningTicketCounter() =>
      Hive.box<RunningTicketCounter>('running_ticket_counter');
}
