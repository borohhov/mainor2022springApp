import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:simple_meds/models/intake.dart';

import '../../../firebase_options.dart';
import '../persistence_service.dart';

class FirebaseService implements PersistenceService {
  late FirebaseFirestore db;

  Future<void> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    db = FirebaseFirestore.instance;
  }

  @override
  Future<void> add(Intake intake) async {
    await init();
    db.collection("intakes").add(intake.toJson());
  }

  @override
  Future<List<Intake>> getAllIntakes() async {
    await init();
    QuerySnapshot snapshot = await db.collection("intakes").get();
    List<Intake> intakes = snapshot.docs
        .map<Intake>(
            (doc) => Intake.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
    return intakes;
  }
}
