import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_meds/models/intake.dart';
import 'package:simple_meds/models/medication.dart';

class MedicationInputForm extends StatefulWidget {
  const MedicationInputForm({Key? key}) : super(key: key);

  @override
  State<MedicationInputForm> createState() => _MedicationInputFormState();
}

class _MedicationInputFormState extends State<MedicationInputForm> {
  late Intake _intake;
  TextEditingController medController = TextEditingController();
  TextEditingController doseController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  @override
  void initState() {
    _intake = Intake(Medication("", 0), DateTime.now());
    medController.text = _intake.med.title;
    doseController.text = _intake.med.dosage.toString();
    dateController.text = _intake.dateTime.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            "Record Medication Intake",
            style: TextStyle(fontSize: 20),
          ),
          TextField(
            decoration: InputDecoration(labelText: "Medication"),
            controller: medController,
          ),
          TextField(
            decoration: InputDecoration(labelText: "Dose"),
            controller: doseController,
          ),
          TextField(
            decoration: InputDecoration(labelText: "Date"),
            controller: dateController,
          ),
        ],
      ),
    );
  }
}
