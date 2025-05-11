// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_result.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WorkoutResultAdapter extends TypeAdapter<WorkoutResult> {
  @override
  final int typeId = 0;

  @override
  WorkoutResult read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WorkoutResult(
      dateTime: fields[0] as DateTime,
      title: fields[1] as String,
      goal: fields[2] as String,
      time: fields[3] as String,
      intensity: fields[4] as String,
      level: fields[5] as String,
      exercises: (fields[6] as List).cast<ExerciseResult>(),
      calories: fields[7] as int?,
      pulse: fields[8] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, WorkoutResult obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.dateTime)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.goal)
      ..writeByte(3)
      ..write(obj.time)
      ..writeByte(4)
      ..write(obj.intensity)
      ..writeByte(5)
      ..write(obj.level)
      ..writeByte(6)
      ..write(obj.exercises)
      ..writeByte(7)
      ..write(obj.calories)
      ..writeByte(8)
      ..write(obj.pulse);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkoutResultAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
