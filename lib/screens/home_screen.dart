import 'package:flutter/material.dart';
import 'package:prueba2/widgets/app_bar.dart';
import 'package:prueba2/widgets/menu.dart';
import 'package:prueba2/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Container1(),
            Container4(),
            Container5(),
          ],
        ),
      ),
    );
  }
}
