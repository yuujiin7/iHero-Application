import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'comments_and_rate_record.g.dart';

abstract class CommentsAndRateRecord
    implements Built<CommentsAndRateRecord, CommentsAndRateRecordBuilder> {
  static Serializer<CommentsAndRateRecord> get serializer =>
      _$commentsAndRateRecordSerializer;

  @BuiltValueField(wireName: 'created_by')
  DocumentReference? get createdBy;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  String? get comment;

  double? get rating;

  @BuiltValueField(wireName: 'post_type')
  DocumentReference? get postType;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(CommentsAndRateRecordBuilder builder) =>
      builder
        ..comment = ''
        ..rating = 0.0;

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('comments_and_rate')
          : FirebaseFirestore.instance.collectionGroup('comments_and_rate');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('comments_and_rate').doc();

  static Stream<CommentsAndRateRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<CommentsAndRateRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  CommentsAndRateRecord._();
  factory CommentsAndRateRecord(
          [void Function(CommentsAndRateRecordBuilder) updates]) =
      _$CommentsAndRateRecord;

  static CommentsAndRateRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createCommentsAndRateRecordData({
  DocumentReference? createdBy,
  DateTime? createdAt,
  String? comment,
  double? rating,
  DocumentReference? postType,
}) {
  final firestoreData = serializers.toFirestore(
    CommentsAndRateRecord.serializer,
    CommentsAndRateRecord(
      (c) => c
        ..createdBy = createdBy
        ..createdAt = createdAt
        ..comment = comment
        ..rating = rating
        ..postType = postType,
    ),
  );

  return firestoreData;
}
