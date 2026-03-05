import 'package:flutter/material.dart';

//
// BACK-END
//
class GorjetaController extends ChangeNotifier{

  List<double> listaGorjetas = [10.0,20.0,25.0,30.0];

  double _valorConta = 0.0;
  double _percentualGorjeta = 10.0;

  double get valorConta => _valorConta;
  double get percentualGorjeta => _percentualGorjeta;

}