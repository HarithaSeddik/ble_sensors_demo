import 'package:json_annotation/json_annotation.dart';

part 'sensor_data.g.dart';

@JsonSerializable()
class SensorData {
  final String sensorId;
  final double temperature;
  final double humidity;
  final double pressure;
  final double windSpeed;
  final DateTime timestamp;

  SensorData({
    required this.sensorId,
    required this.temperature,
    required this.humidity,
    required this.pressure,
    required this.windSpeed,
    required this.timestamp,
  });

  // Factory method to create a new SensorData instance from a JSON object
  factory SensorData.fromJson(Map<String, dynamic> json) =>
      _$SensorDataFromJson(json);

  // Method to convert a SensorData instance to a JSON object
  Map<String, dynamic> toJson() => _$SensorDataToJson(this);
}
