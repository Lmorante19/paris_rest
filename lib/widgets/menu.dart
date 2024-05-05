import 'package:flutter/material.dart';
import 'package:prueba2/screens/screens.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Categorias',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ExpansionTile(
            title: Text('Vestuario'),
            children: [
              ListTile(
                title: Text('Zapatillas'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RopaPage()),
                  );
                },
              ),
              ListTile(
                title: Text('Pantalones'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RopaPage()),
                  );
                },
              ),
              ListTile(
                title: Text('Gorros'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RopaPage()),
                  );
                },
              ),
              ListTile(
                title: Text('Polerones'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RopaPage()),
                  );
                },
              ),
              ListTile(
                title: Text('Parkas'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RopaPage()),
                  );
                },
              ),
              ListTile(
                title: Text('Poleras'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RopaPage()),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
