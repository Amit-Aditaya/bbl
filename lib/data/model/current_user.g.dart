// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CurrentUserAdapter extends TypeAdapter<CurrentUser> {
  @override
  final int typeId = 1;

  @override
  CurrentUser read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CurrentUser(
      phoneNumber: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CurrentUser obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.phoneNumber);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CurrentUserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
