//CLASSE DE TESTE PARA PROJETO APP MATEMATICO EM FLUTTER


//modelo inicial
/* import 'package:flutter/material.dart';

class GenericScreen extends StatelessWidget {
  final String title;

  const GenericScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text('Esta é a tela $title'),
      ),
    );
  }
}
*/


import 'dart:math'; // Importe a biblioteca de matemática
import 'package:flutter/material.dart';

class GenericScreen extends StatefulWidget {
  final String title;
  final String type;

  const GenericScreen({Key? key, required this.title, required this.type}) : super(key: key);

  @override
  _GenericScreenState createState() => _GenericScreenState();
}

class _GenericScreenState extends State<GenericScreen> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  String result = "";

  void calculatePA() {
    if (_controller1.text.isNotEmpty && _controller2.text.isNotEmpty && _controller3.text.isNotEmpty) {
      int n = int.parse(_controller1.text);
      double a1 = double.parse(_controller2.text);
      double r = double.parse(_controller3.text);
      double an = a1 + (n - 1) * r;

      setState(() {
        result = "Termo Geral (an) = $an";
      });
    } else {
      setState(() {
        result = "Preencha todos os campos.";
      });
    }
  }

  void calculatePG() {
    if (_controller1.text.isNotEmpty && _controller2.text.isNotEmpty && _controller3.text.isNotEmpty) {
      int n = int.parse(_controller1.text);
      double a1 = double.parse(_controller2.text);
      double q = double.parse(_controller3.text);
      double an = a1 * pow(q, n - 1); // Corrigido aqui

      setState(() {
        result = "Termo Geral (an) = $an";
      });
    } else {
      setState(() {
        result = "Preencha todos os campos.";
      });
    }
  }

  void calculatePercent() {
    if (_controller1.text.isNotEmpty && _controller2.text.isNotEmpty) {
      double base = double.parse(_controller1.text);
      double percentage = double.parse(_controller2.text);
      double value = base * (percentage / 100);

      setState(() {
        result = "Porcentagem = $value";
      });
    } else {
      setState(() {
        result = "Preencha todos os campos.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.type == 'PA' || widget.type == 'PG') ...[
              TextField(
                controller: _controller1,
                decoration: InputDecoration(
                  labelText: 'Digite o valor de n (termo)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10),
              TextField(
                controller: _controller2,
                decoration: InputDecoration(
                  labelText: 'Digite o valor de a1 (primeiro termo)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10),
              TextField(
                controller: _controller3,
                decoration: InputDecoration(
                  labelText: widget.type == 'PA' ? 'Digite o valor de r (razão)' : 'Digite o valor de q (razão)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ] else if (widget.type == 'Percent') ...[
              TextField(
                controller: _controller1,
                decoration: InputDecoration(
                  labelText: 'Digite o valor base',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10),
              TextField(
                controller: _controller2,
                decoration: InputDecoration(
                  labelText: 'Digite a porcentagem',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ],
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: widget.type == 'PA' ? calculatePA : widget.type == 'PG' ? calculatePG : calculatePercent,
              child: Text('Calcular'),
            ),
            SizedBox(height: 20),
            Text(result, style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
