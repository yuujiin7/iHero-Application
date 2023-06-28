import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MonthlyCreatedEventRecord extends FirestoreRecord {
  MonthlyCreatedEventRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "January" field.
  int? _january;
  int get january => _january ?? 0;
  bool hasJanuary() => _january != null;

  // "February" field.
  int? _february;
  int get february => _february ?? 0;
  bool hasFebruary() => _february != null;

  // "March" field.
  int? _march;
  int get march => _march ?? 0;
  bool hasMarch() => _march != null;

  // "April" field.
  int? _april;
  int get april => _april ?? 0;
  bool hasApril() => _april != null;

  // "May" field.
  int? _may;
  int get may => _may ?? 0;
  bool hasMay() => _may != null;

  // "June" field.
  int? _june;
  int get june => _june ?? 0;
  bool hasJune() => _june != null;

  // "July" field.
  int? _july;
  int get july => _july ?? 0;
  bool hasJuly() => _july != null;

  // "August" field.
  int? _august;
  int get august => _august ?? 0;
  bool hasAugust() => _august != null;

  // "September" field.
  int? _september;
  int get september => _september ?? 0;
  bool hasSeptember() => _september != null;

  // "October" field.
  int? _october;
  int get october => _october ?? 0;
  bool hasOctober() => _october != null;

  // "November" field.
  int? _november;
  int get november => _november ?? 0;
  bool hasNovember() => _november != null;

  // "December" field.
  int? _december;
  int get december => _december ?? 0;
  bool hasDecember() => _december != null;

  // "created_date" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  // "total" field.
  double? _total;
  double get total => _total ?? 0.0;
  bool hasTotal() => _total != null;

  void _initializeFields() {
    _january = castToType<int>(snapshotData['January']);
    _february = castToType<int>(snapshotData['February']);
    _march = castToType<int>(snapshotData['March']);
    _april = castToType<int>(snapshotData['April']);
    _may = castToType<int>(snapshotData['May']);
    _june = castToType<int>(snapshotData['June']);
    _july = castToType<int>(snapshotData['July']);
    _august = castToType<int>(snapshotData['August']);
    _september = castToType<int>(snapshotData['September']);
    _october = castToType<int>(snapshotData['October']);
    _november = castToType<int>(snapshotData['November']);
    _december = castToType<int>(snapshotData['December']);
    _createdDate = snapshotData['created_date'] as DateTime?;
    _total = castToType<double>(snapshotData['total']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('monthlyCreatedEvent');

  static Stream<MonthlyCreatedEventRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MonthlyCreatedEventRecord.fromSnapshot(s));

  static Future<MonthlyCreatedEventRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => MonthlyCreatedEventRecord.fromSnapshot(s));

  static MonthlyCreatedEventRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MonthlyCreatedEventRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MonthlyCreatedEventRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MonthlyCreatedEventRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MonthlyCreatedEventRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MonthlyCreatedEventRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
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
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'January': january,
      'February': february,
      'March': march,
      'April': april,
      'May': may,
      'June': june,
      'July': july,
      'August': august,
      'September': september,
      'October': october,
      'November': november,
      'December': december,
      'created_date': createdDate,
      'total': total,
    }.withoutNulls,
  );

  return firestoreData;
}
