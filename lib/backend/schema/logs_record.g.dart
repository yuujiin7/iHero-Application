// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logs_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LogsRecord> _$logsRecordSerializer = new _$LogsRecordSerializer();

class _$LogsRecordSerializer implements StructuredSerializer<LogsRecord> {
  @override
  final Iterable<Type> types = const [LogsRecord, _$LogsRecord];
  @override
  final String wireName = 'LogsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, LogsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.date;
    if (value != null) {
      result
        ..add('Date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.action;
    if (value != null) {
      result
        ..add('Action')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userRef;
    if (value != null) {
      result
        ..add('userRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.fileUrl;
    if (value != null) {
      result
        ..add('FileUrl')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.eventRef;
    if (value != null) {
      result
        ..add('eventRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.announcementRef;
    if (value != null) {
      result
        ..add('announcementRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
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
  LogsRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LogsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'Date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'Action':
          result.action = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'userRef':
          result.userRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'FileUrl':
          result.fileUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'eventRef':
          result.eventRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'announcementRef':
          result.announcementRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
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

class _$LogsRecord extends LogsRecord {
  @override
  final DateTime? date;
  @override
  final String? action;
  @override
  final DocumentReference<Object?>? userRef;
  @override
  final String? fileUrl;
  @override
  final DocumentReference<Object?>? eventRef;
  @override
  final DocumentReference<Object?>? announcementRef;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$LogsRecord([void Function(LogsRecordBuilder)? updates]) =>
      (new LogsRecordBuilder()..update(updates))._build();

  _$LogsRecord._(
      {this.date,
      this.action,
      this.userRef,
      this.fileUrl,
      this.eventRef,
      this.announcementRef,
      this.ffRef})
      : super._();

  @override
  LogsRecord rebuild(void Function(LogsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LogsRecordBuilder toBuilder() => new LogsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LogsRecord &&
        date == other.date &&
        action == other.action &&
        userRef == other.userRef &&
        fileUrl == other.fileUrl &&
        eventRef == other.eventRef &&
        announcementRef == other.announcementRef &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, date.hashCode);
    _$hash = $jc(_$hash, action.hashCode);
    _$hash = $jc(_$hash, userRef.hashCode);
    _$hash = $jc(_$hash, fileUrl.hashCode);
    _$hash = $jc(_$hash, eventRef.hashCode);
    _$hash = $jc(_$hash, announcementRef.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LogsRecord')
          ..add('date', date)
          ..add('action', action)
          ..add('userRef', userRef)
          ..add('fileUrl', fileUrl)
          ..add('eventRef', eventRef)
          ..add('announcementRef', announcementRef)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class LogsRecordBuilder implements Builder<LogsRecord, LogsRecordBuilder> {
  _$LogsRecord? _$v;

  DateTime? _date;
  DateTime? get date => _$this._date;
  set date(DateTime? date) => _$this._date = date;

  String? _action;
  String? get action => _$this._action;
  set action(String? action) => _$this._action = action;

  DocumentReference<Object?>? _userRef;
  DocumentReference<Object?>? get userRef => _$this._userRef;
  set userRef(DocumentReference<Object?>? userRef) => _$this._userRef = userRef;

  String? _fileUrl;
  String? get fileUrl => _$this._fileUrl;
  set fileUrl(String? fileUrl) => _$this._fileUrl = fileUrl;

  DocumentReference<Object?>? _eventRef;
  DocumentReference<Object?>? get eventRef => _$this._eventRef;
  set eventRef(DocumentReference<Object?>? eventRef) =>
      _$this._eventRef = eventRef;

  DocumentReference<Object?>? _announcementRef;
  DocumentReference<Object?>? get announcementRef => _$this._announcementRef;
  set announcementRef(DocumentReference<Object?>? announcementRef) =>
      _$this._announcementRef = announcementRef;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  LogsRecordBuilder() {
    LogsRecord._initializeBuilder(this);
  }

  LogsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _date = $v.date;
      _action = $v.action;
      _userRef = $v.userRef;
      _fileUrl = $v.fileUrl;
      _eventRef = $v.eventRef;
      _announcementRef = $v.announcementRef;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LogsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LogsRecord;
  }

  @override
  void update(void Function(LogsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LogsRecord build() => _build();

  _$LogsRecord _build() {
    final _$result = _$v ??
        new _$LogsRecord._(
            date: date,
            action: action,
            userRef: userRef,
            fileUrl: fileUrl,
            eventRef: eventRef,
            announcementRef: announcementRef,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
