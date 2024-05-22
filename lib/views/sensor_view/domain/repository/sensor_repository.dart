import 'package:ble_sensors_demo/model/sensor_data/sensor_data.dart';

// decorator pattern, easier for writing mock classes
abstract class SensorRepository {
  // Method to convert raw byte data to SensorData
  SensorData convertToSensorData(List<int>? byteData);

  // Helper methods to extract data
  String extractSensorId(List<int>? byteData);
  double extractTemperature(List<int>? byteData);
  double extractHumidity(List<int>? byteData);
  double extractPressure(List<int>? byteData);
  double extractWindSpeed(List<int>? byteData);
  DateTime getCurrentTimestamp();
}

// concrete implementation
class _SensorRepositoryImpl implements SensorRepository {
  @override
  SensorData convertToSensorData(List<int>? byteData) {
    // Extract relevant data from byteData
    String sensorId = extractSensorId(byteData);
    double temperature = extractTemperature(byteData);
    double humidity = extractHumidity(byteData);
    double pressure = extractPressure(byteData);
    double windSpeed = extractWindSpeed(byteData);
    DateTime timestamp = getCurrentTimestamp();

    // Create and return SensorData object
    return SensorData(
        sensorId: sensorId,
        temperature: temperature,
        humidity: humidity,
        pressure: pressure,
        windSpeed: windSpeed,
        timestamp: timestamp);
  }

  @override
  double extractHumidity(List<int>? byteData) {
    // TODO: implement extractHumidity
    throw UnimplementedError();
  }

  @override
  double extractPressure(List<int>? byteData) {
    // TODO: implement extractPressure
    throw UnimplementedError();
  }

  @override
  String extractSensorId(List<int>? byteData) {
    // TODO: implement extractSensorId
    throw UnimplementedError();
  }

  @override
  double extractTemperature(List<int>? byteData) {
    // TODO: implement extractTemperature
    throw UnimplementedError();
  }

  @override
  double extractWindSpeed(List<int>? byteData) {
    // TODO: implement extractWindSpeed
    throw UnimplementedError();
  }

  @override
  DateTime getCurrentTimestamp() {
    // TODO: implement getCurrentTimestamp
    throw UnimplementedError();
  }
}

class SensorRepositoryProvider {
  static SensorRepository provide() => _SensorRepositoryImpl();
}
