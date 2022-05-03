import 'package:simple_meds/models/intake.dart';

abstract class PersistenceService {
  Future<void> add(Intake intake);

  Future<List<Intake>> getAllIntakes();
}
