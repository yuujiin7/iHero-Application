import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'memoralization_report_record.g.dart';

abstract class MemoralizationReportRecord
    implements
        Built<MemoralizationReportRecord, MemoralizationReportRecordBuilder> {
  static Serializer<MemoralizationReportRecord> get serializer =>
      _$memoralizationReportRecordSerializer;

  String? get fullName;

  DateTime? get dateOfDeath;

  @BuiltValueField(wireName: 'photo_url')
  BuiltList<String>? get photoUrl;

  @BuiltValueField(wireName: 'report_by')
  DocumentReference? get reportBy;

  @BuiltValueField(wireName: 'reported_at')
  DateTime? get reportedAt;

  bool? get isConfirmbySA;

  bool? get isDeclined;

  String? get reason;

  String? get isDeleted;

  @BuiltValueField(wireName: 'expiry_date')
  DateTime? get expiryDate;

  DocumentReference? get isSeen;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(MemoralizationReportRecordBuilder builder) =>
      builder
        ..fullName = ''
        ..photoUrl = ListBuilder()
        ..isConfirmbySA = false
        ..isDeclined = false
        ..reason = ''
        ..isDeleted = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('memoralization_report');

  static Stream<MemoralizationReportRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<MemoralizationReportRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  MemoralizationReportRecord._();
  factory MemoralizationReportRecord(
          [void Function(MemoralizationReportRecordBuilder) updates]) =
      _$MemoralizationReportRecord;

  static MemoralizationReportRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createMemoralizationReportRecordData({
  String? fullName,
  DateTime? dateOfDeath,
  DocumentReference? reportBy,
  DateTime? reportedAt,
  bool? isConfirmbySA,
  bool? isDeclined,
  String? reason,
  String? isDeleted,
  DateTime? expiryDate,
  DocumentReference? isSeen,
}) {
  final firestoreData = serializers.toFirestore(
    MemoralizationReportRecord.serializer,
    MemoralizationReportRecord(
      (m) => m
        ..fullName = fullName
        ..dateOfDeath = dateOfDeath
        ..photoUrl = null
        ..reportBy = reportBy
        ..reportedAt = reportedAt
        ..isConfirmbySA = isConfirmbySA
        ..isDeclined = isDeclined
        ..reason = reason
        ..isDeleted = isDeleted
        ..expiryDate = expiryDate
        ..isSeen = isSeen,
    ),
  );

  return firestoreData;
}
