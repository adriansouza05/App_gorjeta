import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'controller/gorjeta_controller.dart';
import 'view/gorjeta_view.dart';

final g = GetIt.instance;

void main() {
  // Registrar o controlador (gerenciador de estado)
  g.registerSingleton<GorjetaController>(GorjetaController());

  runApp(
    DevicePreview(
      // ✅ Desativa em produção; ative só em debug
      enabled: true,
      builder: (context) => const MainApp(),
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
      // ✅ useInheritedMediaQuery foi removido nas versões recentes — não usar
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      home: const GorjetaView(),
    );
  }
}