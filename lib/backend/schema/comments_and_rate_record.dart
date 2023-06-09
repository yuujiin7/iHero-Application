import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommentsAndRateRecord extends FirestoreRecord {
  CommentsAndRateRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_by" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  // "rating" field.
  double? _rating;
  double get rating => _rating ?? 0.0;
  bool hasRating() => _rating != null;

  // "post_type" field.
  DocumentReference? _postType;
  DocumentReference? get postType => _postType;
  bool hasPostType() => _postType != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _createdBy = snapshotData['created_by'] as DocumentReference?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _comment = snapshotData['comment'] as String?;
    _rating = castToType<double>(snapshotData['rating']);
    _postType = snapshotData['post_type'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('comments_and_rate')
          : FirebaseFirestore.instance.collectionGroup('comments_and_rate');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('comments_and_rate').doc();

  static Stream<CommentsAndRateRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommentsAndRateRecord.fromSnapshot(s));

  static Future<CommentsAndRateRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommentsAndRateRecord.fromSnapshot(s));

  static CommentsAndRateRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommentsAndRateRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommentsAndRateRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommentsAndRateRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommentsAndRateRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommentsAndRateRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommentsAndRateRecordData({
  DocumentReference? createdBy,
  DateTime? createdAt,
  String? comment,
  double? rating,
  DocumentReference? postType,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_by': createdBy,
      'created_at': createdAt,
      'comment': comment,
      'rating': rating,
      'post_type': postType,
    }.withoutNulls,
  );

  return firestoreData;
}
