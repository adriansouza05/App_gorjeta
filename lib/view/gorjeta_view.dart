import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../controller/gorjeta_controller.dart';

class GorjetaView extends StatefulWidget {
  const GorjetaView({super.key});

  @override
  State<GorjetaView> createState() => _GorjetaViewState();
}

class _GorjetaViewState extends State<GorjetaView> {
  //utilizar o controlador
  final ctrl = GetIt.I.get<GorjetaController>();

  // "escutar" as modificações enviadas pelo controller
  @override
  void initState() {
    super.initState();
    ctrl.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //
              // Ícone Inicial
              //
              CircleAvatar(
                radius: 80,
                backgroundColor: Colors.green.shade100,
                child: Icon(
                  Icons.currency_exchange,
                  size: 90,
                  color: Colors.green.shade900,
                ),
              ),
              //
              //
              //
              SizedBox(height: 30),

              Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      //
                      // CAMPO DE TEXTO
                      //
                      TextField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: InputDecoration(
                          labelText: 'Valor da Conta',
                          prefixIcon: Icon(Icons.receipt_long),
                          filled: true,
                          fillColor: Colors.grey.shade100,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        onChanged: (value) {
                          //receber o valor digitado pelo usuário
                          ctrl.setValorConta(double.tryParse(value) ?? 0.0);
                        },
                      ),
                      //
                      // DropDown
                      //
                      SizedBox(height: 20),
                      SizedBox(
                        height: 60,
                        child: DropdownButtonFormField<double>(
                          initialValue: ctrl.percentualGorjeta,
                          decoration: InputDecoration(
                            labelText: 'Percentual da gorjeta',
                            filled: true,
                            fillColor: Colors.grey.shade100,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          items: ctrl.listaGorjetas
                              .map(
                                (value) => DropdownMenuItem<double>(
                                  value: value,
                                  child: Text(
                                    '$value%',
                                    style: const TextStyle(fontSize: 22),
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            //receber o percentual da gorjeta
                            if (value != null) {
                              ctrl.setPercentualGorjeta(value);
                            }
                          },
                        ),
                      ),
                      //
                      // BOTÃO
                      //
                      SizedBox(height: 15),
                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green.shade700,
                            foregroundColor: Colors.grey.shade200,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            textStyle: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          onPressed: () {
                            //calcular o valor da gorjeta
                            if (ctrl.valorConta > 0) {
                              ctrl.calcularGorjeta();
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Informe o valor da conta'),
                                ),
                              );
                            }
                          },
                          child: Text('CALCULAR'),
                        ),
                      ),
                      //
                      // Exibir o resultado
                      //
                      SizedBox(height: 30),
                      Card(
                        color: Colors.green.shade50,
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Text(
                                'Gorjeta',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.green.shade900,
                                ),
                              ),
                              Text(
                                'R\$ ${ctrl.valorGorjeta}',
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Divider(),
                              SizedBox(height: 10),
                              Text(
                                'Total a pagar',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.green.shade900,
                                ),
                              ),
                              Text(
                                'R\$ ${ctrl.totalPagar}',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
