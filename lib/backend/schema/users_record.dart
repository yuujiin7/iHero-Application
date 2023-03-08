import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'users_record.g.dart';

abstract class UsersRecord implements Built<UsersRecord, UsersRecordBuilder> {
  static Serializer<UsersRecord> get serializer => _$usersRecordSerializer;

  String? get email;

  @BuiltValueField(wireName: 'display_name')
  String? get displayName;

  @BuiltValueField(wireName: 'photo_url')
  String? get photoUrl;

  String? get uid;

  @BuiltValueField(wireName: 'created_time')
  DateTime? get createdTime;

  @BuiltValueField(wireName: 'phone_number')
  String? get phoneNumber;

  String? get userType;

  String? get gender;

  String? get location;

  @BuiltValueField(wireName: 'heart_count')
  int? get heartCount;

  bool? get isDeceased;

  int? get meritScore;

  String? get department;

  bool? get isDeleted;

  @BuiltValueField(wireName: 'expiry_date')
  DateTime? get expiryDate;

  DateTime? get startTime;

  DateTime? get endTime;

  String? get deviceType;

  String? get screenName;

  int? get duration;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(UsersRecordBuilder builder) => builder
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..phoneNumber = ''
    ..userType = ''
    ..gender = ''
    ..location = ''
    ..heartCount = 0
    ..isDeceased = false
    ..meritScore = 0
    ..department = ''
    ..isDeleted = false
    ..deviceType = ''
    ..screenName = ''
    ..duration = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  UsersRecord._();
  factory UsersRecord([void Function(UsersRecordBuilder) updates]) =
      _$UsersRecord;

  static UsersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
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
  int? heartCount,
  bool? isDeceased,
  int? meritScore,
  String? department,
  bool? isDeleted,
  DateTime? expiryDate,
  DateTime? startTime,
  DateTime? endTime,
  String? deviceType,
  String? screenName,
  int? duration,
}) {
  final firestoreData = serializers.toFirestore(
    UsersRecord.serializer,
    UsersRecord(
      (u) => u
        ..email = email
        ..displayName = displayName
        ..photoUrl = photoUrl
        ..uid = uid
        ..createdTime = createdTime
        ..phoneNumber = phoneNumber
        ..userType = userType
        ..gender = gender
        ..location = location
        ..heartCount = heartCount
        ..isDeceased = isDeceased
        ..meritScore = meritScore
        ..department = department
        ..isDeleted = isDeleted
        ..expiryDate = expiryDate
        ..startTime = startTime
        ..endTime = endTime
        ..deviceType = deviceType
        ..screenName = screenName
        ..duration = duration,
    ),
  );

  return firestoreData;
}
