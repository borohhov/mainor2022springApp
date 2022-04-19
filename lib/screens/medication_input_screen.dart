import 'package:flutter/material.dart';
import 'package:simple_meds/widgets/medication_input_form.dart';

class MedicationInputScreen extends StatelessWidget {
  const MedicationInputScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: MedicationInputForm(),
    );
  }
}
