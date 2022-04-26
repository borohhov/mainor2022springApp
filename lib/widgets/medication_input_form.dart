import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:simple_meds/models/intake.dart';
import 'package:simple_meds/models/medication.dart';
import 'package:simple_meds/providers/intake_list_provider.dart';

class MedicationInputForm extends StatefulWidget {
  const MedicationInputForm({Key? key, this.intake}) : super(key: key);
  final Intake? intake;

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
    // isSomethingTrue ? doSomething : doSomethingElse;
    // isSomethingNull ?? ifYesThenDoSomethingAboutIt // (if not Null just assign the value)
    _intake = widget.intake ?? Intake(Medication("", 0), DateTime.now());
    medController.text = _intake.med.title;
    doseController.text = _intake.med.dosage.toString();
    dateController.text = _intake.dateTime.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String header = widget.intake != null  ? "Amend Medication Intake" : "Record Medication Intake";
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            header,
            style: TextStyle(fontSize: 20),
          ),
          TextField(
            decoration: InputDecoration(labelText: "Medication"),
            controller: medController,
            onChanged: (newText) {
              _intake.med.title = newText;
            },
          ),
          TextField(
              decoration: InputDecoration(labelText: "Dose"),
              controller: doseController,
              keyboardType: TextInputType.number,
              onChanged: (newText) {
                _intake.med.dosage = double.parse(newText);
              },
              inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))]),
          TextField(
            decoration: InputDecoration(labelText: "Date"),
            controller: dateController,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(child: Text("Save"),onPressed: () {
              if(widget.intake == null) {
                Provider.of<IntakeListProvider>(context, listen: false).add(
                    _intake);
              }
              else {
                Provider.of<IntakeListProvider>(context, listen: false).update();
              }
              Navigator.pop(context);
            },),
          )
        ],
      ),
    );
  }
}
