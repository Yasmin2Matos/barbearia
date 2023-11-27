import 'package:barberia/models/barbeiro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BarbeirosForm extends StatefulWidget {
  @override
  State<BarbeirosForm> createState() => _BarbeirosFormState();
}

class _BarbeirosFormState extends State<BarbeirosForm> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _servicosController = TextEditingController();
  final TextEditingController _horaEntradaController = TextEditingController();
  TimeOfDay _horaEntrada = TimeOfDay.now();
  final TextEditingController _horaSaidaController = TextEditingController();
  TimeOfDay _horaSaida = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo Barbeiro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _nomeController,
              decoration: InputDecoration(
                labelText: ('Nome:'),
              ),
              style: TextStyle(fontSize: 15.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _servicosController,
              decoration: InputDecoration(
                labelText: ('Serviços:'),
              ),
              style: TextStyle(fontSize: 15.0),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                  controller: _horaEntradaController,
                  decoration: InputDecoration(
                      labelText: 'Começo Expediente:',
                      suffixIcon: IconButton(
                          icon: Icon(Icons.access_time),
                          onPressed: () async {
                            TimeOfDay? pickedTime = await showTimePicker(
                                context: context, initialTime: _horaEntrada);

                            if (pickedTime != null &&
                                pickedTime != _horaEntrada) {
                              setState(() {
                                _horaEntrada = pickedTime;
                                _horaEntradaController.text =
                                    _horaEntrada.format(context);
                              });
                            }
                          })))),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                  controller: _horaSaidaController,
                  decoration: InputDecoration(
                      labelText: 'Final Expediente:',
                      suffixIcon: IconButton(
                          icon: Icon(Icons.access_time),
                          onPressed: () async {
                            TimeOfDay? pickedTime = await showTimePicker(
                                context: context, initialTime: _horaSaida);

                            if (pickedTime != null &&
                                pickedTime != _horaSaida) {
                              setState(() {
                                _horaSaida = pickedTime;
                                _horaSaidaController.text =
                                    _horaSaida.format(context);
                              });
                            }
                          })))),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              child: Text('Salvar'),
              onPressed: () {
                final String nome = _nomeController.text;
                final String servicos = _servicosController.text;
                final String formattedString = _horaEntradaController.text;
                TimeOfDay? horaEntrada = TimeOfDay(hour: 00, minute: 00);
                final String formattedStringg = _horaSaidaController.text;
                TimeOfDay? horaSaida = TimeOfDay(hour: 00, minute: 00);
                final Barbeiro newBarbeiro = Barbeiro(
                    id: 0,
                    nome: nome,
                    servicos: servicos,
                    horaEntrada: horaEntrada,
                    horaSaida: horaSaida);
                Navigator.pop(context, newBarbeiro);
              },
            ),
          )
        ]),
      ),
    );
  }
}
