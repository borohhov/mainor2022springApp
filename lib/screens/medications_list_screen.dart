import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_meds/models/intake.dart';
import 'package:simple_meds/providers/intake_list_provider.dart';
import 'package:simple_meds/widgets/meds_list.dart';

class MedicationsListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<List<Intake>>(
        future: Provider.of<IntakeListProvider>(context).getAllIntakes(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done && snapshot.hasData){
            return MedicationsListWidget(
              intakeList: snapshot.data,
            );
          }
          return Center(child: Text("Loading..."),);
        }
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.plus_one),
          onPressed: () async {
            await Navigator.pushNamed(context, '/medication_input_screen');
          }),
    );
  }
}

