import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'registration_record.g.dart';

abstract class RegistrationRecord
    implements Built<RegistrationRecord, RegistrationRecordBuilder> {
  static Serializer<RegistrationRecord> get serializer =>
      _$registrationRecordSerializer;

  @BuiltValueField(wireName: 'display_name')
  String? get displayName;

  String? get address;

  String? get email;

  @BuiltValueField(wireName: 'photo_url')
  String? get photoUrl;

  @BuiltValueField(wireName: 'created_time')
  DateTime? get createdTime;

  String? get uid;

  @BuiltValueField(wireName: 'created_by')
  DocumentReference? get createdBy;

  String? get profession;

  @BuiltValueField(wireName: 'birth_date')
  DateTime? get birthDate;

  int? get age;

  String? get gender;

  String? get nationality;

  @BuiltValueField(wireName: 'civil_status')
  String? get civilStatus;

  @BuiltValueField(wireName: 'emergency_contact')
  String? get emergencyContact;

  DateTime? get appointmentDate;

  @BuiltValueField(wireName: 'ID_url')
  BuiltList<String>? get iDUrl;

  bool? get isDeleted;

  @BuiltValueField(wireName: 'expiry_date')
  DateTime? get expiryDate;

  bool? get isConfirmbySA;

  @BuiltValueField(wireName: 'phone_number')
  String? get phoneNumber;

  bool? get isDeclined;

  String? get reason;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(RegistrationRecordBuilder builder) => builder
    ..displayName = ''
    ..address = ''
    ..email = ''
    ..photoUrl = ''
    ..uid = ''
    ..profession = ''
    ..age = 0
    ..gender = ''
    ..nationality = ''
    ..civilStatus = ''
    ..emergencyContact = ''
    ..iDUrl = ListBuilder()
    ..isDeleted = false
    ..isConfirmbySA = false
    ..phoneNumber = ''
    ..isDeclined = false
    ..reason = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('registration');

  static Stream<RegistrationRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<RegistrationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  RegistrationRecord._();
  factory RegistrationRecord(
          [void Function(RegistrationRecordBuilder) updates]) =
      _$RegistrationRecord;

  static RegistrationRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createRegistrationRecordData({
  String? displayName,
  String? address,
  String? email,
  String? photoUrl,
  DateTime? createdTime,
  String? uid,
  DocumentReference? createdBy,
  String? profession,
  DateTime? birthDate,
  int? age,
  String? gender,
  String? nationality,
  String? civilStatus,
  String? emergencyContact,
  DateTime? appointmentDate,
  bool? isDeleted,
  DateTime? expiryDate,
  bool? isConfirmbySA,
  String? phoneNumber,
  bool? isDeclined,
  String? reason,
}) {
  final firestoreData = serializers.toFirestore(
    RegistrationRecord.serializer,
    RegistrationRecord(
      (r) => r
        ..displayName = displayName
        ..address = address
        ..email = email
        ..photoUrl = photoUrl
        ..createdTime = createdTime
        ..uid = uid
        ..createdBy = createdBy
        ..profession = profession
        ..birthDate = birthDate
        ..age = age
        ..gender = gender
        ..nationality = nationality
        ..civilStatus = civilStatus
        ..emergencyContact = emergencyContact
        ..appointmentDate = appointmentDate
        ..iDUrl = null
        ..isDeleted = isDeleted
        ..expiryDate = expiryDate
        ..isConfirmbySA = isConfirmbySA
        ..phoneNumber = phoneNumber
        ..isDeclined = isDeclined
        ..reason = reason,
    ),
  );

  return firestoreData;
}
