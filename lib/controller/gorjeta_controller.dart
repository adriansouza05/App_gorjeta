import 'package:flutter/material.dart';

//
// BACK-END
//
class GorjetaController extends ChangeNotifier{

  List<double> listaGorjetas = [5.0,10.0,20.0,25.0,30.0];

  double _valorConta = 0.0;
  double _percentualGorjeta = 10.0;
  double _valorGorjeta = 0.0;
  double _totalPagar = 0.0;

  double get valorConta => _valorConta;
  double get percentualGorjeta => _percentualGorjeta;
  String get valorGorjeta => _valorGorjeta.toStringAsFixed(2).replaceFirst('.', ',');
  String get totalPagar => _totalPagar.toStringAsFixed(2).replaceFirst('.', ',');

  //receber o valor da conta
  void setValorConta(double novoValor){
    _valorConta = novoValor;
    notifyListeners();
  }

  //receber o percentual da gorjeta
  void setPercentualGorjeta(double novoPercentual){
    _percentualGorjeta = novoPercentual;
    notifyListeners();
  }

  //caclcular a gorjeta
  void calcularGorjeta(){
    if (_valorConta>0){
      _valorGorjeta = _valorConta * (_percentualGorjeta/100);
      _totalPagar = _valorConta+_valorGorjeta;
      notifyListeners();
    }
  }

}