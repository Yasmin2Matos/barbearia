import 'package:barberia/screens/barbeiros_form.dart';
import 'package:flutter/material.dart';

class Barbeiros extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('lista de Barbeiros'),
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: ListTile(
              title: Text(
                'Vitor',
                style: TextStyle(fontSize: 24),
              ),
              subtitle: Text('horário de trabalho: 09:00 ás 18:00'),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) => BarbeirosForm(),
                ),
              )
              .then((newBarbeiro) => debugPrint(newBarbeiro.toString()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
