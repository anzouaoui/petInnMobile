import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EntrepriseRecord extends FirestoreRecord {
  EntrepriseRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "businessName" field.
  String? _businessName;
  String get businessName => _businessName ?? '';
  bool hasBusinessName() => _businessName != null;

  // "businessSIRET" field.
  int? _businessSIRET;
  int get businessSIRET => _businessSIRET ?? 0;
  bool hasBusinessSIRET() => _businessSIRET != null;

  // "legalDocs" field.
  List<String>? _legalDocs;
  List<String> get legalDocs => _legalDocs ?? const [];
  bool hasLegalDocs() => _legalDocs != null;

  // "kyc" field.
  DocumentReference? _kyc;
  DocumentReference? get kyc => _kyc;
  bool hasKyc() => _kyc != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _businessName = snapshotData['businessName'] as String?;
    _businessSIRET = castToType<int>(snapshotData['businessSIRET']);
    _legalDocs = getDataList(snapshotData['legalDocs']);
    _kyc = snapshotData['kyc'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('entreprise')
          : FirebaseFirestore.instance.collectionGroup('entreprise');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('entreprise').doc(id);

  static Stream<EntrepriseRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EntrepriseRecord.fromSnapshot(s));

  static Future<EntrepriseRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EntrepriseRecord.fromSnapshot(s));

  static EntrepriseRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EntrepriseRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EntrepriseRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EntrepriseRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EntrepriseRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EntrepriseRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEntrepriseRecordData({
  String? businessName,
  int? businessSIRET,
  DocumentReference? kyc,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'businessName': businessName,
      'businessSIRET': businessSIRET,
      'kyc': kyc,
    }.withoutNulls,
  );

  return firestoreData;
}

class EntrepriseRecordDocumentEquality implements Equality<EntrepriseRecord> {
  const EntrepriseRecordDocumentEquality();

  @override
  bool equals(EntrepriseRecord? e1, EntrepriseRecord? e2) {
    const listEquality = ListEquality();
    return e1?.businessName == e2?.businessName &&
        e1?.businessSIRET == e2?.businessSIRET &&
        listEquality.equals(e1?.legalDocs, e2?.legalDocs) &&
        e1?.kyc == e2?.kyc;
  }

  @override
  int hash(EntrepriseRecord? e) => const ListEquality()
      .hash([e?.businessName, e?.businessSIRET, e?.legalDocs, e?.kyc]);

  @override
  bool isValidKey(Object? o) => o is EntrepriseRecord;
}
