import 'package:flutter/material.dart';
import 'package:prueba2/widgets/app_bar.dart';
import 'package:prueba2/widgets/menu.dart';

class ZapatillasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: const SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
