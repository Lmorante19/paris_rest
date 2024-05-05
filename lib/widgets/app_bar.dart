import 'package:flutter/material.dart';

import '../screens/login_page.dart';
import 'widgets.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(200);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromRGBO(0, 109, 255, 1),
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        },
      ),
      title: Image.network(
        'https://seeklogo.com/images/P/paris-cl-logo-D2E2E84D3D-seeklogo.com.png',
        width: 60,
        height: 60,
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.account_circle_outlined, color: Colors.white),
          onPressed: () {
            // Navega a la página de inicio de sesión al hacer clic en el ícono de cuenta
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          },
        ),
        IconButton(
          icon: const Icon(Icons.shopping_cart_outlined, color: Colors.white),
          onPressed: () {},
        ),
      ],
      flexibleSpace: const Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container2(),
          Container3(),
        ],
      ),
    );
  }
}
