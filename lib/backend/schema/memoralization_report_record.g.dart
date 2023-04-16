// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memoralization_report_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MemoralizationReportRecord> _$memoralizationReportRecordSerializer =
    new _$MemoralizationReportRecordSerializer();

class _$MemoralizationReportRecordSerializer
    implements StructuredSerializer<MemoralizationReportRecord> {
  @override
  final Iterable<Type> types = const [
    MemoralizationReportRecord,
    _$MemoralizationReportRecord
  ];
  @override
  final String wireName = 'MemoralizationReportRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, MemoralizationReportRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.fullName;
    if (value != null) {
      result
        ..add('fullName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.dateOfDeath;
    if (value != null) {
      result
        ..add('dateOfDeath')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.photoUrl;
    if (value != null) {
      result
        ..add('photo_url')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.reportBy;
    if (value != null) {
      result
        ..add('report_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.reportedAt;
    if (value != null) {
      result
        ..add('reported_at')
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
    value = object.isDeleted;
    if (value != null) {
      result
        ..add('isDeleted')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.expiryDate;
    if (value != null) {
      result
        ..add('expiry_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.isSeen;
    if (value != null) {
      result
        ..add('isSeen')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
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
  MemoralizationReportRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MemoralizationReportRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'fullName':
          result.fullName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'dateOfDeath':
          result.dateOfDeath = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'photo_url':
          result.photoUrl.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'report_by':
          result.reportBy = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'reported_at':
          result.reportedAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'isConfirmbySA':
          result.isConfirmbySA = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'isDeclined':
          result.isDeclined = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'reason':
          result.reason = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'isDeleted':
          result.isDeleted = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'expiry_date':
          result.expiryDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'isSeen':
          result.isSeen = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
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

class _$MemoralizationReportRecord extends MemoralizationReportRecord {
  @override
  final String? fullName;
  @override
  final DateTime? dateOfDeath;
  @override
  final BuiltList<String>? photoUrl;
  @override
  final DocumentReference<Object?>? reportBy;
  @override
  final DateTime? reportedAt;
  @override
  final bool? isConfirmbySA;
  @override
  final bool? isDeclined;
  @override
  final String? reason;
  @override
  final String? isDeleted;
  @override
  final DateTime? expiryDate;
  @override
  final bool? isSeen;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$MemoralizationReportRecord(
          [void Function(MemoralizationReportRecordBuilder)? updates]) =>
      (new MemoralizationReportRecordBuilder()..update(updates))._build();

  _$MemoralizationReportRecord._(
      {this.fullName,
      this.dateOfDeath,
      this.photoUrl,
      this.reportBy,
      this.reportedAt,
      this.isConfirmbySA,
      this.isDeclined,
      this.reason,
      this.isDeleted,
      this.expiryDate,
      this.isSeen,
      this.ffRef})
      : super._();

  @override
  MemoralizationReportRecord rebuild(
          void Function(MemoralizationReportRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MemoralizationReportRecordBuilder toBuilder() =>
      new MemoralizationReportRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MemoralizationReportRecord &&
        fullName == other.fullName &&
        dateOfDeath == other.dateOfDeath &&
        photoUrl == other.photoUrl &&
        reportBy == other.reportBy &&
        reportedAt == other.reportedAt &&
        isConfirmbySA == other.isConfirmbySA &&
        isDeclined == other.isDeclined &&
        reason == other.reason &&
        isDeleted == other.isDeleted &&
        expiryDate == other.expiryDate &&
        isSeen == other.isSeen &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, fullName.hashCode);
    _$hash = $jc(_$hash, dateOfDeath.hashCode);
    _$hash = $jc(_$hash, photoUrl.hashCode);
    _$hash = $jc(_$hash, reportBy.hashCode);
    _$hash = $jc(_$hash, reportedAt.hashCode);
    _$hash = $jc(_$hash, isConfirmbySA.hashCode);
    _$hash = $jc(_$hash, isDeclined.hashCode);
    _$hash = $jc(_$hash, reason.hashCode);
    _$hash = $jc(_$hash, isDeleted.hashCode);
    _$hash = $jc(_$hash, expiryDate.hashCode);
    _$hash = $jc(_$hash, isSeen.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MemoralizationReportRecord')
          ..add('fullName', fullName)
          ..add('dateOfDeath', dateOfDeath)
          ..add('photoUrl', photoUrl)
          ..add('reportBy', reportBy)
          ..add('reportedAt', reportedAt)
          ..add('isConfirmbySA', isConfirmbySA)
          ..add('isDeclined', isDeclined)
          ..add('reason', reason)
          ..add('isDeleted', isDeleted)
          ..add('expiryDate', expiryDate)
          ..add('isSeen', isSeen)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class MemoralizationReportRecordBuilder
    implements
        Builder<MemoralizationReportRecord, MemoralizationReportRecordBuilder> {
  _$MemoralizationReportRecord? _$v;

  String? _fullName;
  String? get fullName => _$this._fullName;
  set fullName(String? fullName) => _$this._fullName = fullName;

  DateTime? _dateOfDeath;
  DateTime? get dateOfDeath => _$this._dateOfDeath;
  set dateOfDeath(DateTime? dateOfDeath) => _$this._dateOfDeath = dateOfDeath;

  ListBuilder<String>? _photoUrl;
  ListBuilder<String> get photoUrl =>
      _$this._photoUrl ??= new ListBuilder<String>();
  set photoUrl(ListBuilder<String>? photoUrl) => _$this._photoUrl = photoUrl;

  DocumentReference<Object?>? _reportBy;
  DocumentReference<Object?>? get reportBy => _$this._reportBy;
  set reportBy(DocumentReference<Object?>? reportBy) =>
      _$this._reportBy = reportBy;

  DateTime? _reportedAt;
  DateTime? get reportedAt => _$this._reportedAt;
  set reportedAt(DateTime? reportedAt) => _$this._reportedAt = reportedAt;

  bool? _isConfirmbySA;
  bool? get isConfirmbySA => _$this._isConfirmbySA;
  set isConfirmbySA(bool? isConfirmbySA) =>
      _$this._isConfirmbySA = isConfirmbySA;

  bool? _isDeclined;
  bool? get isDeclined => _$this._isDeclined;
  set isDeclined(bool? isDeclined) => _$this._isDeclined = isDeclined;

  String? _reason;
  String? get reason => _$this._reason;
  set reason(String? reason) => _$this._reason = reason;

  String? _isDeleted;
  String? get isDeleted => _$this._isDeleted;
  set isDeleted(String? isDeleted) => _$this._isDeleted = isDeleted;

  DateTime? _expiryDate;
  DateTime? get expiryDate => _$this._expiryDate;
  set expiryDate(DateTime? expiryDate) => _$this._expiryDate = expiryDate;

  bool? _isSeen;
  bool? get isSeen => _$this._isSeen;
  set isSeen(bool? isSeen) => _$this._isSeen = isSeen;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  MemoralizationReportRecordBuilder() {
    MemoralizationReportRecord._initializeBuilder(this);
  }

  MemoralizationReportRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _fullName = $v.fullName;
      _dateOfDeath = $v.dateOfDeath;
      _photoUrl = $v.photoUrl?.toBuilder();
      _reportBy = $v.reportBy;
      _reportedAt = $v.reportedAt;
      _isConfirmbySA = $v.isConfirmbySA;
      _isDeclined = $v.isDeclined;
      _reason = $v.reason;
      _isDeleted = $v.isDeleted;
      _expiryDate = $v.expiryDate;
      _isSeen = $v.isSeen;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MemoralizationReportRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MemoralizationReportRecord;
  }

  @override
  void update(void Function(MemoralizationReportRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MemoralizationReportRecord build() => _build();

  _$MemoralizationReportRecord _build() {
    _$MemoralizationReportRecord _$result;
    try {
      _$result = _$v ??
          new _$MemoralizationReportRecord._(
              fullName: fullName,
              dateOfDeath: dateOfDeath,
              photoUrl: _photoUrl?.build(),
              reportBy: reportBy,
              reportedAt: reportedAt,
              isConfirmbySA: isConfirmbySA,
              isDeclined: isDeclined,
              reason: reason,
              isDeleted: isDeleted,
              expiryDate: expiryDate,
              isSeen: isSeen,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'photoUrl';
        _photoUrl?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'MemoralizationReportRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
