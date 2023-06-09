import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MemoralizationReportRecord extends FirestoreRecord {
  MemoralizationReportRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "fullName" field.
  String? _fullName;
  String get fullName => _fullName ?? '';
  bool hasFullName() => _fullName != null;

  // "dateOfDeath" field.
  DateTime? _dateOfDeath;
  DateTime? get dateOfDeath => _dateOfDeath;
  bool hasDateOfDeath() => _dateOfDeath != null;

  // "photo_url" field.
  List<String>? _photoUrl;
  List<String> get photoUrl => _photoUrl ?? const [];
  bool hasPhotoUrl() => _photoUrl != null;

  // "report_by" field.
  DocumentReference? _reportBy;
  DocumentReference? get reportBy => _reportBy;
  bool hasReportBy() => _reportBy != null;

  // "reported_at" field.
  DateTime? _reportedAt;
  DateTime? get reportedAt => _reportedAt;
  bool hasReportedAt() => _reportedAt != null;

  // "isConfirmbySA" field.
  bool? _isConfirmbySA;
  bool get isConfirmbySA => _isConfirmbySA ?? false;
  bool hasIsConfirmbySA() => _isConfirmbySA != null;

  // "isDeclined" field.
  bool? _isDeclined;
  bool get isDeclined => _isDeclined ?? false;
  bool hasIsDeclined() => _isDeclined != null;

  // "reason" field.
  String? _reason;
  String get reason => _reason ?? '';
  bool hasReason() => _reason != null;

  // "isDeleted" field.
  String? _isDeleted;
  String get isDeleted => _isDeleted ?? '';
  bool hasIsDeleted() => _isDeleted != null;

  // "expiry_date" field.
  DateTime? _expiryDate;
  DateTime? get expiryDate => _expiryDate;
  bool hasExpiryDate() => _expiryDate != null;

  // "isSeen" field.
  bool? _isSeen;
  bool get isSeen => _isSeen ?? false;
  bool hasIsSeen() => _isSeen != null;

  void _initializeFields() {
    _fullName = snapshotData['fullName'] as String?;
    _dateOfDeath = snapshotData['dateOfDeath'] as DateTime?;
    _photoUrl = getDataList(snapshotData['photo_url']);
    _reportBy = snapshotData['report_by'] as DocumentReference?;
    _reportedAt = snapshotData['reported_at'] as DateTime?;
    _isConfirmbySA = snapshotData['isConfirmbySA'] as bool?;
    _isDeclined = snapshotData['isDeclined'] as bool?;
    _reason = snapshotData['reason'] as String?;
    _isDeleted = snapshotData['isDeleted'] as String?;
    _expiryDate = snapshotData['expiry_date'] as DateTime?;
    _isSeen = snapshotData['isSeen'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('memoralization_report');

  static Stream<MemoralizationReportRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => MemoralizationReportRecord.fromSnapshot(s));

  static Future<MemoralizationReportRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => MemoralizationReportRecord.fromSnapshot(s));

  static MemoralizationReportRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MemoralizationReportRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MemoralizationReportRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MemoralizationReportRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MemoralizationReportRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MemoralizationReportRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
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
  bool? isSeen,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'fullName': fullName,
      'dateOfDeath': dateOfDeath,
      'report_by': reportBy,
      'reported_at': reportedAt,
      'isConfirmbySA': isConfirmbySA,
      'isDeclined': isDeclined,
      'reason': reason,
      'isDeleted': isDeleted,
      'expiry_date': expiryDate,
      'isSeen': isSeen,
    }.withoutNulls,
  );

  return firestoreData;
}
