// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_result.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExerciseResultAdapter extends TypeAdapter<ExerciseResult> {
  @override
  final int typeId = 1;

  @override
  ExerciseResult read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExerciseResult(
      title: fields[0] as String,
      duration: fields[1] as int,
      completed: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ExerciseResult obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.duration)
      ..writeByte(2)
      ..write(obj.completed);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExerciseResultAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
