import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:simple_meds/models/intake.dart';
import 'package:simple_meds/services/persistence/persistence_service.dart';
import 'package:simple_meds/services/persistence/persistence_service_impl.dart';

class IntakeListProvider extends ChangeNotifier {
  PersistenceServiceImpl persistence = PersistenceServiceImpl();

  UnmodifiableListView<Intake> get intakes => UnmodifiableListView(persistence.getAllIntakes());

  void add(Intake intake) {
    persistence.add(intake);
    notifyListeners();
  }

  void update() {
    notifyListeners();
  }
}