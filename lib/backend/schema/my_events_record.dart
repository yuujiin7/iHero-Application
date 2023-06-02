import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MyEventsRecord extends FirestoreRecord {
  MyEventsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "dateJoined" field.
  DateTime? _dateJoined;
  DateTime? get dateJoined => _dateJoined;
  bool hasDateJoined() => _dateJoined != null;

  // "eventReference" field.
  DocumentReference? _eventReference;
  DocumentReference? get eventReference => _eventReference;
  bool hasEventReference() => _eventReference != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "dateCreated" field.
  DateTime? _dateCreated;
  DateTime? get dateCreated => _dateCreated;
  bool hasDateCreated() => _dateCreated != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _dateJoined = snapshotData['dateJoined'] as DateTime?;
    _eventReference = snapshotData['eventReference'] as DocumentReference?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _dateCreated = snapshotData['dateCreated'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('myEvents')
          : FirebaseFirestore.instance.collectionGroup('myEvents');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('myEvents').doc();

  static Stream<MyEventsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MyEventsRecord.fromSnapshot(s));

  static Future<MyEventsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MyEventsRecord.fromSnapshot(s));

  static MyEventsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MyEventsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MyEventsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MyEventsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MyEventsRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createMyEventsRecordData({
  DateTime? dateJoined,
  DocumentReference? eventReference,
  DocumentReference? userRef,
  DateTime? dateCreated,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'dateJoined': dateJoined,
      'eventReference': eventReference,
      'userRef': userRef,
      'dateCreated': dateCreated,
    }.withoutNulls,
  );

  return firestoreData;
}
