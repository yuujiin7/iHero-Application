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

  bool? get isDeceased;

  int? get meritScore;

  bool? get isDeleted;

  @BuiltValueField(wireName: 'expiry_date')
  DateTime? get expiryDate;

  DateTime? get startTime;

  DateTime? get endTime;

  String? get deviceType;

  String? get screenName;

  int? get duration;

  int? get age;

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
    ..isDeceased = false
    ..meritScore = 0
    ..isDeleted = false
    ..deviceType = ''
    ..screenName = ''
    ..duration = 0
    ..age = 0;

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
        ..isDeceased = isDeceased
        ..meritScore = meritScore
        ..isDeleted = isDeleted
        ..expiryDate = expiryDate
        ..startTime = startTime
        ..endTime = endTime
        ..deviceType = deviceType
        ..screenName = screenName
        ..duration = duration
        ..age = age,
    ),
  );

  return firestoreData;
}
