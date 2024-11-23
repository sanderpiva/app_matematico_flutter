import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text("Aplicativo Matemático"),
              accountEmail: Text("players@gmail.com"),
              currentAccountPicture: CircleAvatar(
                //original
                /*backgroundColor: Colors.white,
                child: Text(
                  'F.JR.A',
                  style: TextStyle(color: Colors.blue),
                ),*/
                backgroundImage: AssetImage('assets/img/logo.jpg'), // Replace with your image path
                backgroundColor: Colors.transparent, // Transparent background for image visibility

              ),
              decoration: BoxDecoration(
                color: Colors.blue,
                //parte acrescentada e testada pelo aluno
                /*image: DecorationImage(
                  image: AssetImage('assets/img/leao.jpg'), // Replace with your image path
                  fit: BoxFit.cover, // Ensure image covers the entire background
                ),*/
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Alunos'),
              //onTap: () {},
              onTap: (){Navigator.pushNamed(context, '/calculation');}
            ),
            /*
            ListTile(
              leading: const Icon(Icons.shopping_basket),
              title: const Text('PG'),
              //onTap: () {},
              onTap: (){Navigator.pushNamed(context, '/pg');}
            ),

            ListTile(
              leading: const Icon(Icons.favorite, color: Colors.red),
              title: const Text('Porcentagem'),
              //onTap: () {},
              onTap: (){Navigator.pushNamed(context, '/porcentagem');}
            ),*/
            const Divider(
              //color: Colors.blue,
            ),
            ListTile(
              leading: const Icon(Icons.close),
              title: const Text('Sair'),
              //onTap: (){},
              onTap: () {Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);},

            ),
          ],
        ));
  }
}
