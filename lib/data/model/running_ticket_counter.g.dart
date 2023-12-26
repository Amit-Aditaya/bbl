// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'running_ticket_counter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RunningTicketCounterAdapter extends TypeAdapter<RunningTicketCounter> {
  @override
  final int typeId = 6;

  @override
  RunningTicketCounter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RunningTicketCounter()..count = fields[0] as int;
  }

  @override
  void write(BinaryWriter writer, RunningTicketCounter obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.count);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RunningTicketCounterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
