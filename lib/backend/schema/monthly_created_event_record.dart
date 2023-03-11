import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'monthly_created_event_record.g.dart';

abstract class MonthlyCreatedEventRecord
    implements
        Built<MonthlyCreatedEventRecord, MonthlyCreatedEventRecordBuilder> {
  static Serializer<MonthlyCreatedEventRecord> get serializer =>
      _$monthlyCreatedEventRecordSerializer;

  @BuiltValueField(wireName: 'January')
  int? get january;

  @BuiltValueField(wireName: 'February')
  int? get february;

  @BuiltValueField(wireName: 'March')
  int? get march;

  @BuiltValueField(wireName: 'April')
  int? get april;

  @BuiltValueField(wireName: 'May')
  int? get may;

  @BuiltValueField(wireName: 'June')
  int? get june;

  @BuiltValueField(wireName: 'July')
  int? get july;

  @BuiltValueField(wireName: 'August')
  int? get august;

  @BuiltValueField(wireName: 'September')
  int? get september;

  @BuiltValueField(wireName: 'October')
  int? get october;

  @BuiltValueField(wireName: 'November')
  int? get november;

  @BuiltValueField(wireName: 'December')
  int? get december;

  @BuiltValueField(wireName: 'created_date')
  DateTime? get createdDate;

  double? get total;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(MonthlyCreatedEventRecordBuilder builder) =>
      builder
        ..january = 0
        ..february = 0
        ..march = 0
        ..april = 0
        ..may = 0
        ..june = 0
        ..july = 0
        ..august = 0
        ..september = 0
        ..october = 0
        ..november = 0
        ..december = 0
        ..total = 0.0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('monthlyCreatedEvent');

  static Stream<MonthlyCreatedEventRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<MonthlyCreatedEventRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  MonthlyCreatedEventRecord._();
  factory MonthlyCreatedEventRecord(
          [void Function(MonthlyCreatedEventRecordBuilder) updates]) =
      _$MonthlyCreatedEventRecord;

  static MonthlyCreatedEventRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createMonthlyCreatedEventRecordData({
  int? january,
  int? february,
  int? march,
  int? april,
  int? may,
  int? june,
  int? july,
  int? august,
  int? september,
  int? october,
  int? november,
  int? december,
  DateTime? createdDate,
  double? total,
}) {
  final firestoreData = serializers.toFirestore(
    MonthlyCreatedEventRecord.serializer,
    MonthlyCreatedEventRecord(
      (m) => m
        ..january = january
        ..february = february
        ..march = march
        ..april = april
        ..may = may
        ..june = june
        ..july = july
        ..august = august
        ..september = september
        ..october = october
        ..november = november
        ..december = december
        ..createdDate = createdDate
        ..total = total,
    ),
  );

  return firestoreData;
}
