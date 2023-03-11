// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unethical_illegal_conduct_report_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UnethicalIllegalConductReportRecord>
    _$unethicalIllegalConductReportRecordSerializer =
    new _$UnethicalIllegalConductReportRecordSerializer();

class _$UnethicalIllegalConductReportRecordSerializer
    implements StructuredSerializer<UnethicalIllegalConductReportRecord> {
  @override
  final Iterable<Type> types = const [
    UnethicalIllegalConductReportRecord,
    _$UnethicalIllegalConductReportRecord
  ];
  @override
  final String wireName = 'UnethicalIllegalConductReportRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, UnethicalIllegalConductReportRecord object,
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
    value = object.reportBehavior;
    if (value != null) {
      result
        ..add('report_behavior')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.dateOfIncident;
    if (value != null) {
      result
        ..add('dateOfIncident')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.photoUrl;
    if (value != null) {
      result
        ..add('photo_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
    value = object.expiryDate;
    if (value != null) {
      result
        ..add('expiry_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.isDeleted;
    if (value != null) {
      result
        ..add('isDeleted')
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
  UnethicalIllegalConductReportRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UnethicalIllegalConductReportRecordBuilder();

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
        case 'report_behavior':
          result.reportBehavior.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'dateOfIncident':
          result.dateOfIncident = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'photo_url':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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
        case 'expiry_date':
          result.expiryDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'isDeleted':
          result.isDeleted = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'reason':
          result.reason = serializers.deserialize(value,
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

class _$UnethicalIllegalConductReportRecord
    extends UnethicalIllegalConductReportRecord {
  @override
  final String? fullName;
  @override
  final BuiltList<String>? reportBehavior;
  @override
  final DateTime? dateOfIncident;
  @override
  final String? photoUrl;
  @override
  final DocumentReference<Object?>? reportBy;
  @override
  final DateTime? reportedAt;
  @override
  final bool? isConfirmbySA;
  @override
  final bool? isDeclined;
  @override
  final DateTime? expiryDate;
  @override
  final bool? isDeleted;
  @override
  final String? reason;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$UnethicalIllegalConductReportRecord(
          [void Function(UnethicalIllegalConductReportRecordBuilder)?
              updates]) =>
      (new UnethicalIllegalConductReportRecordBuilder()..update(updates))
          ._build();

  _$UnethicalIllegalConductReportRecord._(
      {this.fullName,
      this.reportBehavior,
      this.dateOfIncident,
      this.photoUrl,
      this.reportBy,
      this.reportedAt,
      this.isConfirmbySA,
      this.isDeclined,
      this.expiryDate,
      this.isDeleted,
      this.reason,
      this.ffRef})
      : super._();

  @override
  UnethicalIllegalConductReportRecord rebuild(
          void Function(UnethicalIllegalConductReportRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UnethicalIllegalConductReportRecordBuilder toBuilder() =>
      new UnethicalIllegalConductReportRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UnethicalIllegalConductReportRecord &&
        fullName == other.fullName &&
        reportBehavior == other.reportBehavior &&
        dateOfIncident == other.dateOfIncident &&
        photoUrl == other.photoUrl &&
        reportBy == other.reportBy &&
        reportedAt == other.reportedAt &&
        isConfirmbySA == other.isConfirmbySA &&
        isDeclined == other.isDeclined &&
        expiryDate == other.expiryDate &&
        isDeleted == other.isDeleted &&
        reason == other.reason &&
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
                                            $jc($jc(0, fullName.hashCode),
                                                reportBehavior.hashCode),
                                            dateOfIncident.hashCode),
                                        photoUrl.hashCode),
                                    reportBy.hashCode),
                                reportedAt.hashCode),
                            isConfirmbySA.hashCode),
                        isDeclined.hashCode),
                    expiryDate.hashCode),
                isDeleted.hashCode),
            reason.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UnethicalIllegalConductReportRecord')
          ..add('fullName', fullName)
          ..add('reportBehavior', reportBehavior)
          ..add('dateOfIncident', dateOfIncident)
          ..add('photoUrl', photoUrl)
          ..add('reportBy', reportBy)
          ..add('reportedAt', reportedAt)
          ..add('isConfirmbySA', isConfirmbySA)
          ..add('isDeclined', isDeclined)
          ..add('expiryDate', expiryDate)
          ..add('isDeleted', isDeleted)
          ..add('reason', reason)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class UnethicalIllegalConductReportRecordBuilder
    implements
        Builder<UnethicalIllegalConductReportRecord,
            UnethicalIllegalConductReportRecordBuilder> {
  _$UnethicalIllegalConductReportRecord? _$v;

  String? _fullName;
  String? get fullName => _$this._fullName;
  set fullName(String? fullName) => _$this._fullName = fullName;

  ListBuilder<String>? _reportBehavior;
  ListBuilder<String> get reportBehavior =>
      _$this._reportBehavior ??= new ListBuilder<String>();
  set reportBehavior(ListBuilder<String>? reportBehavior) =>
      _$this._reportBehavior = reportBehavior;

  DateTime? _dateOfIncident;
  DateTime? get dateOfIncident => _$this._dateOfIncident;
  set dateOfIncident(DateTime? dateOfIncident) =>
      _$this._dateOfIncident = dateOfIncident;

  String? _photoUrl;
  String? get photoUrl => _$this._photoUrl;
  set photoUrl(String? photoUrl) => _$this._photoUrl = photoUrl;

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

  DateTime? _expiryDate;
  DateTime? get expiryDate => _$this._expiryDate;
  set expiryDate(DateTime? expiryDate) => _$this._expiryDate = expiryDate;

  bool? _isDeleted;
  bool? get isDeleted => _$this._isDeleted;
  set isDeleted(bool? isDeleted) => _$this._isDeleted = isDeleted;

  String? _reason;
  String? get reason => _$this._reason;
  set reason(String? reason) => _$this._reason = reason;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  UnethicalIllegalConductReportRecordBuilder() {
    UnethicalIllegalConductReportRecord._initializeBuilder(this);
  }

  UnethicalIllegalConductReportRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _fullName = $v.fullName;
      _reportBehavior = $v.reportBehavior?.toBuilder();
      _dateOfIncident = $v.dateOfIncident;
      _photoUrl = $v.photoUrl;
      _reportBy = $v.reportBy;
      _reportedAt = $v.reportedAt;
      _isConfirmbySA = $v.isConfirmbySA;
      _isDeclined = $v.isDeclined;
      _expiryDate = $v.expiryDate;
      _isDeleted = $v.isDeleted;
      _reason = $v.reason;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UnethicalIllegalConductReportRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UnethicalIllegalConductReportRecord;
  }

  @override
  void update(
      void Function(UnethicalIllegalConductReportRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UnethicalIllegalConductReportRecord build() => _build();

  _$UnethicalIllegalConductReportRecord _build() {
    _$UnethicalIllegalConductReportRecord _$result;
    try {
      _$result = _$v ??
          new _$UnethicalIllegalConductReportRecord._(
              fullName: fullName,
              reportBehavior: _reportBehavior?.build(),
              dateOfIncident: dateOfIncident,
              photoUrl: photoUrl,
              reportBy: reportBy,
              reportedAt: reportedAt,
              isConfirmbySA: isConfirmbySA,
              isDeclined: isDeclined,
              expiryDate: expiryDate,
              isDeleted: isDeleted,
              reason: reason,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'reportBehavior';
        _reportBehavior?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UnethicalIllegalConductReportRecord',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
