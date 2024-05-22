// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sensor_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SensorData _$SensorDataFromJson(Map<String, dynamic> json) => SensorData(
      sensorId: json['sensorId'] as String,
      temperature: (json['temperature'] as num).toDouble(),
      humidity: (json['humidity'] as num).toDouble(),
      pressure: (json['pressure'] as num).toDouble(),
      windSpeed: (json['windSpeed'] as num).toDouble(),
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$SensorDataToJson(SensorData instance) =>
    <String, dynamic>{
      'sensorId': instance.sensorId,
      'temperature': instance.temperature,
      'humidity': instance.humidity,
      'pressure': instance.pressure,
      'windSpeed': instance.windSpeed,
      'timestamp': instance.timestamp.toIso8601String(),
    };
