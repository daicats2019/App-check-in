// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timeData.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class timaDataAdapter extends TypeAdapter<timaData> {
  @override
  final int typeId = 1;

  @override
  timaData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return timaData(
      dateTime: fields[0] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, timaData obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.dateTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is timaDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
