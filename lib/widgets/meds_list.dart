import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:simple_meds/models/intake.dart';
import 'package:simple_meds/utils.dart';

class MedicationsListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: getTestMeds().map((intake) => IntakeWidget(intake)).toList(),
      ),
    );
  }
}

class IntakeWidget extends StatelessWidget {
  final Intake intake;

  const IntakeWidget(this.intake, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.medication_outlined),
            title: Text(
                intake.med.title + " | " + intake.med.dosage.toString() + ' mg',
            style: const TextStyle(fontSize: 20),),
            subtitle: Text(DateFormat('yyyy/MM/dd hh:mm').format(intake.dateTime)),
          ),
        ],
      ),
    );
  }
}
