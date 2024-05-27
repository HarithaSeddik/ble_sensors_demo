import 'package:ble_sensors_demo/views/sensor_view/domain/cubit/sensor_cubit.dart';
import 'package:ble_sensors_demo/views/sensor_view/domain/repository/sensor_repository.dart';
import 'package:ble_sensors_demo/views/sensor_view/domain/service/sensor_service.dart';
import 'package:ble_sensors_demo/views/sensor_view/ui/sensor_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter BLE App Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 202, 131, 60)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'BLE Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SensorCubit>(
      create: (context) => SensorCubit(
        SensorRepositoryProvider.provide(),
        SensorServiceProvider.provide(ServerClient()),
      ),
      child: const SensorPage(),
    );
  }
}
