import 'package:simple_meds/models/intake.dart';
import 'package:simple_meds/services/persistence/persistence_service.dart';

import 'shared_prefs_service/shared_prefs_service.dart';

class PersistenceServiceImpl implements PersistenceService {
  PersistenceService persistence = SharedPreferencesService();
  @override
  Future<void> add(Intake intake) {
    return persistence.add(intake);
  }

  @override
  Future<List<Intake>> getAllIntakes() {
    return persistence.getAllIntakes();
  }

}