import 'package:flutter/material.dart';
import 'package:simple_meds/screens/medication_input_screen.dart';
import 'package:simple_meds/screens/medications_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => MedicationsListScreen(),
        '/medication_input_screen': (context) => const MedicationInputScreen(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
