import 'package:flutter/material.dart';

class Barbeiro {
  final int id;
  final String nome;
  final String servicos;
  final TimeOfDay horaEntrada;
  final TimeOfDay horaSaida;

  Barbeiro(
      {required this.id,
      required this.nome,
      required this.servicos,
      required this.horaEntrada,
      required this.horaSaida});

  @override
  String toString() {
    return 'Barbeiro{nome: $nome, servicos $servicos, horaEntrada $horaEntrada, horaSaida $horaSaida}';
  }
}
