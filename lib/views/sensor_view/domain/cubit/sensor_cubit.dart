import 'package:ble_sensors_demo/model/sensor_data/sensor_data.dart';

import 'package:ble_sensors_demo/views/sensor_view/domain/repository/sensor_repository.dart';
import 'package:ble_sensors_demo/views/sensor_view/domain/service/sensor_service.dart';
import 'package:flutter_blue/flutter_blue.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'sensor_state.dart';

class SensorCubit extends Cubit<SensorState> {
  final SensorRepository sensorRepository;
  final SensorService sensorService;

  SensorCubit(this.sensorRepository, this.sensorService)
      : super(SensorInitial());

  void startScanning() {
    FlutterBlue.instance.startScan(timeout: const Duration(seconds: 2));
    FlutterBlue.instance.scanResults.listen((results) {
      for (ScanResult r in results) {
        receiveSensorData(r.advertisementData.manufacturerData['key']);
      }
    });
  }

  void receiveSensorData(List<int>? byteData) {
    // Convert raw data to SensorData
    SensorData sensorData = sensorRepository.convertToSensorData(byteData);

    // Validate sensor data
    if (validateSensorData(byteData, sensorData)) {
      // Update the UI
      emit(SensorDataUpdated(sensorData));

      // Send data to the backend
      sensorService.sendToBackend(sensorData);
    } else {
      emit(SensorDataInvalid());
    }
  }

  bool validateSensorData(List<int>? byteData, SensorData sensorData) {
    // Check if the advertisement data length is 16 bytes
    if (byteData?.length != 16) {
      return false;
    }

    // Check if the manufacturer byte starts with 0xFF
    if (byteData?[0] != 0xFF) {
      return false;
    }

    // Validation logic for sensor data values
    if (sensorData.temperature < -50 || sensorData.temperature > 50) {
      return false;
    }
    if (sensorData.humidity < 0 || sensorData.humidity > 100) {
      return false;
    }
    return true;
  }
}
