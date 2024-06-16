// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_hive_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderHiveEntityAdapter extends TypeAdapter<OrderHiveEntity> {
  @override
  final int typeId = 0;

  @override
  OrderHiveEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderHiveEntity(
      tableId: fields[0] as int,
      meals: (fields[1] as List).cast<MealHiveEntity>(),
      drinks: (fields[2] as List).cast<DrinkHiveEntity>(),
      timestamp: fields[3] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, OrderHiveEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.tableId)
      ..writeByte(1)
      ..write(obj.meals)
      ..writeByte(2)
      ..write(obj.drinks)
      ..writeByte(3)
      ..write(obj.timestamp);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderHiveEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MealHiveEntityAdapter extends TypeAdapter<MealHiveEntity> {
  @override
  final int typeId = 1;

  @override
  MealHiveEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MealHiveEntity(
      name: fields[0] as String,
      quantity: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, MealHiveEntity obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.quantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MealHiveEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DrinkHiveEntityAdapter extends TypeAdapter<DrinkHiveEntity> {
  @override
  final int typeId = 2;

  @override
  DrinkHiveEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DrinkHiveEntity(
      name: fields[0] as String,
      quantity: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, DrinkHiveEntity obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.quantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DrinkHiveEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
