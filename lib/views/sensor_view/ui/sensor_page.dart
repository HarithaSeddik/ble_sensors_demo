import 'package:ble_sensors_demo/views/sensor_view/domain/cubit/sensor_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SensorPage extends StatefulWidget {
  const SensorPage({super.key});

  @override
  State<SensorPage> createState() => _SensorPageState();
}

class _SensorPageState extends State<SensorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sensor Data')),
      body: BlocBuilder<SensorCubit, SensorState>(
        builder: (context, state) {
          if (state is SensorInitial) {
            return const Center(child: Text('Press start to scan'));
          } else if (state is SensorDataUpdated) {
            return Center(
                child: Text('Temperature: ${state.sensorData.temperature}'));
          } else if (state is SensorDataInvalid) {
            return const Center(child: Text('Invalid sensor data'));
          } else {
            return const Center(child: Text('Unknown state'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<SensorCubit>().startScanning();
        },
        child: const Icon(Icons.search),
      ),
    );
  }
}
