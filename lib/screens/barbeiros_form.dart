import 'package:barberia/database/app_database.dart';
import 'package:barberia/models/barbeiro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Barbeiros extends StatefulWidget {
  @override
  State<Barbeiros> createState() => _BarbeirosFormState();
}

class _BarbeirosFormState extends State<Barbeiros> {
  List<Map<String, dynamic>> _allData = [];
  bool _isLoading = true;
  void _refreshData() async {
    final data = await SQLHelper.getAllData();
    setState(() {
      _allData = data;
      _isLoading = false;
    });
  }

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _servicoController = TextEditingController();
  final TextEditingController _horaEntradaController = TextEditingController();
  final TextEditingController _horaSaidaController = TextEditingController();

  Future<void> _addData() async {
    await SQLHelper.createData(_nomeController.text, _servicoController.text,
        _horaEntradaController.text, _horaSaidaController.text);
    _refreshData();
  }

  Future<void> _updateData(int id) async {
    await SQLHelper.updateData(
        id,
        _nomeController.text,
        _servicoController.text,
        _horaEntradaController.text,
        _horaSaidaController.text);
    _refreshData();
  }

  void _deleteData(int id) async {
    await SQLHelper.deleteData(id);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text("Deletado com sucesso!")));
    _refreshData();
  }

  @override
  void initState() {
    super.initState();
    _refreshData();
  }

  void showBottomSheet(int? id) async {
    if (id != null) {
      final existingData =
          _allData.firstWhere((element) => element['id'] == id);
      _nomeController.text = existingData['nome'];
      _servicoController.text = existingData['servico'];
    }
    showModalBottomSheet(
      elevation: 5,
      isScrollControlled: true,
      context: context,
      builder: (_) => Container(
        padding: EdgeInsets.only(
          top: 30,
          left: 15,
          right: 15,
          bottom: MediaQuery.of(context).viewInsets.bottom + 50,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: _nomeController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Nome: ",
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _servicoController,
              maxLines: 4,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Serviços: ",
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _horaEntradaController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Hora de Entrada: ",
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _horaSaidaController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Hora de Saída: ",
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  if (id == null) {
                    await _addData();
                  }
                  if (id != null) {
                    await _updateData(id);
                  }
                  _nomeController.text = "";
                  _servicoController.text = "";
                  _horaEntradaController.text = "";
                  _horaSaidaController.text = "";

                  Navigator.of(context).pop();
                  print("Data Added");
                },
                child: Padding(
                  padding: EdgeInsets.all(18),
                  child: Text(
                    id == null ? "Salvar Barbeiro" : "Editar Barbeiro",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Lista de Barbeiros"),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _allData.length,
              itemBuilder: (context, index) => Card(
                margin: EdgeInsets.all(15),
                child: ListTile(
                  title: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      _allData[index]['nome'],
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  // subtitle: Text(),
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showBottomSheet(null),
        child: Icon(Icons.add),
      ),
    );
  }
}
