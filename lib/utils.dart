
import 'package:simple_meds/models/intake.dart';
import 'package:simple_meds/models/medication.dart';

List<Intake> getTestMeds(){
  List<Intake> meds = [];
  meds.add(Intake(Medication("Aspirin", 400), DateTime.now()));
  meds.add(Intake(Medication("Ibuprofen", 200), DateTime(2022, 2, 12)));
  return meds;
}