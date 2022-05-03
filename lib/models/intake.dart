import 'package:flutter/cupertino.dart';
import 'package:simple_meds/models/medication.dart';

class Intake {
  String id = UniqueKey().toString();
  final Medication med;
  final DateTime dateTime;

  Intake(this.med, this.dateTime);

  Intake.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        med = Medication.fromJson(json['med']),
        dateTime = DateTime.parse(json['dateTime']);

  Map<String, dynamic> toJson() => {
    'id': id,
    'med': med.toJson(),
    'dateTime': dateTime.toString(),
  };
}