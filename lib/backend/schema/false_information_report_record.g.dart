// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'false_information_report_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FalseInformationReportRecord>
    _$falseInformationReportRecordSerializer =
    new _$FalseInformationReportRecordSerializer();

class _$FalseInformationReportRecordSerializer
    implements StructuredSerializer<FalseInformationReportRecord> {
  @override
  final Iterable<Type> types = const [
    FalseInformationReportRecord,
    _$FalseInformationReportRecord
  ];
  @override
  final String wireName = 'FalseInformationReportRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, FalseInformationReportRecord object,
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
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.reportDetail;
    if (value != null) {
      result
        ..add('reportDetail')
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
  FalseInformationReportRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FalseInformationReportRecordBuilder();

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
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'reportDetail':
          result.reportDetail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$FalseInformationReportRecord extends FalseInformationReportRecord {
  @override
  final String? fullName;
  @override
  final String? email;
  @override
  final String? reportDetail;
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
  final DocumentReference<Object?>? ffRef;

  factory _$FalseInformationReportRecord(
          [void Function(FalseInformationReportRecordBuilder)? updates]) =>
      (new FalseInformationReportRecordBuilder()..update(updates))._build();

  _$FalseInformationReportRecord._(
      {this.fullName,
      this.email,
      this.reportDetail,
      this.photoUrl,
      this.reportBy,
      this.reportedAt,
      this.isConfirmbySA,
      this.isDeclined,
      this.ffRef})
      : super._();

  @override
  FalseInformationReportRecord rebuild(
          void Function(FalseInformationReportRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FalseInformationReportRecordBuilder toBuilder() =>
      new FalseInformationReportRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FalseInformationReportRecord &&
        fullName == other.fullName &&
        email == other.email &&
        reportDetail == other.reportDetail &&
        photoUrl == other.photoUrl &&
        reportBy == other.reportBy &&
        reportedAt == other.reportedAt &&
        isConfirmbySA == other.isConfirmbySA &&
        isDeclined == other.isDeclined &&
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
                            $jc($jc($jc(0, fullName.hashCode), email.hashCode),
                                reportDetail.hashCode),
                            photoUrl.hashCode),
                        reportBy.hashCode),
                    reportedAt.hashCode),
                isConfirmbySA.hashCode),
            isDeclined.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FalseInformationReportRecord')
          ..add('fullName', fullName)
          ..add('email', email)
          ..add('reportDetail', reportDetail)
          ..add('photoUrl', photoUrl)
          ..add('reportBy', reportBy)
          ..add('reportedAt', reportedAt)
          ..add('isConfirmbySA', isConfirmbySA)
          ..add('isDeclined', isDeclined)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class FalseInformationReportRecordBuilder
    implements
        Builder<FalseInformationReportRecord,
            FalseInformationReportRecordBuilder> {
  _$FalseInformationReportRecord? _$v;

  String? _fullName;
  String? get fullName => _$this._fullName;
  set fullName(String? fullName) => _$this._fullName = fullName;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _reportDetail;
  String? get reportDetail => _$this._reportDetail;
  set reportDetail(String? reportDetail) => _$this._reportDetail = reportDetail;

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

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  FalseInformationReportRecordBuilder() {
    FalseInformationReportRecord._initializeBuilder(this);
  }

  FalseInformationReportRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _fullName = $v.fullName;
      _email = $v.email;
      _reportDetail = $v.reportDetail;
      _photoUrl = $v.photoUrl;
      _reportBy = $v.reportBy;
      _reportedAt = $v.reportedAt;
      _isConfirmbySA = $v.isConfirmbySA;
      _isDeclined = $v.isDeclined;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FalseInformationReportRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FalseInformationReportRecord;
  }

  @override
  void update(void Function(FalseInformationReportRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FalseInformationReportRecord build() => _build();

  _$FalseInformationReportRecord _build() {
    final _$result = _$v ??
        new _$FalseInformationReportRecord._(
            fullName: fullName,
            email: email,
            reportDetail: reportDetail,
            photoUrl: photoUrl,
            reportBy: reportBy,
            reportedAt: reportedAt,
            isConfirmbySA: isConfirmbySA,
            isDeclined: isDeclined,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
