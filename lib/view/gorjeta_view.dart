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
                          onPressed: () {},
                          child: Text('CALCULAR'),
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
