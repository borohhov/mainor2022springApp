import 'package:flutter/cupertino.dart';
import 'package:simple_meds/models/intake.dart';
import 'package:simple_meds/utils.dart';

class MedicationsListWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: getTestMeds().map((intake) => IntakeWidget(intake)).toList(),
    );
  }
}

class IntakeWidget extends StatelessWidget {
  final Intake intake;

  const IntakeWidget(this.intake, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(intake.med.title),
        Text(intake.med.dosage.toString()),
        Text(intake.dateTime.toString())
      ],
    );
  }
}
