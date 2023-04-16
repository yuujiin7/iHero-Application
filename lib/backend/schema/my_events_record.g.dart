// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_events_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MyEventsRecord> _$myEventsRecordSerializer =
    new _$MyEventsRecordSerializer();

class _$MyEventsRecordSerializer
    implements StructuredSerializer<MyEventsRecord> {
  @override
  final Iterable<Type> types = const [MyEventsRecord, _$MyEventsRecord];
  @override
  final String wireName = 'MyEventsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, MyEventsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.dateJoined;
    if (value != null) {
      result
        ..add('dateJoined')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.eventReference;
    if (value != null) {
      result
        ..add('eventReference')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.userRef;
    if (value != null) {
      result
        ..add('userRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.dateCreated;
    if (value != null) {
      result
        ..add('dateCreated')
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
  MyEventsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MyEventsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'dateJoined':
          result.dateJoined = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'eventReference':
          result.eventReference = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'userRef':
          result.userRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'dateCreated':
          result.dateCreated = serializers.deserialize(value,
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

class _$MyEventsRecord extends MyEventsRecord {
  @override
  final DateTime? dateJoined;
  @override
  final DocumentReference<Object?>? eventReference;
  @override
  final DocumentReference<Object?>? userRef;
  @override
  final DateTime? dateCreated;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$MyEventsRecord([void Function(MyEventsRecordBuilder)? updates]) =>
      (new MyEventsRecordBuilder()..update(updates))._build();

  _$MyEventsRecord._(
      {this.dateJoined,
      this.eventReference,
      this.userRef,
      this.dateCreated,
      this.ffRef})
      : super._();

  @override
  MyEventsRecord rebuild(void Function(MyEventsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MyEventsRecordBuilder toBuilder() =>
      new MyEventsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MyEventsRecord &&
        dateJoined == other.dateJoined &&
        eventReference == other.eventReference &&
        userRef == other.userRef &&
        dateCreated == other.dateCreated &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, dateJoined.hashCode);
    _$hash = $jc(_$hash, eventReference.hashCode);
    _$hash = $jc(_$hash, userRef.hashCode);
    _$hash = $jc(_$hash, dateCreated.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MyEventsRecord')
          ..add('dateJoined', dateJoined)
          ..add('eventReference', eventReference)
          ..add('userRef', userRef)
          ..add('dateCreated', dateCreated)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class MyEventsRecordBuilder
    implements Builder<MyEventsRecord, MyEventsRecordBuilder> {
  _$MyEventsRecord? _$v;

  DateTime? _dateJoined;
  DateTime? get dateJoined => _$this._dateJoined;
  set dateJoined(DateTime? dateJoined) => _$this._dateJoined = dateJoined;

  DocumentReference<Object?>? _eventReference;
  DocumentReference<Object?>? get eventReference => _$this._eventReference;
  set eventReference(DocumentReference<Object?>? eventReference) =>
      _$this._eventReference = eventReference;

  DocumentReference<Object?>? _userRef;
  DocumentReference<Object?>? get userRef => _$this._userRef;
  set userRef(DocumentReference<Object?>? userRef) => _$this._userRef = userRef;

  DateTime? _dateCreated;
  DateTime? get dateCreated => _$this._dateCreated;
  set dateCreated(DateTime? dateCreated) => _$this._dateCreated = dateCreated;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  MyEventsRecordBuilder() {
    MyEventsRecord._initializeBuilder(this);
  }

  MyEventsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _dateJoined = $v.dateJoined;
      _eventReference = $v.eventReference;
      _userRef = $v.userRef;
      _dateCreated = $v.dateCreated;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MyEventsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MyEventsRecord;
  }

  @override
  void update(void Function(MyEventsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MyEventsRecord build() => _build();

  _$MyEventsRecord _build() {
    final _$result = _$v ??
        new _$MyEventsRecord._(
            dateJoined: dateJoined,
            eventReference: eventReference,
            userRef: userRef,
            dateCreated: dateCreated,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
