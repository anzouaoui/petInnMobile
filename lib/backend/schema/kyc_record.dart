import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class KycRecord extends FirestoreRecord {
  KycRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "documents" field.
  List<String>? _documents;
  List<String> get documents => _documents ?? const [];
  bool hasDocuments() => _documents != null;

  // "submittedAt" field.
  DateTime? _submittedAt;
  DateTime? get submittedAt => _submittedAt;
  bool hasSubmittedAt() => _submittedAt != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _status = snapshotData['status'] as String?;
    _documents = getDataList(snapshotData['documents']);
    _submittedAt = snapshotData['submittedAt'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('kyc')
          : FirebaseFirestore.instance.collectionGroup('kyc');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('kyc').doc(id);

  static Stream<KycRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => KycRecord.fromSnapshot(s));

  static Future<KycRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => KycRecord.fromSnapshot(s));

  static KycRecord fromSnapshot(DocumentSnapshot snapshot) => KycRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static KycRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      KycRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'KycRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is KycRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createKycRecordData({
  String? status,
  DateTime? submittedAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'status': status,
      'submittedAt': submittedAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class KycRecordDocumentEquality implements Equality<KycRecord> {
  const KycRecordDocumentEquality();

  @override
  bool equals(KycRecord? e1, KycRecord? e2) {
    const listEquality = ListEquality();
    return e1?.status == e2?.status &&
        listEquality.equals(e1?.documents, e2?.documents) &&
        e1?.submittedAt == e2?.submittedAt;
  }

  @override
  int hash(KycRecord? e) =>
      const ListEquality().hash([e?.status, e?.documents, e?.submittedAt]);

  @override
  bool isValidKey(Object? o) => o is KycRecord;
}
