import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PaymentRecord extends FirestoreRecord {
  PaymentRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  // "commission" field.
  int? _commission;
  int get commission => _commission ?? 0;
  bool hasCommission() => _commission != null;

  // "hostEarnings" field.
  int? _hostEarnings;
  int get hostEarnings => _hostEarnings ?? 0;
  bool hasHostEarnings() => _hostEarnings != null;

  // "paymentMethod" field.
  String? _paymentMethod;
  String get paymentMethod => _paymentMethod ?? '';
  bool hasPaymentMethod() => _paymentMethod != null;

  // "transactionId" field.
  String? _transactionId;
  String get transactionId => _transactionId ?? '';
  bool hasTransactionId() => _transactionId != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _amount = castToType<double>(snapshotData['amount']);
    _commission = castToType<int>(snapshotData['commission']);
    _hostEarnings = castToType<int>(snapshotData['hostEarnings']);
    _paymentMethod = snapshotData['paymentMethod'] as String?;
    _transactionId = snapshotData['transactionId'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('payment')
          : FirebaseFirestore.instance.collectionGroup('payment');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('payment').doc(id);

  static Stream<PaymentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PaymentRecord.fromSnapshot(s));

  static Future<PaymentRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PaymentRecord.fromSnapshot(s));

  static PaymentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PaymentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PaymentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PaymentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PaymentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PaymentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPaymentRecordData({
  double? amount,
  int? commission,
  int? hostEarnings,
  String? paymentMethod,
  String? transactionId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'amount': amount,
      'commission': commission,
      'hostEarnings': hostEarnings,
      'paymentMethod': paymentMethod,
      'transactionId': transactionId,
    }.withoutNulls,
  );

  return firestoreData;
}

class PaymentRecordDocumentEquality implements Equality<PaymentRecord> {
  const PaymentRecordDocumentEquality();

  @override
  bool equals(PaymentRecord? e1, PaymentRecord? e2) {
    return e1?.amount == e2?.amount &&
        e1?.commission == e2?.commission &&
        e1?.hostEarnings == e2?.hostEarnings &&
        e1?.paymentMethod == e2?.paymentMethod &&
        e1?.transactionId == e2?.transactionId;
  }

  @override
  int hash(PaymentRecord? e) => const ListEquality().hash([
        e?.amount,
        e?.commission,
        e?.hostEarnings,
        e?.paymentMethod,
        e?.transactionId
      ]);

  @override
  bool isValidKey(Object? o) => o is PaymentRecord;
}
