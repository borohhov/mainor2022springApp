import 'package:flutter/material.dart';
import 'package:simple_meds/models/intake.dart';
import 'package:simple_meds/widgets/meds_list.dart';

class MedicationsListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MedicationsListScreenState();
  }
}

class _MedicationsListScreenState extends State<MedicationsListScreen> {
  List<Intake> intakes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: MedicationsListWidget(
        intakeList: intakes,
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.plus_one),
          onPressed: () async {
            dynamic intake =
                await Navigator.pushNamed(context, '/medication_input_screen');
            setState(
              () {
                intakes.add(intake as Intake);
              },
            );
          }),
    );
  }
}
