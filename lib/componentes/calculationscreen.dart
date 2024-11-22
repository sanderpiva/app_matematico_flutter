import 'package:flutter/material.dart';
import 'dart:math';

class CalculationPage extends StatelessWidget {
  const CalculationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Escolha um Cálculo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2, // Define duas colunas no grid
          crossAxisSpacing: 16, // Espaçamento entre colunas
          mainAxisSpacing: 16, // Espaçamento entre linhas
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CalculationInputScreen(type: 'PA'),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Text(
                    'Cálculo de PA',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CalculationInputScreen(type: 'PG'),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Text(
                    'Cálculo de PG',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//
class CalculationInputScreen extends StatefulWidget {
  final String type; // 'PA' ou 'PG'

  const CalculationInputScreen({Key? key, required this.type}) : super(key: key);

  @override
  _CalculationInputScreenState createState() => _CalculationInputScreenState();
}

class _CalculationInputScreenState extends State<CalculationInputScreen> {
  final _formKey = GlobalKey<FormState>();
  final _primeiroTermoController = TextEditingController();
  final _razaoController = TextEditingController();
  final _posicaoController = TextEditingController();
  String result = '';

  // Função para calcular o termo baseado em PA ou PG
  double _calcularTermo(double primeiroTermo, double razao, int posicao) {
    if (widget.type == 'PA') {
      return primeiroTermo + (posicao - 1) * razao; // Fórmula da PA
    } else {
      return primeiroTermo * pow(razao, posicao - 1); // Fórmula da PG
    }
  }

  // Valida o formulário e calcula o termo
  void _validateAndCalculate() {
    if (_formKey.currentState!.validate()) {
      double primeiroTermo = double.parse(_primeiroTermoController.text);
      double razao = double.parse(_razaoController.text);
      int posicao = int.parse(_posicaoController.text);

      if (primeiroTermo <= 0 || razao <= 0 || posicao <= 0) {
        setState(() {
          result = 'Os valores devem ser positivos e maiores que zero.';
        });
        return;
      }

      double resultado = _calcularTermo(primeiroTermo, razao, posicao);

      setState(() {
        result =
        'O ${posicao}º termo da ${widget.type} é: ${resultado.toStringAsFixed(2)}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cálculo de ${widget.type}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _primeiroTermoController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Primeiro Termo: a1'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe o primeiro termo';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Digite um número válido';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _razaoController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: widget.type == 'PA' ? 'Razão (r)' : 'Razão (q)',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe a razão';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Digite um número válido';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _posicaoController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Posição: n'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe a posição';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Digite um número inteiro válido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _validateAndCalculate,
                child: const Text('Calcular termo geral'),
              ),
              const SizedBox(height: 20),
              Text(
                result,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
