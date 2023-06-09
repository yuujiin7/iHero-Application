import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UnethicalIllegalConductReportRecord extends FirestoreRecord {
  UnethicalIllegalConductReportRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "fullName" field.
  String? _fullName;
  String get fullName => _fullName ?? '';
  bool hasFullName() => _fullName != null;

  // "report_behavior" field.
  List<String>? _reportBehavior;
  List<String> get reportBehavior => _reportBehavior ?? const [];
  bool hasReportBehavior() => _reportBehavior != null;

  // "dateOfIncident" field.
  DateTime? _dateOfIncident;
  DateTime? get dateOfIncident => _dateOfIncident;
  bool hasDateOfIncident() => _dateOfIncident != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
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

  // "expiry_date" field.
  DateTime? _expiryDate;
  DateTime? get expiryDate => _expiryDate;
  bool hasExpiryDate() => _expiryDate != null;

  // "isDeleted" field.
  bool? _isDeleted;
  bool get isDeleted => _isDeleted ?? false;
  bool hasIsDeleted() => _isDeleted != null;

  // "reason" field.
  String? _reason;
  String get reason => _reason ?? '';
  bool hasReason() => _reason != null;

  // "isSeen" field.
  bool? _isSeen;
  bool get isSeen => _isSeen ?? false;
  bool hasIsSeen() => _isSeen != null;

  void _initializeFields() {
    _fullName = snapshotData['fullName'] as String?;
    _reportBehavior = getDataList(snapshotData['report_behavior']);
    _dateOfIncident = snapshotData['dateOfIncident'] as DateTime?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _reportBy = snapshotData['report_by'] as DocumentReference?;
    _reportedAt = snapshotData['reported_at'] as DateTime?;
    _isConfirmbySA = snapshotData['isConfirmbySA'] as bool?;
    _isDeclined = snapshotData['isDeclined'] as bool?;
    _expiryDate = snapshotData['expiry_date'] as DateTime?;
    _isDeleted = snapshotData['isDeleted'] as bool?;
    _reason = snapshotData['reason'] as String?;
    _isSeen = snapshotData['isSeen'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('unethical_illegal_conduct_report');

  static Stream<UnethicalIllegalConductReportRecord> getDocument(
          DocumentReference ref) =>
      ref
          .snapshots()
          .map((s) => UnethicalIllegalConductReportRecord.fromSnapshot(s));

  static Future<UnethicalIllegalConductReportRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref
          .get()
          .then((s) => UnethicalIllegalConductReportRecord.fromSnapshot(s));

  static UnethicalIllegalConductReportRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      UnethicalIllegalConductReportRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UnethicalIllegalConductReportRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UnethicalIllegalConductReportRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UnethicalIllegalConductReportRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UnethicalIllegalConductReportRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
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
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'fullName': fullName,
      'dateOfIncident': dateOfIncident,
      'photo_url': photoUrl,
      'report_by': reportBy,
      'reported_at': reportedAt,
      'isConfirmbySA': isConfirmbySA,
      'isDeclined': isDeclined,
      'expiry_date': expiryDate,
      'isDeleted': isDeleted,
      'reason': reason,
      'isSeen': isSeen,
    }.withoutNulls,
  );

  return firestoreData;
}
