// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RegistrationRecord> _$registrationRecordSerializer =
    new _$RegistrationRecordSerializer();

class _$RegistrationRecordSerializer
    implements StructuredSerializer<RegistrationRecord> {
  @override
  final Iterable<Type> types = const [RegistrationRecord, _$RegistrationRecord];
  @override
  final String wireName = 'RegistrationRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, RegistrationRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.displayName;
    if (value != null) {
      result
        ..add('display_name')
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
    value = object.photoUrl;
    if (value != null) {
      result
        ..add('photo_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdTime;
    if (value != null) {
      result
        ..add('created_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdBy;
    if (value != null) {
      result
        ..add('created_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.birthDate;
    if (value != null) {
      result
        ..add('birth_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.age;
    if (value != null) {
      result
        ..add('age')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.gender;
    if (value != null) {
      result
        ..add('gender')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.nationality;
    if (value != null) {
      result
        ..add('nationality')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.civilStatus;
    if (value != null) {
      result
        ..add('civil_status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.appointmentDate;
    if (value != null) {
      result
        ..add('appointmentDate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.iDUrl;
    if (value != null) {
      result
        ..add('ID_url')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
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
    value = object.isConfirmbySA;
    if (value != null) {
      result
        ..add('isConfirmbySA')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.phoneNumber;
    if (value != null) {
      result
        ..add('phone_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isDeclined;
    if (value != null) {
      result
        ..add('isDeclined')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.reason;
    if (value != null) {
      result
        ..add('reason')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.streetAddress;
    if (value != null) {
      result
        ..add('streetAddress')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.aptSuiteorUnitAddress;
    if (value != null) {
      result
        ..add('aptSuiteorUnitAddress')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.city;
    if (value != null) {
      result
        ..add('City')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.province;
    if (value != null) {
      result
        ..add('Province')
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
  RegistrationRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RegistrationRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'display_name':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'photo_url':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_by':
          result.createdBy = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'birth_date':
          result.birthDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'age':
          result.age = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'gender':
          result.gender = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'nationality':
          result.nationality = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'civil_status':
          result.civilStatus = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'appointmentDate':
          result.appointmentDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'ID_url':
          result.iDUrl.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'isDeleted':
          result.isDeleted = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'expiry_date':
          result.expiryDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'isConfirmbySA':
          result.isConfirmbySA = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'phone_number':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'isDeclined':
          result.isDeclined = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'reason':
          result.reason = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'streetAddress':
          result.streetAddress = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'aptSuiteorUnitAddress':
          result.aptSuiteorUnitAddress = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'City':
          result.city = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Province':
          result.province = serializers.deserialize(value,
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

class _$RegistrationRecord extends RegistrationRecord {
  @override
  final String? displayName;
  @override
  final String? email;
  @override
  final String? photoUrl;
  @override
  final DateTime? createdTime;
  @override
  final String? uid;
  @override
  final DocumentReference<Object?>? createdBy;
  @override
  final DateTime? birthDate;
  @override
  final int? age;
  @override
  final String? gender;
  @override
  final String? nationality;
  @override
  final String? civilStatus;
  @override
  final DateTime? appointmentDate;
  @override
  final BuiltList<String>? iDUrl;
  @override
  final bool? isDeleted;
  @override
  final DateTime? expiryDate;
  @override
  final bool? isConfirmbySA;
  @override
  final String? phoneNumber;
  @override
  final bool? isDeclined;
  @override
  final String? reason;
  @override
  final String? streetAddress;
  @override
  final String? aptSuiteorUnitAddress;
  @override
  final String? city;
  @override
  final String? province;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$RegistrationRecord(
          [void Function(RegistrationRecordBuilder)? updates]) =>
      (new RegistrationRecordBuilder()..update(updates))._build();

  _$RegistrationRecord._(
      {this.displayName,
      this.email,
      this.photoUrl,
      this.createdTime,
      this.uid,
      this.createdBy,
      this.birthDate,
      this.age,
      this.gender,
      this.nationality,
      this.civilStatus,
      this.appointmentDate,
      this.iDUrl,
      this.isDeleted,
      this.expiryDate,
      this.isConfirmbySA,
      this.phoneNumber,
      this.isDeclined,
      this.reason,
      this.streetAddress,
      this.aptSuiteorUnitAddress,
      this.city,
      this.province,
      this.ffRef})
      : super._();

  @override
  RegistrationRecord rebuild(
          void Function(RegistrationRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RegistrationRecordBuilder toBuilder() =>
      new RegistrationRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RegistrationRecord &&
        displayName == other.displayName &&
        email == other.email &&
        photoUrl == other.photoUrl &&
        createdTime == other.createdTime &&
        uid == other.uid &&
        createdBy == other.createdBy &&
        birthDate == other.birthDate &&
        age == other.age &&
        gender == other.gender &&
        nationality == other.nationality &&
        civilStatus == other.civilStatus &&
        appointmentDate == other.appointmentDate &&
        iDUrl == other.iDUrl &&
        isDeleted == other.isDeleted &&
        expiryDate == other.expiryDate &&
        isConfirmbySA == other.isConfirmbySA &&
        phoneNumber == other.phoneNumber &&
        isDeclined == other.isDeclined &&
        reason == other.reason &&
        streetAddress == other.streetAddress &&
        aptSuiteorUnitAddress == other.aptSuiteorUnitAddress &&
        city == other.city &&
        province == other.province &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, photoUrl.hashCode);
    _$hash = $jc(_$hash, createdTime.hashCode);
    _$hash = $jc(_$hash, uid.hashCode);
    _$hash = $jc(_$hash, createdBy.hashCode);
    _$hash = $jc(_$hash, birthDate.hashCode);
    _$hash = $jc(_$hash, age.hashCode);
    _$hash = $jc(_$hash, gender.hashCode);
    _$hash = $jc(_$hash, nationality.hashCode);
    _$hash = $jc(_$hash, civilStatus.hashCode);
    _$hash = $jc(_$hash, appointmentDate.hashCode);
    _$hash = $jc(_$hash, iDUrl.hashCode);
    _$hash = $jc(_$hash, isDeleted.hashCode);
    _$hash = $jc(_$hash, expiryDate.hashCode);
    _$hash = $jc(_$hash, isConfirmbySA.hashCode);
    _$hash = $jc(_$hash, phoneNumber.hashCode);
    _$hash = $jc(_$hash, isDeclined.hashCode);
    _$hash = $jc(_$hash, reason.hashCode);
    _$hash = $jc(_$hash, streetAddress.hashCode);
    _$hash = $jc(_$hash, aptSuiteorUnitAddress.hashCode);
    _$hash = $jc(_$hash, city.hashCode);
    _$hash = $jc(_$hash, province.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RegistrationRecord')
          ..add('displayName', displayName)
          ..add('email', email)
          ..add('photoUrl', photoUrl)
          ..add('createdTime', createdTime)
          ..add('uid', uid)
          ..add('createdBy', createdBy)
          ..add('birthDate', birthDate)
          ..add('age', age)
          ..add('gender', gender)
          ..add('nationality', nationality)
          ..add('civilStatus', civilStatus)
          ..add('appointmentDate', appointmentDate)
          ..add('iDUrl', iDUrl)
          ..add('isDeleted', isDeleted)
          ..add('expiryDate', expiryDate)
          ..add('isConfirmbySA', isConfirmbySA)
          ..add('phoneNumber', phoneNumber)
          ..add('isDeclined', isDeclined)
          ..add('reason', reason)
          ..add('streetAddress', streetAddress)
          ..add('aptSuiteorUnitAddress', aptSuiteorUnitAddress)
          ..add('city', city)
          ..add('province', province)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class RegistrationRecordBuilder
    implements Builder<RegistrationRecord, RegistrationRecordBuilder> {
  _$RegistrationRecord? _$v;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _photoUrl;
  String? get photoUrl => _$this._photoUrl;
  set photoUrl(String? photoUrl) => _$this._photoUrl = photoUrl;

  DateTime? _createdTime;
  DateTime? get createdTime => _$this._createdTime;
  set createdTime(DateTime? createdTime) => _$this._createdTime = createdTime;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  DocumentReference<Object?>? _createdBy;
  DocumentReference<Object?>? get createdBy => _$this._createdBy;
  set createdBy(DocumentReference<Object?>? createdBy) =>
      _$this._createdBy = createdBy;

  DateTime? _birthDate;
  DateTime? get birthDate => _$this._birthDate;
  set birthDate(DateTime? birthDate) => _$this._birthDate = birthDate;

  int? _age;
  int? get age => _$this._age;
  set age(int? age) => _$this._age = age;

  String? _gender;
  String? get gender => _$this._gender;
  set gender(String? gender) => _$this._gender = gender;

  String? _nationality;
  String? get nationality => _$this._nationality;
  set nationality(String? nationality) => _$this._nationality = nationality;

  String? _civilStatus;
  String? get civilStatus => _$this._civilStatus;
  set civilStatus(String? civilStatus) => _$this._civilStatus = civilStatus;

  DateTime? _appointmentDate;
  DateTime? get appointmentDate => _$this._appointmentDate;
  set appointmentDate(DateTime? appointmentDate) =>
      _$this._appointmentDate = appointmentDate;

  ListBuilder<String>? _iDUrl;
  ListBuilder<String> get iDUrl => _$this._iDUrl ??= new ListBuilder<String>();
  set iDUrl(ListBuilder<String>? iDUrl) => _$this._iDUrl = iDUrl;

  bool? _isDeleted;
  bool? get isDeleted => _$this._isDeleted;
  set isDeleted(bool? isDeleted) => _$this._isDeleted = isDeleted;

  DateTime? _expiryDate;
  DateTime? get expiryDate => _$this._expiryDate;
  set expiryDate(DateTime? expiryDate) => _$this._expiryDate = expiryDate;

  bool? _isConfirmbySA;
  bool? get isConfirmbySA => _$this._isConfirmbySA;
  set isConfirmbySA(bool? isConfirmbySA) =>
      _$this._isConfirmbySA = isConfirmbySA;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  bool? _isDeclined;
  bool? get isDeclined => _$this._isDeclined;
  set isDeclined(bool? isDeclined) => _$this._isDeclined = isDeclined;

  String? _reason;
  String? get reason => _$this._reason;
  set reason(String? reason) => _$this._reason = reason;

  String? _streetAddress;
  String? get streetAddress => _$this._streetAddress;
  set streetAddress(String? streetAddress) =>
      _$this._streetAddress = streetAddress;

  String? _aptSuiteorUnitAddress;
  String? get aptSuiteorUnitAddress => _$this._aptSuiteorUnitAddress;
  set aptSuiteorUnitAddress(String? aptSuiteorUnitAddress) =>
      _$this._aptSuiteorUnitAddress = aptSuiteorUnitAddress;

  String? _city;
  String? get city => _$this._city;
  set city(String? city) => _$this._city = city;

  String? _province;
  String? get province => _$this._province;
  set province(String? province) => _$this._province = province;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  RegistrationRecordBuilder() {
    RegistrationRecord._initializeBuilder(this);
  }

  RegistrationRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _displayName = $v.displayName;
      _email = $v.email;
      _photoUrl = $v.photoUrl;
      _createdTime = $v.createdTime;
      _uid = $v.uid;
      _createdBy = $v.createdBy;
      _birthDate = $v.birthDate;
      _age = $v.age;
      _gender = $v.gender;
      _nationality = $v.nationality;
      _civilStatus = $v.civilStatus;
      _appointmentDate = $v.appointmentDate;
      _iDUrl = $v.iDUrl?.toBuilder();
      _isDeleted = $v.isDeleted;
      _expiryDate = $v.expiryDate;
      _isConfirmbySA = $v.isConfirmbySA;
      _phoneNumber = $v.phoneNumber;
      _isDeclined = $v.isDeclined;
      _reason = $v.reason;
      _streetAddress = $v.streetAddress;
      _aptSuiteorUnitAddress = $v.aptSuiteorUnitAddress;
      _city = $v.city;
      _province = $v.province;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RegistrationRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RegistrationRecord;
  }

  @override
  void update(void Function(RegistrationRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RegistrationRecord build() => _build();

  _$RegistrationRecord _build() {
    _$RegistrationRecord _$result;
    try {
      _$result = _$v ??
          new _$RegistrationRecord._(
              displayName: displayName,
              email: email,
              photoUrl: photoUrl,
              createdTime: createdTime,
              uid: uid,
              createdBy: createdBy,
              birthDate: birthDate,
              age: age,
              gender: gender,
              nationality: nationality,
              civilStatus: civilStatus,
              appointmentDate: appointmentDate,
              iDUrl: _iDUrl?.build(),
              isDeleted: isDeleted,
              expiryDate: expiryDate,
              isConfirmbySA: isConfirmbySA,
              phoneNumber: phoneNumber,
              isDeclined: isDeclined,
              reason: reason,
              streetAddress: streetAddress,
              aptSuiteorUnitAddress: aptSuiteorUnitAddress,
              city: city,
              province: province,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'iDUrl';
        _iDUrl?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'RegistrationRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
