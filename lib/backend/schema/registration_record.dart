import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RegistrationRecord extends FirestoreRecord {
  RegistrationRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_by" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "birth_date" field.
  DateTime? _birthDate;
  DateTime? get birthDate => _birthDate;
  bool hasBirthDate() => _birthDate != null;

  // "age" field.
  int? _age;
  int get age => _age ?? 0;
  bool hasAge() => _age != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "nationality" field.
  String? _nationality;
  String get nationality => _nationality ?? '';
  bool hasNationality() => _nationality != null;

  // "civil_status" field.
  String? _civilStatus;
  String get civilStatus => _civilStatus ?? '';
  bool hasCivilStatus() => _civilStatus != null;

  // "appointmentDate" field.
  DateTime? _appointmentDate;
  DateTime? get appointmentDate => _appointmentDate;
  bool hasAppointmentDate() => _appointmentDate != null;

  // "ID_url" field.
  List<String>? _iDUrl;
  List<String> get iDUrl => _iDUrl ?? const [];
  bool hasIDUrl() => _iDUrl != null;

  // "isDeleted" field.
  bool? _isDeleted;
  bool get isDeleted => _isDeleted ?? false;
  bool hasIsDeleted() => _isDeleted != null;

  // "expiry_date" field.
  DateTime? _expiryDate;
  DateTime? get expiryDate => _expiryDate;
  bool hasExpiryDate() => _expiryDate != null;

  // "isConfirmbySA" field.
  bool? _isConfirmbySA;
  bool get isConfirmbySA => _isConfirmbySA ?? false;
  bool hasIsConfirmbySA() => _isConfirmbySA != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "isDeclined" field.
  bool? _isDeclined;
  bool get isDeclined => _isDeclined ?? false;
  bool hasIsDeclined() => _isDeclined != null;

  // "reason" field.
  String? _reason;
  String get reason => _reason ?? '';
  bool hasReason() => _reason != null;

  // "streetAddress" field.
  String? _streetAddress;
  String get streetAddress => _streetAddress ?? '';
  bool hasStreetAddress() => _streetAddress != null;

  // "aptSuiteorUnitAddress" field.
  String? _aptSuiteorUnitAddress;
  String get aptSuiteorUnitAddress => _aptSuiteorUnitAddress ?? '';
  bool hasAptSuiteorUnitAddress() => _aptSuiteorUnitAddress != null;

  // "City" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "Province" field.
  String? _province;
  String get province => _province ?? '';
  bool hasProvince() => _province != null;

  // "approvalDate" field.
  DateTime? _approvalDate;
  DateTime? get approvalDate => _approvalDate;
  bool hasApprovalDate() => _approvalDate != null;

  void _initializeFields() {
    _displayName = snapshotData['display_name'] as String?;
    _email = snapshotData['email'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _uid = snapshotData['uid'] as String?;
    _createdBy = snapshotData['created_by'] as DocumentReference?;
    _birthDate = snapshotData['birth_date'] as DateTime?;
    _age = castToType<int>(snapshotData['age']);
    _gender = snapshotData['gender'] as String?;
    _nationality = snapshotData['nationality'] as String?;
    _civilStatus = snapshotData['civil_status'] as String?;
    _appointmentDate = snapshotData['appointmentDate'] as DateTime?;
    _iDUrl = getDataList(snapshotData['ID_url']);
    _isDeleted = snapshotData['isDeleted'] as bool?;
    _expiryDate = snapshotData['expiry_date'] as DateTime?;
    _isConfirmbySA = snapshotData['isConfirmbySA'] as bool?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _isDeclined = snapshotData['isDeclined'] as bool?;
    _reason = snapshotData['reason'] as String?;
    _streetAddress = snapshotData['streetAddress'] as String?;
    _aptSuiteorUnitAddress = snapshotData['aptSuiteorUnitAddress'] as String?;
    _city = snapshotData['City'] as String?;
    _province = snapshotData['Province'] as String?;
    _approvalDate = snapshotData['approvalDate'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('registration');

  static Stream<RegistrationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RegistrationRecord.fromSnapshot(s));

  static Future<RegistrationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RegistrationRecord.fromSnapshot(s));

  static RegistrationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RegistrationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RegistrationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RegistrationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RegistrationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RegistrationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRegistrationRecordData({
  String? displayName,
  String? email,
  String? photoUrl,
  DateTime? createdTime,
  String? uid,
  DocumentReference? createdBy,
  DateTime? birthDate,
  int? age,
  String? gender,
  String? nationality,
  String? civilStatus,
  DateTime? appointmentDate,
  bool? isDeleted,
  DateTime? expiryDate,
  bool? isConfirmbySA,
  String? phoneNumber,
  bool? isDeclined,
  String? reason,
  String? streetAddress,
  String? aptSuiteorUnitAddress,
  String? city,
  String? province,
  DateTime? approvalDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'display_name': displayName,
      'email': email,
      'photo_url': photoUrl,
      'created_time': createdTime,
      'uid': uid,
      'created_by': createdBy,
      'birth_date': birthDate,
      'age': age,
      'gender': gender,
      'nationality': nationality,
      'civil_status': civilStatus,
      'appointmentDate': appointmentDate,
      'isDeleted': isDeleted,
      'expiry_date': expiryDate,
      'isConfirmbySA': isConfirmbySA,
      'phone_number': phoneNumber,
      'isDeclined': isDeclined,
      'reason': reason,
      'streetAddress': streetAddress,
      'aptSuiteorUnitAddress': aptSuiteorUnitAddress,
      'City': city,
      'Province': province,
      'approvalDate': approvalDate,
    }.withoutNulls,
  );

  return firestoreData;
}
