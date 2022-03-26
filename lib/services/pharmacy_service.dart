import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:health/app/app.logger.dart';
import 'package:health/datamodels/pharmacy/pharmacy_model.dart';

import 'firestore_api.dart';

class PharamcyService extends FirestoreApi<Pharmacy> {
  @override
  get log => getLogger('StaffService');

  @override
  CollectionReference<Pharmacy> get ref => FirebaseFirestore.instance
      .collection('pharmaciesCollection')
      .withConverter<Pharmacy>(
        fromFirestore: (snapshot, _) => Pharmacy.fromJson(
          snapshot.data()!
            ..['id'] = snapshot.id
            ..['path'] = snapshot.reference.path,
        ),
        toFirestore: (model, _) => model.toJson(),
      );

  Future<List<Pharmacy>?> getAllPharmacy() async {
    try {
      final snapshot = await ref.get();

      final result =
          await snapshot.docs.map((pharmacy) => pharmacy.data()).toList();

      return result;
    } catch (e) {
      log.e('Something went wrong while getting a staffs $e');
      rethrow;
    }
  }
}
