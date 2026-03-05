import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'controller/gorjeta_controller.dart';
import 'view/gorjeta_view.dart';

final g = GetIt.instance;

void main() {

  //registrar o controlador (gerenciador de estado)
  g.registerSingleton<GorjetaController>(GorjetaController());

  runApp(
    DevicePreview(
      builder: (context) => const MainApp()
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GorjetaCalc',
      home: GorjetaView(),
    );
  }
}