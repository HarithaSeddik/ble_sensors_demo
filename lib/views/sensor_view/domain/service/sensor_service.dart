import 'package:ble_sensors_demo/model/sensor_data/sensor_data.dart';

// decorator pattern, easier for writing mock classes
abstract class SensorService {
  final ServerClient client;

  SensorService(this.client);
  void sendToBackend(SensorData sensorData);

  Map<String, dynamic> createPayload(SensorData sensorData);
}

class _SensorServiceImpl extends SensorService {
  _SensorServiceImpl(client) : super(client);

  // Method to send SensorData to the backend
  @override
  void sendToBackend(SensorData sensorData) {
    // Create API request payload from SensorData
    Map<String, dynamic> payload = createPayload(sensorData);

    // Send payload to backend using API
    client.sendSensorData(payload);
  }

  // Helper method to create payload
  @override
  Map<String, dynamic> createPayload(SensorData sensorData) {
    return {};
  }
}

class SensorServiceProvider {
  static SensorService provide(ServerClient client) =>
      _SensorServiceImpl(client);
}

// Backend API interface
class ServerClient {
  void sendSensorData(Map<String, dynamic> payload) {/* ... */}
}
