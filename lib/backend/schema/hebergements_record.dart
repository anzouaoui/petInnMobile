import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HebergementsRecord extends FirestoreRecord {
  HebergementsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "hostId" field.
  DocumentReference? _hostId;
  DocumentReference? get hostId => _hostId;
  bool hasHostId() => _hostId != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "photos" field.
  List<String>? _photos;
  List<String> get photos => _photos ?? const [];
  bool hasPhotos() => _photos != null;

  // "pricePerNight" field.
  double? _pricePerNight;
  double get pricePerNight => _pricePerNight ?? 0.0;
  bool hasPricePerNight() => _pricePerNight != null;

  // "petFriendly" field.
  bool? _petFriendly;
  bool get petFriendly => _petFriendly ?? false;
  bool hasPetFriendly() => _petFriendly != null;

  // "services" field.
  List<String>? _services;
  List<String> get services => _services ?? const [];
  bool hasServices() => _services != null;

  void _initializeFields() {
    _hostId = snapshotData['hostId'] as DocumentReference?;
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _location = snapshotData['location'] as LatLng?;
    _photos = getDataList(snapshotData['photos']);
    _pricePerNight = castToType<double>(snapshotData['pricePerNight']);
    _petFriendly = snapshotData['petFriendly'] as bool?;
    _services = getDataList(snapshotData['services']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('hebergements');

  static Stream<HebergementsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HebergementsRecord.fromSnapshot(s));

  static Future<HebergementsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HebergementsRecord.fromSnapshot(s));

  static HebergementsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HebergementsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HebergementsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HebergementsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HebergementsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HebergementsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHebergementsRecordData({
  DocumentReference? hostId,
  String? title,
  String? description,
  LatLng? location,
  double? pricePerNight,
  bool? petFriendly,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'hostId': hostId,
      'title': title,
      'description': description,
      'location': location,
      'pricePerNight': pricePerNight,
      'petFriendly': petFriendly,
    }.withoutNulls,
  );

  return firestoreData;
}

class HebergementsRecordDocumentEquality
    implements Equality<HebergementsRecord> {
  const HebergementsRecordDocumentEquality();

  @override
  bool equals(HebergementsRecord? e1, HebergementsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.hostId == e2?.hostId &&
        e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.location == e2?.location &&
        listEquality.equals(e1?.photos, e2?.photos) &&
        e1?.pricePerNight == e2?.pricePerNight &&
        e1?.petFriendly == e2?.petFriendly &&
        listEquality.equals(e1?.services, e2?.services);
  }

  @override
  int hash(HebergementsRecord? e) => const ListEquality().hash([
        e?.hostId,
        e?.title,
        e?.description,
        e?.location,
        e?.photos,
        e?.pricePerNight,
        e?.petFriendly,
        e?.services
      ]);

  @override
  bool isValidKey(Object? o) => o is HebergementsRecord;
}
