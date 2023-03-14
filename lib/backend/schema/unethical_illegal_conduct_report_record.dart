import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'unethical_illegal_conduct_report_record.g.dart';

abstract class UnethicalIllegalConductReportRecord
    implements
        Built<UnethicalIllegalConductReportRecord,
            UnethicalIllegalConductReportRecordBuilder> {
  static Serializer<UnethicalIllegalConductReportRecord> get serializer =>
      _$unethicalIllegalConductReportRecordSerializer;

  String? get fullName;

  @BuiltValueField(wireName: 'report_behavior')
  BuiltList<String>? get reportBehavior;

  DateTime? get dateOfIncident;

  @BuiltValueField(wireName: 'photo_url')
  String? get photoUrl;

  @BuiltValueField(wireName: 'report_by')
  DocumentReference? get reportBy;

  @BuiltValueField(wireName: 'reported_at')
  DateTime? get reportedAt;

  bool? get isConfirmbySA;

  bool? get isDeclined;

  @BuiltValueField(wireName: 'expiry_date')
  DateTime? get expiryDate;

  bool? get isDeleted;

  String? get reason;

  bool? get isSeen;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(
          UnethicalIllegalConductReportRecordBuilder builder) =>
      builder
        ..fullName = ''
        ..reportBehavior = ListBuilder()
        ..photoUrl = ''
        ..isConfirmbySA = false
        ..isDeclined = false
        ..isDeleted = false
        ..reason = ''
        ..isSeen = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('unethical_illegal_conduct_report');

  static Stream<UnethicalIllegalConductReportRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UnethicalIllegalConductReportRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  UnethicalIllegalConductReportRecord._();
  factory UnethicalIllegalConductReportRecord(
          [void Function(UnethicalIllegalConductReportRecordBuilder) updates]) =
      _$UnethicalIllegalConductReportRecord;

  static UnethicalIllegalConductReportRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUnethicalIllegalConductReportRecordData({
  String? fullName,
  DateTime? dateOfIncident,
  String? photoUrl,
  DocumentReference? reportBy,
  DateTime? reportedAt,
  bool? isConfirmbySA,
  bool? isDeclined,
  DateTime? expiryDate,
  bool? isDeleted,
  String? reason,
  bool? isSeen,
}) {
  final firestoreData = serializers.toFirestore(
    UnethicalIllegalConductReportRecord.serializer,
    UnethicalIllegalConductReportRecord(
      (u) => u
        ..fullName = fullName
        ..reportBehavior = null
        ..dateOfIncident = dateOfIncident
        ..photoUrl = photoUrl
        ..reportBy = reportBy
        ..reportedAt = reportedAt
        ..isConfirmbySA = isConfirmbySA
        ..isDeclined = isDeclined
        ..expiryDate = expiryDate
        ..isDeleted = isDeleted
        ..reason = reason
        ..isSeen = isSeen,
    ),
  );

  return firestoreData;
}
