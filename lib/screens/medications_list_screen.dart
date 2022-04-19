import 'package:flutter/material.dart';
import 'package:simple_meds/widgets/meds_list.dart';

class MedicationsListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: MedicationsListWidget(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.plus_one),
        onPressed: () {
          Navigator.pushNamed(context, '/medication_input_screen');
        },
      ),
    );
  }
}
