import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ParticuliersRecord extends FirestoreRecord {
  ParticuliersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "petPreferences" field.
  List<String>? _petPreferences;
  List<String> get petPreferences => _petPreferences ?? const [];
  bool hasPetPreferences() => _petPreferences != null;

  // "homeType" field.
  String? _homeType;
  String get homeType => _homeType ?? '';
  bool hasHomeType() => _homeType != null;

  // "kyc" field.
  DocumentReference? _kyc;
  DocumentReference? get kyc => _kyc;
  bool hasKyc() => _kyc != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _petPreferences = getDataList(snapshotData['petPreferences']);
    _homeType = snapshotData['homeType'] as String?;
    _kyc = snapshotData['kyc'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('particuliers')
          : FirebaseFirestore.instance.collectionGroup('particuliers');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('particuliers').doc(id);

  static Stream<ParticuliersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ParticuliersRecord.fromSnapshot(s));

  static Future<ParticuliersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ParticuliersRecord.fromSnapshot(s));

  static ParticuliersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ParticuliersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ParticuliersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ParticuliersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ParticuliersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ParticuliersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createParticuliersRecordData({
  String? homeType,
  DocumentReference? kyc,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'homeType': homeType,
      'kyc': kyc,
    }.withoutNulls,
  );

  return firestoreData;
}

class ParticuliersRecordDocumentEquality
    implements Equality<ParticuliersRecord> {
  const ParticuliersRecordDocumentEquality();

  @override
  bool equals(ParticuliersRecord? e1, ParticuliersRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.petPreferences, e2?.petPreferences) &&
        e1?.homeType == e2?.homeType &&
        e1?.kyc == e2?.kyc;
  }

  @override
  int hash(ParticuliersRecord? e) =>
      const ListEquality().hash([e?.petPreferences, e?.homeType, e?.kyc]);

  @override
  bool isValidKey(Object? o) => o is ParticuliersRecord;
}
