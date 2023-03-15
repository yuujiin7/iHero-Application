import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'partner_org_record.g.dart';

abstract class PartnerOrgRecord
    implements Built<PartnerOrgRecord, PartnerOrgRecordBuilder> {
  static Serializer<PartnerOrgRecord> get serializer =>
      _$partnerOrgRecordSerializer;

  @BuiltValueField(wireName: 'website_url')
  String? get websiteUrl;

  @BuiltValueField(wireName: 'org_name')
  String? get orgName;

  String? get description;

  String? get contactPerson;

  String? get contactNumber;

  String? get mission;

  String? get email;

  String? get address;

  @BuiltValueField(wireName: 'photo_url')
  String? get photoUrl;

  @BuiltValueField(wireName: 'admin_ref')
  DocumentReference? get adminRef;

  bool? get isDeleted;

  @BuiltValueField(wireName: 'expiry_date')
  DateTime? get expiryDate;

  @BuiltValueField(wireName: 'created_by')
  DateTime? get createdBy;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  String? get orgType;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(PartnerOrgRecordBuilder builder) => builder
    ..websiteUrl = ''
    ..orgName = ''
    ..description = ''
    ..contactPerson = ''
    ..contactNumber = ''
    ..mission = ''
    ..email = ''
    ..address = ''
    ..photoUrl = ''
    ..isDeleted = false
    ..orgType = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('partnerOrg');

  static Stream<PartnerOrgRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PartnerOrgRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  PartnerOrgRecord._();
  factory PartnerOrgRecord([void Function(PartnerOrgRecordBuilder) updates]) =
      _$PartnerOrgRecord;

  static PartnerOrgRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
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
  final firestoreData = serializers.toFirestore(
    PartnerOrgRecord.serializer,
    PartnerOrgRecord(
      (p) => p
        ..websiteUrl = websiteUrl
        ..orgName = orgName
        ..description = description
        ..contactPerson = contactPerson
        ..contactNumber = contactNumber
        ..mission = mission
        ..email = email
        ..address = address
        ..photoUrl = photoUrl
        ..adminRef = adminRef
        ..isDeleted = isDeleted
        ..expiryDate = expiryDate
        ..createdBy = createdBy
        ..createdAt = createdAt
        ..orgType = orgType,
    ),
  );

  return firestoreData;
}
