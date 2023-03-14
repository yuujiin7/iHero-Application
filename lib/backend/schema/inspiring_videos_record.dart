import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'inspiring_videos_record.g.dart';

abstract class InspiringVideosRecord
    implements Built<InspiringVideosRecord, InspiringVideosRecordBuilder> {
  static Serializer<InspiringVideosRecord> get serializer =>
      _$inspiringVideosRecordSerializer;

  String? get url;

  String? get youtube;

  String? get title;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(InspiringVideosRecordBuilder builder) =>
      builder
        ..url = ''
        ..youtube = ''
        ..title = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('InspiringVideos');

  static Stream<InspiringVideosRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<InspiringVideosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  InspiringVideosRecord._();
  factory InspiringVideosRecord(
          [void Function(InspiringVideosRecordBuilder) updates]) =
      _$InspiringVideosRecord;

  static InspiringVideosRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createInspiringVideosRecordData({
  String? url,
  String? youtube,
  String? title,
}) {
  final firestoreData = serializers.toFirestore(
    InspiringVideosRecord.serializer,
    InspiringVideosRecord(
      (i) => i
        ..url = url
        ..youtube = youtube
        ..title = title,
    ),
  );

  return firestoreData;
}
