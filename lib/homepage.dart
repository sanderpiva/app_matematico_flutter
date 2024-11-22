import 'package:flutter/material.dart';
import 'componentes/appbar.dart';
import 'componentes/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff847859),
      appBar: MyAppBar(title: 'MEU APP'),
      drawer: MyDrawer(),
      body: Center(
        child: Image.asset(
          'assets/img/girafa.jpg',
          width: double.infinity,
          height: double.infinity,
          //fit: BoxFit.cover,
        ),
        /*
        child: Image.network(
          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
          fit: BoxFit.cover,
        ),*/
      ),
    );
  }
}
