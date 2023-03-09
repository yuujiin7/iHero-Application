import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'announcement_record.g.dart';

abstract class AnnouncementRecord
    implements Built<AnnouncementRecord, AnnouncementRecordBuilder> {
  static Serializer<AnnouncementRecord> get serializer =>
      _$announcementRecordSerializer;

  String? get title;

  String? get body;

  @BuiltValueField(wireName: 'photo_url')
  String? get photoUrl;

  @BuiltValueField(wireName: 'created_time')
  DateTime? get createdTime;

  @BuiltValueField(wireName: 'created_by')
  DocumentReference? get createdBy;

  @BuiltValueField(wireName: 'liked_by')
  BuiltList<DocumentReference>? get likedBy;

  @BuiltValueField(wireName: 'expiry_date')
  DateTime? get expiryDate;

  bool? get isDeleted;

  bool? get isConfirmbySA;

  String? get reason;

  bool? get isDeclined;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(AnnouncementRecordBuilder builder) => builder
    ..title = ''
    ..body = ''
    ..photoUrl = ''
    ..likedBy = ListBuilder()
    ..isDeleted = false
    ..isConfirmbySA = false
    ..reason = ''
    ..isDeclined = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('announcement');

  static Stream<AnnouncementRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<AnnouncementRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  AnnouncementRecord._();
  factory AnnouncementRecord(
          [void Function(AnnouncementRecordBuilder) updates]) =
      _$AnnouncementRecord;

  static AnnouncementRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createAnnouncementRecordData({
  String? title,
  String? body,
  String? photoUrl,
  DateTime? createdTime,
  DocumentReference? createdBy,
  DateTime? expiryDate,
  bool? isDeleted,
  bool? isConfirmbySA,
  String? reason,
  bool? isDeclined,
}) {
  final firestoreData = serializers.toFirestore(
    AnnouncementRecord.serializer,
    AnnouncementRecord(
      (a) => a
        ..title = title
        ..body = body
        ..photoUrl = photoUrl
        ..createdTime = createdTime
        ..createdBy = createdBy
        ..likedBy = null
        ..expiryDate = expiryDate
        ..isDeleted = isDeleted
        ..isConfirmbySA = isConfirmbySA
        ..reason = reason
        ..isDeclined = isDeclined,
    ),
  );

  return firestoreData;
}
