import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "userType" field.
  String? _userType;
  String get userType => _userType ?? '';
  bool hasUserType() => _userType != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "isDeceased" field.
  bool? _isDeceased;
  bool get isDeceased => _isDeceased ?? false;
  bool hasIsDeceased() => _isDeceased != null;

  // "meritScore" field.
  int? _meritScore;
  int get meritScore => _meritScore ?? 0;
  bool hasMeritScore() => _meritScore != null;

  // "isDeleted" field.
  bool? _isDeleted;
  bool get isDeleted => _isDeleted ?? false;
  bool hasIsDeleted() => _isDeleted != null;

  // "expiry_date" field.
  DateTime? _expiryDate;
  DateTime? get expiryDate => _expiryDate;
  bool hasExpiryDate() => _expiryDate != null;

  // "startTime" field.
  DateTime? _startTime;
  DateTime? get startTime => _startTime;
  bool hasStartTime() => _startTime != null;

  // "endTime" field.
  DateTime? _endTime;
  DateTime? get endTime => _endTime;
  bool hasEndTime() => _endTime != null;

  // "deviceType" field.
  String? _deviceType;
  String get deviceType => _deviceType ?? '';
  bool hasDeviceType() => _deviceType != null;

  // "screenName" field.
  String? _screenName;
  String get screenName => _screenName ?? '';
  bool hasScreenName() => _screenName != null;

  // "duration" field.
  int? _duration;
  int get duration => _duration ?? 0;
  bool hasDuration() => _duration != null;

  // "age" field.
  int? _age;
  int get age => _age ?? 0;
  bool hasAge() => _age != null;

  // "birthday" field.
  DateTime? _birthday;
  DateTime? get birthday => _birthday;
  bool hasBirthday() => _birthday != null;

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

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _userType = snapshotData['userType'] as String?;
    _gender = snapshotData['gender'] as String?;
    _location = snapshotData['location'] as String?;
    _isDeceased = snapshotData['isDeceased'] as bool?;
    _meritScore = snapshotData['meritScore'] as int?;
    _isDeleted = snapshotData['isDeleted'] as bool?;
    _expiryDate = snapshotData['expiry_date'] as DateTime?;
    _startTime = snapshotData['startTime'] as DateTime?;
    _endTime = snapshotData['endTime'] as DateTime?;
    _deviceType = snapshotData['deviceType'] as String?;
    _screenName = snapshotData['screenName'] as String?;
    _duration = snapshotData['duration'] as int?;
    _age = snapshotData['age'] as int?;
    _birthday = snapshotData['birthday'] as DateTime?;
    _streetAddress = snapshotData['streetAddress'] as String?;
    _aptSuiteorUnitAddress = snapshotData['aptSuiteorUnitAddress'] as String?;
    _city = snapshotData['City'] as String?;
    _province = snapshotData['Province'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? userType,
  String? gender,
  String? location,
  bool? isDeceased,
  int? meritScore,
  bool? isDeleted,
  DateTime? expiryDate,
  DateTime? startTime,
  DateTime? endTime,
  String? deviceType,
  String? screenName,
  int? duration,
  int? age,
  DateTime? birthday,
  String? streetAddress,
  String? aptSuiteorUnitAddress,
  String? city,
  String? province,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'userType': userType,
      'gender': gender,
      'location': location,
      'isDeceased': isDeceased,
      'meritScore': meritScore,
      'isDeleted': isDeleted,
      'expiry_date': expiryDate,
      'startTime': startTime,
      'endTime': endTime,
      'deviceType': deviceType,
      'screenName': screenName,
      'duration': duration,
      'age': age,
      'birthday': birthday,
      'streetAddress': streetAddress,
      'aptSuiteorUnitAddress': aptSuiteorUnitAddress,
      'City': city,
      'Province': province,
    }.withoutNulls,
  );

  return firestoreData;
}
