import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:simple_meds/models/intake.dart';

class IntakeListProvider extends ChangeNotifier {
  final List<Intake> _intakes = [];

  UnmodifiableListView<Intake> get intakes => UnmodifiableListView(_intakes);

  void add(Intake intake) {
    _intakes.add(intake);
    notifyListeners();
  }

  void update() {
    notifyListeners();
  }
}