import 'package:flutter/material.dart';
import 'componentes/appbar.dart';
import 'componentes/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: MyAppBar(title: 'Aplicativo Matemático'),
      drawer: MyDrawer(),
      body: Center(

        child: Image.asset(
          'assets/img/logo2.png',
          //width: double.infinity,
          //height: double.infinity,
          fit: BoxFit.cover,
        ),
      )
    );
  }
}


