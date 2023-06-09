import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PartnerOrgRecord extends FirestoreRecord {
  PartnerOrgRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "website_url" field.
  String? _websiteUrl;
  String get websiteUrl => _websiteUrl ?? '';
  bool hasWebsiteUrl() => _websiteUrl != null;

  // "org_name" field.
  String? _orgName;
  String get orgName => _orgName ?? '';
  bool hasOrgName() => _orgName != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "contactPerson" field.
  String? _contactPerson;
  String get contactPerson => _contactPerson ?? '';
  bool hasContactPerson() => _contactPerson != null;

  // "contactNumber" field.
  String? _contactNumber;
  String get contactNumber => _contactNumber ?? '';
  bool hasContactNumber() => _contactNumber != null;

  // "mission" field.
  String? _mission;
  String get mission => _mission ?? '';
  bool hasMission() => _mission != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "admin_ref" field.
  DocumentReference? _adminRef;
  DocumentReference? get adminRef => _adminRef;
  bool hasAdminRef() => _adminRef != null;

  // "isDeleted" field.
  bool? _isDeleted;
  bool get isDeleted => _isDeleted ?? false;
  bool hasIsDeleted() => _isDeleted != null;

  // "expiry_date" field.
  DateTime? _expiryDate;
  DateTime? get expiryDate => _expiryDate;
  bool hasExpiryDate() => _expiryDate != null;

  // "created_by" field.
  DateTime? _createdBy;
  DateTime? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "orgType" field.
  String? _orgType;
  String get orgType => _orgType ?? '';
  bool hasOrgType() => _orgType != null;

  void _initializeFields() {
    _websiteUrl = snapshotData['website_url'] as String?;
    _orgName = snapshotData['org_name'] as String?;
    _description = snapshotData['description'] as String?;
    _contactPerson = snapshotData['contactPerson'] as String?;
    _contactNumber = snapshotData['contactNumber'] as String?;
    _mission = snapshotData['mission'] as String?;
    _email = snapshotData['email'] as String?;
    _address = snapshotData['address'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _adminRef = snapshotData['admin_ref'] as DocumentReference?;
    _isDeleted = snapshotData['isDeleted'] as bool?;
    _expiryDate = snapshotData['expiry_date'] as DateTime?;
    _createdBy = snapshotData['created_by'] as DateTime?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _orgType = snapshotData['orgType'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('partnerOrg');

  static Stream<PartnerOrgRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PartnerOrgRecord.fromSnapshot(s));

  static Future<PartnerOrgRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PartnerOrgRecord.fromSnapshot(s));

  static PartnerOrgRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PartnerOrgRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PartnerOrgRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PartnerOrgRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PartnerOrgRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PartnerOrgRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPartnerOrgRecordData({
  String? websiteUrl,
  String? orgName,
  String? description,
  String? contactPerson,
  String? contactNumber,
  String? mission,
  String? email,
  String? address,
  String? photoUrl,
  DocumentReference? adminRef,
  bool? isDeleted,
  DateTime? expiryDate,
  DateTime? createdBy,
  DateTime? createdAt,
  String? orgType,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'website_url': websiteUrl,
      'org_name': orgName,
      'description': description,
      'contactPerson': contactPerson,
      'contactNumber': contactNumber,
      'mission': mission,
      'email': email,
      'address': address,
      'photo_url': photoUrl,
      'admin_ref': adminRef,
      'isDeleted': isDeleted,
      'expiry_date': expiryDate,
      'created_by': createdBy,
      'created_at': createdAt,
      'orgType': orgType,
    }.withoutNulls,
  );

  return firestoreData;
}
