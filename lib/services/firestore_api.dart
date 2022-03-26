import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';

abstract class FirestoreApi<T> {
  Logger get log;

  /// The collection reference to a Firestore data.
  ///
  /// Must add implementation for passing in the data model.
  ///
  /// Creating a collection reference
  ///
  /// ```dart
  /// FirebaseFirestore.instance.collection('users')
  ///   .withConverter<User>(
  ///     fromFirestore: (snapshot, _) => User.fromJson(snapshot.data()!),
  ///     toFirestore: (model, _) => model.toJson(),
  ///   );
  /// ```
  ///
  /// Creating a sub-collection reference
  ///
  /// ```dart
  /// CollectionReference<UserNotification> _notificationsRef(
  ///   String documentId,
  /// ) {
  ///   return ref
  ///       .doc(documentId)
  ///       .collection('notifications')
  ///       .withConverter<UserNotification>(
  ///         fromFirestore: (snapshot, _) => UserNotification.fromJson(
  ///           snapshot.data()!..['id'] = snapshot.id,
  ///         ),
  ///         toFirestore: (model, _) => model.toJson(),
  ///       );
  /// }
  /// ```
  CollectionReference<T> get ref;

  String getNewDocId() {
    final uid = ref.doc().id;

    log.v('Generated uid "$uid"');

    return uid;
  }

  Future<List<T>> all({int limit = 9999}) async {
    log.v('limit value "$limit"');

    try {
      final doc = await ref.limit(limit).get();
      log.i(doc.toString());

      return doc.docs.map((e) => e.data()).toList();
    } catch (e) {
      rethrow;
    }
  }

  /// Parameter [whereNotIn] should only be a maximum of 10, otherwise
  /// it throws a Firestore query exception where it should not execed 10
  Future<List<T>> whereNotIn(List<String> whereNotIn) async {
    log.v('whereNotIn "$whereNotIn"');

    try {
      final doc = await ref.where('id', whereNotIn: whereNotIn).get();

      return doc.docs.map((e) => e.data()).toList();
    } catch (e) {
      rethrow;
    }
  }

  Stream<List<T>> subscribeAll({int? limit}) {
    log.v('limit value "$limit"');

    try {
      final snapshots = ref.limit(limit ?? 9999).snapshots();
      return snapshots
          .map((snapshot) => snapshot.docs.map((e) => e.data()).toList());
    } catch (e) {
      rethrow;
    }
  }

  Future<T?> find({required String documentId}) async {
    log.v('documentId value "$documentId"');

    if (documentId.isEmpty) {
      throw emptyFieldException();
    }

    try {
      final doc = await ref.doc(documentId).get();

      if (!doc.exists) {
        return null;
      }

      return doc.data()!;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> create({required T payload, String? documentId}) async {
    try {
      await ref.doc(documentId ?? getNewDocId()).set(payload);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> update({
    required String documentId,
    required T payload,
  }) async {
    log.v('documentId value "$documentId"');

    if (documentId.isEmpty) {
      throw emptyFieldException();
    }

    final options = SetOptions(merge: true);

    try {
      await ref.doc(documentId).set(payload, options);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> onlyUpdate({
    required String documentId,
    required Map<String, Object?> payload,
  }) async {
    log.v('documentId value "$documentId" | payload: $payload');

    if (documentId.isEmpty) {
      throw emptyFieldException();
    }

    try {
      await ref.doc(documentId).update(payload);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> delete({required String documentId}) async {
    log.v('documentId value "$documentId"');

    if (documentId.isEmpty) {
      throw emptyFieldException();
    }

    try {
      await ref.doc(documentId).delete();
    } catch (e) {
      rethrow;
    }
  }

  Stream<T?> subscribe({required String documentId}) {
    log.v('documentId value "$documentId"');

    if (documentId.isEmpty) {
      throw emptyFieldException();
    }

    try {
      return ref.doc(documentId).snapshots().map((s) => s.data());
    } catch (e) {
      rethrow;
    }
  }

  FirestoreApiException unknownException(Object e) {
    log.e(e);

    return FirestoreApiException(
      message: 'Unable to create a document due to unknown reason.',
      devDetails: 'Unable to create a document due to unknown reason.',
      prettyDetails: 'Unable to create a document due to unknown reason.',
    );
  }

  FirestoreApiException emptyFieldException({String field = 'documentId'}) {
    return FirestoreApiException(
      message: 'The $field is empty',
      prettyDetails: 'The $field must contain a value',
      devDetails: 'The $field must contain a value',
    );
  }
}

class FirestoreApiException implements Exception {
  final String message;
  final String devDetails;
  final String prettyDetails;

  FirestoreApiException({
    required this.message,
    required this.devDetails,
    required this.prettyDetails,
  });

  @override
  String toString() {
    return '''FirestoreApiException | $message 
    Dev Details: $devDetails
    Pretty Details: $prettyDetails''';
  }
}
