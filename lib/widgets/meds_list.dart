import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:simple_meds/models/intake.dart';
import 'package:simple_meds/utils.dart';

class MedicationsListWidget extends StatelessWidget {
  final List<Intake>? intakeList;

  const MedicationsListWidget({Key? key, this.intakeList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if(intakeList == null || intakeList!.isEmpty) {
      return Center(child: Text("No history found, add some meds."),);
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: intakeList!.map((intake) => IntakeWidget(intake)).toList(),
      ),
    );
  }
}

class IntakeWidget extends StatelessWidget {
  final Intake intake;

  const IntakeWidget(this.intake, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () async {
      await Navigator.pushNamed(context, '/medication_input_screen',arguments: intake);
    },
      child: Card(
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
      ),
    );
  }
}
