// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monthly_created_event_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MonthlyCreatedEventRecord> _$monthlyCreatedEventRecordSerializer =
    new _$MonthlyCreatedEventRecordSerializer();

class _$MonthlyCreatedEventRecordSerializer
    implements StructuredSerializer<MonthlyCreatedEventRecord> {
  @override
  final Iterable<Type> types = const [
    MonthlyCreatedEventRecord,
    _$MonthlyCreatedEventRecord
  ];
  @override
  final String wireName = 'MonthlyCreatedEventRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, MonthlyCreatedEventRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.january;
    if (value != null) {
      result
        ..add('January')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.february;
    if (value != null) {
      result
        ..add('February')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.march;
    if (value != null) {
      result
        ..add('March')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.april;
    if (value != null) {
      result
        ..add('April')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.may;
    if (value != null) {
      result
        ..add('May')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.june;
    if (value != null) {
      result
        ..add('June')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.july;
    if (value != null) {
      result
        ..add('July')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.august;
    if (value != null) {
      result
        ..add('August')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.september;
    if (value != null) {
      result
        ..add('September')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.october;
    if (value != null) {
      result
        ..add('October')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.november;
    if (value != null) {
      result
        ..add('November')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.december;
    if (value != null) {
      result
        ..add('December')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.createdDate;
    if (value != null) {
      result
        ..add('created_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.total;
    if (value != null) {
      result
        ..add('total')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
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
  MonthlyCreatedEventRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MonthlyCreatedEventRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'January':
          result.january = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'February':
          result.february = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'March':
          result.march = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'April':
          result.april = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'May':
          result.may = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'June':
          result.june = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'July':
          result.july = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'August':
          result.august = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'September':
          result.september = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'October':
          result.october = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'November':
          result.november = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'December':
          result.december = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'created_date':
          result.createdDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'total':
          result.total = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
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

class _$MonthlyCreatedEventRecord extends MonthlyCreatedEventRecord {
  @override
  final int? january;
  @override
  final int? february;
  @override
  final int? march;
  @override
  final int? april;
  @override
  final int? may;
  @override
  final int? june;
  @override
  final int? july;
  @override
  final int? august;
  @override
  final int? september;
  @override
  final int? october;
  @override
  final int? november;
  @override
  final int? december;
  @override
  final DateTime? createdDate;
  @override
  final double? total;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$MonthlyCreatedEventRecord(
          [void Function(MonthlyCreatedEventRecordBuilder)? updates]) =>
      (new MonthlyCreatedEventRecordBuilder()..update(updates))._build();

  _$MonthlyCreatedEventRecord._(
      {this.january,
      this.february,
      this.march,
      this.april,
      this.may,
      this.june,
      this.july,
      this.august,
      this.september,
      this.october,
      this.november,
      this.december,
      this.createdDate,
      this.total,
      this.ffRef})
      : super._();

  @override
  MonthlyCreatedEventRecord rebuild(
          void Function(MonthlyCreatedEventRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MonthlyCreatedEventRecordBuilder toBuilder() =>
      new MonthlyCreatedEventRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MonthlyCreatedEventRecord &&
        january == other.january &&
        february == other.february &&
        march == other.march &&
        april == other.april &&
        may == other.may &&
        june == other.june &&
        july == other.july &&
        august == other.august &&
        september == other.september &&
        october == other.october &&
        november == other.november &&
        december == other.december &&
        createdDate == other.createdDate &&
        total == other.total &&
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
                                                                0,
                                                                january
                                                                    .hashCode),
                                                            february.hashCode),
                                                        march.hashCode),
                                                    april.hashCode),
                                                may.hashCode),
                                            june.hashCode),
                                        july.hashCode),
                                    august.hashCode),
                                september.hashCode),
                            october.hashCode),
                        november.hashCode),
                    december.hashCode),
                createdDate.hashCode),
            total.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MonthlyCreatedEventRecord')
          ..add('january', january)
          ..add('february', february)
          ..add('march', march)
          ..add('april', april)
          ..add('may', may)
          ..add('june', june)
          ..add('july', july)
          ..add('august', august)
          ..add('september', september)
          ..add('october', october)
          ..add('november', november)
          ..add('december', december)
          ..add('createdDate', createdDate)
          ..add('total', total)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class MonthlyCreatedEventRecordBuilder
    implements
        Builder<MonthlyCreatedEventRecord, MonthlyCreatedEventRecordBuilder> {
  _$MonthlyCreatedEventRecord? _$v;

  int? _january;
  int? get january => _$this._january;
  set january(int? january) => _$this._january = january;

  int? _february;
  int? get february => _$this._february;
  set february(int? february) => _$this._february = february;

  int? _march;
  int? get march => _$this._march;
  set march(int? march) => _$this._march = march;

  int? _april;
  int? get april => _$this._april;
  set april(int? april) => _$this._april = april;

  int? _may;
  int? get may => _$this._may;
  set may(int? may) => _$this._may = may;

  int? _june;
  int? get june => _$this._june;
  set june(int? june) => _$this._june = june;

  int? _july;
  int? get july => _$this._july;
  set july(int? july) => _$this._july = july;

  int? _august;
  int? get august => _$this._august;
  set august(int? august) => _$this._august = august;

  int? _september;
  int? get september => _$this._september;
  set september(int? september) => _$this._september = september;

  int? _october;
  int? get october => _$this._october;
  set october(int? october) => _$this._october = october;

  int? _november;
  int? get november => _$this._november;
  set november(int? november) => _$this._november = november;

  int? _december;
  int? get december => _$this._december;
  set december(int? december) => _$this._december = december;

  DateTime? _createdDate;
  DateTime? get createdDate => _$this._createdDate;
  set createdDate(DateTime? createdDate) => _$this._createdDate = createdDate;

  double? _total;
  double? get total => _$this._total;
  set total(double? total) => _$this._total = total;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  MonthlyCreatedEventRecordBuilder() {
    MonthlyCreatedEventRecord._initializeBuilder(this);
  }

  MonthlyCreatedEventRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _january = $v.january;
      _february = $v.february;
      _march = $v.march;
      _april = $v.april;
      _may = $v.may;
      _june = $v.june;
      _july = $v.july;
      _august = $v.august;
      _september = $v.september;
      _october = $v.october;
      _november = $v.november;
      _december = $v.december;
      _createdDate = $v.createdDate;
      _total = $v.total;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MonthlyCreatedEventRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MonthlyCreatedEventRecord;
  }

  @override
  void update(void Function(MonthlyCreatedEventRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MonthlyCreatedEventRecord build() => _build();

  _$MonthlyCreatedEventRecord _build() {
    final _$result = _$v ??
        new _$MonthlyCreatedEventRecord._(
            january: january,
            february: february,
            march: march,
            april: april,
            may: may,
            june: june,
            july: july,
            august: august,
            september: september,
            october: october,
            november: november,
            december: december,
            createdDate: createdDate,
            total: total,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
