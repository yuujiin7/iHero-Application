// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partner_org_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PartnerOrgRecord> _$partnerOrgRecordSerializer =
    new _$PartnerOrgRecordSerializer();

class _$PartnerOrgRecordSerializer
    implements StructuredSerializer<PartnerOrgRecord> {
  @override
  final Iterable<Type> types = const [PartnerOrgRecord, _$PartnerOrgRecord];
  @override
  final String wireName = 'PartnerOrgRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, PartnerOrgRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.websiteUrl;
    if (value != null) {
      result
        ..add('website_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.orgName;
    if (value != null) {
      result
        ..add('org_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.contactPerson;
    if (value != null) {
      result
        ..add('contactPerson')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.contactNumber;
    if (value != null) {
      result
        ..add('contactNumber')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.mission;
    if (value != null) {
      result
        ..add('mission')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.address;
    if (value != null) {
      result
        ..add('address')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photoUrl;
    if (value != null) {
      result
        ..add('photo_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.adminRef;
    if (value != null) {
      result
        ..add('admin_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.isDeleted;
    if (value != null) {
      result
        ..add('isDeleted')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.expiryDate;
    if (value != null) {
      result
        ..add('expiry_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.createdBy;
    if (value != null) {
      result
        ..add('created_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.orgType;
    if (value != null) {
      result
        ..add('orgType')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  PartnerOrgRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PartnerOrgRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'website_url':
          result.websiteUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'org_name':
          result.orgName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'contactPerson':
          result.contactPerson = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'contactNumber':
          result.contactNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'mission':
          result.mission = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'photo_url':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'admin_ref':
          result.adminRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'isDeleted':
          result.isDeleted = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'expiry_date':
          result.expiryDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'created_by':
          result.createdBy = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'orgType':
          result.orgType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$PartnerOrgRecord extends PartnerOrgRecord {
  @override
  final String? websiteUrl;
  @override
  final String? orgName;
  @override
  final String? description;
  @override
  final String? contactPerson;
  @override
  final String? contactNumber;
  @override
  final String? mission;
  @override
  final String? email;
  @override
  final String? address;
  @override
  final String? photoUrl;
  @override
  final DocumentReference<Object?>? adminRef;
  @override
  final bool? isDeleted;
  @override
  final DateTime? expiryDate;
  @override
  final DateTime? createdBy;
  @override
  final DateTime? createdAt;
  @override
  final String? orgType;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$PartnerOrgRecord(
          [void Function(PartnerOrgRecordBuilder)? updates]) =>
      (new PartnerOrgRecordBuilder()..update(updates))._build();

  _$PartnerOrgRecord._(
      {this.websiteUrl,
      this.orgName,
      this.description,
      this.contactPerson,
      this.contactNumber,
      this.mission,
      this.email,
      this.address,
      this.photoUrl,
      this.adminRef,
      this.isDeleted,
      this.expiryDate,
      this.createdBy,
      this.createdAt,
      this.orgType,
      this.ffRef})
      : super._();

  @override
  PartnerOrgRecord rebuild(void Function(PartnerOrgRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PartnerOrgRecordBuilder toBuilder() =>
      new PartnerOrgRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PartnerOrgRecord &&
        websiteUrl == other.websiteUrl &&
        orgName == other.orgName &&
        description == other.description &&
        contactPerson == other.contactPerson &&
        contactNumber == other.contactNumber &&
        mission == other.mission &&
        email == other.email &&
        address == other.address &&
        photoUrl == other.photoUrl &&
        adminRef == other.adminRef &&
        isDeleted == other.isDeleted &&
        expiryDate == other.expiryDate &&
        createdBy == other.createdBy &&
        createdAt == other.createdAt &&
        orgType == other.orgType &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    0,
                                                                    websiteUrl
                                                                        .hashCode),
                                                                orgName
                                                                    .hashCode),
                                                            description
                                                                .hashCode),
                                                        contactPerson.hashCode),
                                                    contactNumber.hashCode),
                                                mission.hashCode),
                                            email.hashCode),
                                        address.hashCode),
                                    photoUrl.hashCode),
                                adminRef.hashCode),
                            isDeleted.hashCode),
                        expiryDate.hashCode),
                    createdBy.hashCode),
                createdAt.hashCode),
            orgType.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PartnerOrgRecord')
          ..add('websiteUrl', websiteUrl)
          ..add('orgName', orgName)
          ..add('description', description)
          ..add('contactPerson', contactPerson)
          ..add('contactNumber', contactNumber)
          ..add('mission', mission)
          ..add('email', email)
          ..add('address', address)
          ..add('photoUrl', photoUrl)
          ..add('adminRef', adminRef)
          ..add('isDeleted', isDeleted)
          ..add('expiryDate', expiryDate)
          ..add('createdBy', createdBy)
          ..add('createdAt', createdAt)
          ..add('orgType', orgType)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class PartnerOrgRecordBuilder
    implements Builder<PartnerOrgRecord, PartnerOrgRecordBuilder> {
  _$PartnerOrgRecord? _$v;

  String? _websiteUrl;
  String? get websiteUrl => _$this._websiteUrl;
  set websiteUrl(String? websiteUrl) => _$this._websiteUrl = websiteUrl;

  String? _orgName;
  String? get orgName => _$this._orgName;
  set orgName(String? orgName) => _$this._orgName = orgName;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _contactPerson;
  String? get contactPerson => _$this._contactPerson;
  set contactPerson(String? contactPerson) =>
      _$this._contactPerson = contactPerson;

  String? _contactNumber;
  String? get contactNumber => _$this._contactNumber;
  set contactNumber(String? contactNumber) =>
      _$this._contactNumber = contactNumber;

  String? _mission;
  String? get mission => _$this._mission;
  set mission(String? mission) => _$this._mission = mission;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  String? _photoUrl;
  String? get photoUrl => _$this._photoUrl;
  set photoUrl(String? photoUrl) => _$this._photoUrl = photoUrl;

  DocumentReference<Object?>? _adminRef;
  DocumentReference<Object?>? get adminRef => _$this._adminRef;
  set adminRef(DocumentReference<Object?>? adminRef) =>
      _$this._adminRef = adminRef;

  bool? _isDeleted;
  bool? get isDeleted => _$this._isDeleted;
  set isDeleted(bool? isDeleted) => _$this._isDeleted = isDeleted;

  DateTime? _expiryDate;
  DateTime? get expiryDate => _$this._expiryDate;
  set expiryDate(DateTime? expiryDate) => _$this._expiryDate = expiryDate;

  DateTime? _createdBy;
  DateTime? get createdBy => _$this._createdBy;
  set createdBy(DateTime? createdBy) => _$this._createdBy = createdBy;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  String? _orgType;
  String? get orgType => _$this._orgType;
  set orgType(String? orgType) => _$this._orgType = orgType;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  PartnerOrgRecordBuilder() {
    PartnerOrgRecord._initializeBuilder(this);
  }

  PartnerOrgRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _websiteUrl = $v.websiteUrl;
      _orgName = $v.orgName;
      _description = $v.description;
      _contactPerson = $v.contactPerson;
      _contactNumber = $v.contactNumber;
      _mission = $v.mission;
      _email = $v.email;
      _address = $v.address;
      _photoUrl = $v.photoUrl;
      _adminRef = $v.adminRef;
      _isDeleted = $v.isDeleted;
      _expiryDate = $v.expiryDate;
      _createdBy = $v.createdBy;
      _createdAt = $v.createdAt;
      _orgType = $v.orgType;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PartnerOrgRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PartnerOrgRecord;
  }

  @override
  void update(void Function(PartnerOrgRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PartnerOrgRecord build() => _build();

  _$PartnerOrgRecord _build() {
    final _$result = _$v ??
        new _$PartnerOrgRecord._(
            websiteUrl: websiteUrl,
            orgName: orgName,
            description: description,
            contactPerson: contactPerson,
            contactNumber: contactNumber,
            mission: mission,
            email: email,
            address: address,
            photoUrl: photoUrl,
            adminRef: adminRef,
            isDeleted: isDeleted,
            expiryDate: expiryDate,
            createdBy: createdBy,
            createdAt: createdAt,
            orgType: orgType,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
