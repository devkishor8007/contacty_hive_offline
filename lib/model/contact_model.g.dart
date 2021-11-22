// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ContactAdapter extends TypeAdapter<Contact> {
  @override
  final int typeId = 0;

  @override
  Contact read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Contact(
      name: fields[0] as String,
      age: fields[1] as String,
      phone: fields[2] as String,
      relation: fields[3] as Relation,
    );
  }

  @override
  void write(BinaryWriter writer, Contact obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.age)
      ..writeByte(2)
      ..write(obj.phone)
      ..writeByte(3)
      ..write(obj.relation);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ContactAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RelationAdapter extends TypeAdapter<Relation> {
  @override
  final int typeId = 1;

  @override
  Relation read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Relation.family;
      case 1:
        return Relation.friend;
      case 2:
        return Relation.teacher;
      case 3:
        return Relation.staff;
      case 4:
        return Relation.owner;
      default:
        return Relation.family;
    }
  }

  @override
  void write(BinaryWriter writer, Relation obj) {
    switch (obj) {
      case Relation.family:
        writer.writeByte(0);
        break;
      case Relation.friend:
        writer.writeByte(1);
        break;
      case Relation.teacher:
        writer.writeByte(2);
        break;
      case Relation.staff:
        writer.writeByte(3);
        break;
      case Relation.owner:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RelationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
