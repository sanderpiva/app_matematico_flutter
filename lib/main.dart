import 'package:flutter/material.dart';
import 'homepage.dart';
import 'componentes/calculationscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exemplo1',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        '/home': (context) => HomePage(),
        '/calculation': (context) => CalculationPage(), // Remove o argumento aqui
        // '/pa': (context) => GenericScreen(title: 'PA', type: 'PA'),
        // '/pg': (context) => GenericScreen(title: 'PG', type: 'PG'),
        // '/porcentagem': (context) => GenericScreen(title: 'Porcentagem', type: 'Percent'),
      },
    );
  }
}
