import 'package:flutter/material.dart';
import 'package:simple_meds/models/intake.dart';
import 'package:simple_meds/widgets/medication_input_form.dart';

class MedicationInputScreen extends StatelessWidget {
  const MedicationInputScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Intake? intake = ModalRoute.of(context)!.settings.arguments as Intake?;
    return Scaffold(
      appBar: AppBar(),
      body: MedicationInputForm(intake: intake,),
    );
  }
}
