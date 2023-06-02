import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AnnouncementRecord extends FirestoreRecord {
  AnnouncementRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "body" field.
  String? _body;
  String get body => _body ?? '';
  bool hasBody() => _body != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "created_by" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "liked_by" field.
  List<DocumentReference>? _likedBy;
  List<DocumentReference> get likedBy => _likedBy ?? const [];
  bool hasLikedBy() => _likedBy != null;

  // "expiry_date" field.
  DateTime? _expiryDate;
  DateTime? get expiryDate => _expiryDate;
  bool hasExpiryDate() => _expiryDate != null;

  // "isDeleted" field.
  bool? _isDeleted;
  bool get isDeleted => _isDeleted ?? false;
  bool hasIsDeleted() => _isDeleted != null;

  // "isConfirmbySA" field.
  bool? _isConfirmbySA;
  bool get isConfirmbySA => _isConfirmbySA ?? false;
  bool hasIsConfirmbySA() => _isConfirmbySA != null;

  // "reason" field.
  String? _reason;
  String get reason => _reason ?? '';
  bool hasReason() => _reason != null;

  // "isDeclined" field.
  bool? _isDeclined;
  bool get isDeclined => _isDeclined ?? false;
  bool hasIsDeclined() => _isDeclined != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _body = snapshotData['body'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _createdBy = snapshotData['created_by'] as DocumentReference?;
    _likedBy = getDataList(snapshotData['liked_by']);
    _expiryDate = snapshotData['expiry_date'] as DateTime?;
    _isDeleted = snapshotData['isDeleted'] as bool?;
    _isConfirmbySA = snapshotData['isConfirmbySA'] as bool?;
    _reason = snapshotData['reason'] as String?;
    _isDeclined = snapshotData['isDeclined'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('announcement');

  static Stream<AnnouncementRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AnnouncementRecord.fromSnapshot(s));

  static Future<AnnouncementRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AnnouncementRecord.fromSnapshot(s));

  static AnnouncementRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AnnouncementRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AnnouncementRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AnnouncementRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AnnouncementRecord(reference: ${reference.path}, data: $snapshotData)';
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
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'body': body,
      'photo_url': photoUrl,
      'created_time': createdTime,
      'created_by': createdBy,
      'expiry_date': expiryDate,
      'isDeleted': isDeleted,
      'isConfirmbySA': isConfirmbySA,
      'reason': reason,
      'isDeclined': isDeclined,
    }.withoutNulls,
  );

  return firestoreData;
}
