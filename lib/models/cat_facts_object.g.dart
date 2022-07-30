// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_facts_object.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CatsFactsObjectAdapter extends TypeAdapter<CatsFactsObject> {
  @override
  final int typeId = 0;

  @override
  CatsFactsObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CatsFactsObject(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CatsFactsObject obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.user)
      ..writeByte(2)
      ..write(obj.text);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is CatsFactsObjectAdapter &&
              runtimeType == other.runtimeType &&
              typeId == other.typeId;
}