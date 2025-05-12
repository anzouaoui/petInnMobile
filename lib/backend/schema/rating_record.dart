import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RatingRecord extends FirestoreRecord {
  RatingRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "average" field.
  double? _average;
  double get average => _average ?? 0.0;
  bool hasAverage() => _average != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _average = castToType<double>(snapshotData['average']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('rating')
          : FirebaseFirestore.instance.collectionGroup('rating');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('rating').doc(id);

  static Stream<RatingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RatingRecord.fromSnapshot(s));

  static Future<RatingRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RatingRecord.fromSnapshot(s));

  static RatingRecord fromSnapshot(DocumentSnapshot snapshot) => RatingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RatingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RatingRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RatingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RatingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRatingRecordData({
  double? average,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'average': average,
    }.withoutNulls,
  );

  return firestoreData;
}

class RatingRecordDocumentEquality implements Equality<RatingRecord> {
  const RatingRecordDocumentEquality();

  @override
  bool equals(RatingRecord? e1, RatingRecord? e2) {
    return e1?.average == e2?.average;
  }

  @override
  int hash(RatingRecord? e) => const ListEquality().hash([e?.average]);

  @override
  bool isValidKey(Object? o) => o is RatingRecord;
}
