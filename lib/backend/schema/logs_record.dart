import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LogsRecord extends FirestoreRecord {
  LogsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "Action" field.
  String? _action;
  String get action => _action ?? '';
  bool hasAction() => _action != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "FileUrl" field.
  String? _fileUrl;
  String get fileUrl => _fileUrl ?? '';
  bool hasFileUrl() => _fileUrl != null;

  // "eventRef" field.
  DocumentReference? _eventRef;
  DocumentReference? get eventRef => _eventRef;
  bool hasEventRef() => _eventRef != null;

  // "announcementRef" field.
  DocumentReference? _announcementRef;
  DocumentReference? get announcementRef => _announcementRef;
  bool hasAnnouncementRef() => _announcementRef != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _date = snapshotData['Date'] as DateTime?;
    _action = snapshotData['Action'] as String?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _fileUrl = snapshotData['FileUrl'] as String?;
    _eventRef = snapshotData['eventRef'] as DocumentReference?;
    _announcementRef = snapshotData['announcementRef'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('logs')
          : FirebaseFirestore.instance.collectionGroup('logs');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('logs').doc();

  static Stream<LogsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LogsRecord.fromSnapshot(s));

  static Future<LogsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LogsRecord.fromSnapshot(s));

  static LogsRecord fromSnapshot(DocumentSnapshot snapshot) => LogsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LogsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LogsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LogsRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createLogsRecordData({
  DateTime? date,
  String? action,
  DocumentReference? userRef,
  String? fileUrl,
  DocumentReference? eventRef,
  DocumentReference? announcementRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Date': date,
      'Action': action,
      'userRef': userRef,
      'FileUrl': fileUrl,
      'eventRef': eventRef,
      'announcementRef': announcementRef,
    }.withoutNulls,
  );

  return firestoreData;
}
