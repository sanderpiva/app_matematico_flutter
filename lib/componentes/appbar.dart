import 'package:flutter/material.dart';

//Appbar estende da classe PreferredSizeWidget a qual precisa de um valor para a altura
class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const MyAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue,
      iconTheme: const IconThemeData(
        color: Colors.white, // Define a cor dos ícones da AppBar como branco
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.account_circle_rounded,
            size: 30,
          ),
          onPressed: () {
            //print("Olá mundo");
          },
        ),
      ],
    );
  }
}
