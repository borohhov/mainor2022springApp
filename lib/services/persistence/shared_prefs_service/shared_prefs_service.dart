import 'dart:convert';

import 'package:simple_meds/models/intake.dart';
import 'package:simple_meds/services/persistence/persistence_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService implements PersistenceService {
  SharedPreferences? prefs;

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Future<void> add(Intake intake) async {
    List<Intake> intakes = await getAllIntakes();
    intakes.add(intake);
    List<String> intakeStrings =
        intakes.map<String>((intake) => jsonEncode(intake.toJson())).toList();
    if (prefs == null) {
      await init();
    }
    prefs!.setStringList("Intakes", intakeStrings);
  }

  @override
  Future<List<Intake>> getAllIntakes() async {
    if (prefs == null) {
      await init();
    }
    List<String> intakeStrings = prefs!.getStringList("Intakes") ?? [];
    List<Intake> intakes = intakeStrings
        .map<Intake>((i) => Intake.fromJson(jsonDecode(i)))
        .toList();
    return intakes;
  }
}
