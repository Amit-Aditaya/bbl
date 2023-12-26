import 'package:hive/hive.dart';

part 'current_user.g.dart';

@HiveType(typeId: 1)
class CurrentUser {
  @HiveField(0)
  String? phoneNumber;
  CurrentUser({
    required this.phoneNumber,
  });
}
