import 'package:flutter/material.dart';
import 'package:simple_meds/providers/intake_list_provider.dart';
import 'package:simple_meds/screens/medication_input_screen.dart';
import 'package:simple_meds/screens/medications_list_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<IntakeListProvider>(
      create: (context) => IntakeListProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<IntakeListProvider>(
      builder: (context, intakes, _) {
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
      },
    );
  }
}
