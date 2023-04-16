import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'logs_record.g.dart';

abstract class LogsRecord implements Built<LogsRecord, LogsRecordBuilder> {
  static Serializer<LogsRecord> get serializer => _$logsRecordSerializer;

  @BuiltValueField(wireName: 'Date')
  DateTime? get date;

  @BuiltValueField(wireName: 'Action')
  String? get action;

  DocumentReference? get userRef;

  @BuiltValueField(wireName: 'FileUrl')
  String? get fileUrl;

  DocumentReference? get eventRef;

  DocumentReference? get announcementRef;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(LogsRecordBuilder builder) => builder
    ..action = ''
    ..fileUrl = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('logs')
          : FirebaseFirestore.instance.collectionGroup('logs');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('logs').doc();

  static Stream<LogsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<LogsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  LogsRecord._();
  factory LogsRecord([void Function(LogsRecordBuilder) updates]) = _$LogsRecord;

  static LogsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createLogsRecordData({
  DateTime? date,
  String? action,
  DocumentReference? userRef,
  String? fileUrl,
  DocumentReference? eventRef,
  DocumentReference? announcementRef,
}) {
  final firestoreData = serializers.toFirestore(
    LogsRecord.serializer,
    LogsRecord(
      (l) => l
        ..date = date
        ..action = action
        ..userRef = userRef
        ..fileUrl = fileUrl
        ..eventRef = eventRef
        ..announcementRef = announcementRef,
    ),
  );

  return firestoreData;
}
