import 'package:feriados/pages/home/home_pages.dart';
import 'package:feriados/setup_app_bindings/setup_app_bindings.dart';
import 'package:flutter/material.dart';

void main() {
  setupAppBindings();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
