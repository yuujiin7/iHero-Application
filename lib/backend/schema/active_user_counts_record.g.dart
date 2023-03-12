// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_user_counts_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ActiveUserCountsRecord> _$activeUserCountsRecordSerializer =
    new _$ActiveUserCountsRecordSerializer();

class _$ActiveUserCountsRecordSerializer
    implements StructuredSerializer<ActiveUserCountsRecord> {
  @override
  final Iterable<Type> types = const [
    ActiveUserCountsRecord,
    _$ActiveUserCountsRecord
  ];
  @override
  final String wireName = 'ActiveUserCountsRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ActiveUserCountsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.date;
    if (value != null) {
      result
        ..add('date')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.count;
    if (value != null) {
      result
        ..add('count')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.weekStart;
    if (value != null) {
      result
        ..add('week_start')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
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
  ActiveUserCountsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ActiveUserCountsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'count':
          result.count = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'week_start':
          result.weekStart = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
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

class _$ActiveUserCountsRecord extends ActiveUserCountsRecord {
  @override
  final int? date;
  @override
  final int? count;
  @override
  final DateTime? weekStart;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ActiveUserCountsRecord(
          [void Function(ActiveUserCountsRecordBuilder)? updates]) =>
      (new ActiveUserCountsRecordBuilder()..update(updates))._build();

  _$ActiveUserCountsRecord._(
      {this.date, this.count, this.weekStart, this.ffRef})
      : super._();

  @override
  ActiveUserCountsRecord rebuild(
          void Function(ActiveUserCountsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ActiveUserCountsRecordBuilder toBuilder() =>
      new ActiveUserCountsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ActiveUserCountsRecord &&
        date == other.date &&
        count == other.count &&
        weekStart == other.weekStart &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, date.hashCode), count.hashCode), weekStart.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ActiveUserCountsRecord')
          ..add('date', date)
          ..add('count', count)
          ..add('weekStart', weekStart)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ActiveUserCountsRecordBuilder
    implements Builder<ActiveUserCountsRecord, ActiveUserCountsRecordBuilder> {
  _$ActiveUserCountsRecord? _$v;

  int? _date;
  int? get date => _$this._date;
  set date(int? date) => _$this._date = date;

  int? _count;
  int? get count => _$this._count;
  set count(int? count) => _$this._count = count;

  DateTime? _weekStart;
  DateTime? get weekStart => _$this._weekStart;
  set weekStart(DateTime? weekStart) => _$this._weekStart = weekStart;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ActiveUserCountsRecordBuilder() {
    ActiveUserCountsRecord._initializeBuilder(this);
  }

  ActiveUserCountsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _date = $v.date;
      _count = $v.count;
      _weekStart = $v.weekStart;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ActiveUserCountsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ActiveUserCountsRecord;
  }

  @override
  void update(void Function(ActiveUserCountsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ActiveUserCountsRecord build() => _build();

  _$ActiveUserCountsRecord _build() {
    final _$result = _$v ??
        new _$ActiveUserCountsRecord._(
            date: date, count: count, weekStart: weekStart, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
