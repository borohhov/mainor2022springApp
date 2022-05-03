import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:simple_meds/models/intake.dart';
import 'package:simple_meds/services/persistence/persistence_service.dart';
import 'package:simple_meds/services/persistence/persistence_service_impl.dart';

class IntakeListProvider extends ChangeNotifier implements PersistenceService {
  PersistenceService persistence = PersistenceServiceImpl();

  @override
  Future<void> add(Intake intake) async {
    persistence.add(intake);
    notifyListeners();
  }

  void update() {
    notifyListeners();
  }

  @override
  Future<List<Intake>> getAllIntakes() async {
    return UnmodifiableListView(await persistence.getAllIntakes());
  }
}