part of 'sensor_cubit.dart';

abstract class SensorState {}

final class SensorInitial extends SensorState {}

final class SensorDataUpdated extends SensorState {
  final SensorData sensorData;

  SensorDataUpdated(this.sensorData);
}

final class SensorDataInvalid extends SensorState {}
