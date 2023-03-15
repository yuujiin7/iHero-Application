import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'false_information_report_record.g.dart';

abstract class FalseInformationReportRecord
    implements
        Built<FalseInformationReportRecord,
            FalseInformationReportRecordBuilder> {
  static Serializer<FalseInformationReportRecord> get serializer =>
      _$falseInformationReportRecordSerializer;

  String? get fullName;

  String? get email;

  String? get reportDetail;

  @BuiltValueField(wireName: 'photo_url')
  String? get photoUrl;

  @BuiltValueField(wireName: 'report_by')
  DocumentReference? get reportBy;

  @BuiltValueField(wireName: 'reported_at')
  DateTime? get reportedAt;

  bool? get isConfirmbySA;

  bool? get isDeclined;

  String? get reason;

  bool? get isDeleted;

  @BuiltValueField(wireName: 'expiry_date')
  DateTime? get expiryDate;

  bool? get isSeen;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(FalseInformationReportRecordBuilder builder) =>
      builder
        ..fullName = ''
        ..email = ''
        ..reportDetail = ''
        ..photoUrl = ''
        ..isConfirmbySA = false
        ..isDeclined = false
        ..reason = ''
        ..isDeleted = false
        ..isSeen = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('false_information_report');

  static Stream<FalseInformationReportRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<FalseInformationReportRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  FalseInformationReportRecord._();
  factory FalseInformationReportRecord(
          [void Function(FalseInformationReportRecordBuilder) updates]) =
      _$FalseInformationReportRecord;

  static FalseInformationReportRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createFalseInformationReportRecordData({
  String? fullName,
  String? email,
  String? reportDetail,
  String? photoUrl,
  DocumentReference? reportBy,
  DateTime? reportedAt,
  bool? isConfirmbySA,
  bool? isDeclined,
  String? reason,
  bool? isDeleted,
  DateTime? expiryDate,
  bool? isSeen,
}) {
  final firestoreData = serializers.toFirestore(
    FalseInformationReportRecord.serializer,
    FalseInformationReportRecord(
      (f) => f
        ..fullName = fullName
        ..email = email
        ..reportDetail = reportDetail
        ..photoUrl = photoUrl
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
