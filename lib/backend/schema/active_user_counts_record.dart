import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'active_user_counts_record.g.dart';

abstract class ActiveUserCountsRecord
    implements Built<ActiveUserCountsRecord, ActiveUserCountsRecordBuilder> {
  static Serializer<ActiveUserCountsRecord> get serializer =>
      _$activeUserCountsRecordSerializer;

  int? get date;

  int? get count;

  @BuiltValueField(wireName: 'week_start')
  DateTime? get weekStart;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ActiveUserCountsRecordBuilder builder) =>
      builder
        ..date = 0
        ..count = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('activeUserCounts');

  static Stream<ActiveUserCountsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ActiveUserCountsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ActiveUserCountsRecord._();
  factory ActiveUserCountsRecord(
          [void Function(ActiveUserCountsRecordBuilder) updates]) =
      _$ActiveUserCountsRecord;

  static ActiveUserCountsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createActiveUserCountsRecordData({
  int? date,
  int? count,
  DateTime? weekStart,
}) {
  final firestoreData = serializers.toFirestore(
    ActiveUserCountsRecord.serializer,
    ActiveUserCountsRecord(
      (a) => a
        ..date = date
        ..count = count
        ..weekStart = weekStart,
    ),
  );

  return firestoreData;
}
