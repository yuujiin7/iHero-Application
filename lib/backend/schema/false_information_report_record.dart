import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FalseInformationReportRecord extends FirestoreRecord {
  FalseInformationReportRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "fullName" field.
  String? _fullName;
  String get fullName => _fullName ?? '';
  bool hasFullName() => _fullName != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "reportDetail" field.
  String? _reportDetail;
  String get reportDetail => _reportDetail ?? '';
  bool hasReportDetail() => _reportDetail != null;

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

  // "reason" field.
  String? _reason;
  String get reason => _reason ?? '';
  bool hasReason() => _reason != null;

  // "isDeleted" field.
  bool? _isDeleted;
  bool get isDeleted => _isDeleted ?? false;
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
    _email = snapshotData['email'] as String?;
    _reportDetail = snapshotData['reportDetail'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _reportBy = snapshotData['report_by'] as DocumentReference?;
    _reportedAt = snapshotData['reported_at'] as DateTime?;
    _isConfirmbySA = snapshotData['isConfirmbySA'] as bool?;
    _isDeclined = snapshotData['isDeclined'] as bool?;
    _reason = snapshotData['reason'] as String?;
    _isDeleted = snapshotData['isDeleted'] as bool?;
    _expiryDate = snapshotData['expiry_date'] as DateTime?;
    _isSeen = snapshotData['isSeen'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('false_information_report');

  static Stream<FalseInformationReportRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => FalseInformationReportRecord.fromSnapshot(s));

  static Future<FalseInformationReportRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => FalseInformationReportRecord.fromSnapshot(s));

  static FalseInformationReportRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FalseInformationReportRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FalseInformationReportRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FalseInformationReportRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FalseInformationReportRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FalseInformationReportRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
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
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'fullName': fullName,
      'email': email,
      'reportDetail': reportDetail,
      'photo_url': photoUrl,
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
