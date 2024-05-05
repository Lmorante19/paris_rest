import 'package:flutter/material.dart';
import 'package:prueba2/providers/service_provider.dart';
import 'routes/app_routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const ProviderState());
}

class ProviderState extends StatelessWidget {
  const ProviderState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ServiceProvider(), lazy: false)
      ],
      child: const MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Paris',
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
