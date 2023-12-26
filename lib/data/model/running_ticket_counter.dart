import 'package:hive/hive.dart';

part 'running_ticket_counter.g.dart';

@HiveType(typeId: 6)
class RunningTicketCounter extends HiveObject {
  @HiveField(0)
  int count = 0;
}
