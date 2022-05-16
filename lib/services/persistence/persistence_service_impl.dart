import 'package:simple_meds/models/intake.dart';
import 'package:simple_meds/services/persistence/firebase_service/firebase_service.dart';
import 'package:simple_meds/services/persistence/persistence_service.dart';
import 'package:simple_meds/services/persistence/shared_prefs_service/shared_prefs_service.dart';

class PersistenceServiceImpl implements PersistenceService {
  PersistenceService persistence = FirebaseService();
  @override
  Future<void> add(Intake intake) {
    return persistence.add(intake);
  }

  @override
  Future<List<Intake>> getAllIntakes() {
    return persistence.getAllIntakes();
  }

}