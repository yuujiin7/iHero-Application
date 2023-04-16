// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcement_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AnnouncementRecord> _$announcementRecordSerializer =
    new _$AnnouncementRecordSerializer();

class _$AnnouncementRecordSerializer
    implements StructuredSerializer<AnnouncementRecord> {
  @override
  final Iterable<Type> types = const [AnnouncementRecord, _$AnnouncementRecord];
  @override
  final String wireName = 'AnnouncementRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, AnnouncementRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.body;
    if (value != null) {
      result
        ..add('body')
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
    value = object.createdBy;
    if (value != null) {
      result
        ..add('created_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.likedBy;
    if (value != null) {
      result
        ..add('liked_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
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
    value = object.isConfirmbySA;
    if (value != null) {
      result
        ..add('isConfirmbySA')
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
  AnnouncementRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AnnouncementRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'body':
          result.body = serializers.deserialize(value,
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
        case 'created_by':
          result.createdBy = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'liked_by':
          result.likedBy.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'expiry_date':
          result.expiryDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'isDeleted':
          result.isDeleted = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'isConfirmbySA':
          result.isConfirmbySA = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'reason':
          result.reason = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$AnnouncementRecord extends AnnouncementRecord {
  @override
  final String? title;
  @override
  final String? body;
  @override
  final String? photoUrl;
  @override
  final DateTime? createdTime;
  @override
  final DocumentReference<Object?>? createdBy;
  @override
  final BuiltList<DocumentReference<Object?>>? likedBy;
  @override
  final DateTime? expiryDate;
  @override
  final bool? isDeleted;
  @override
  final bool? isConfirmbySA;
  @override
  final String? reason;
  @override
  final bool? isDeclined;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$AnnouncementRecord(
          [void Function(AnnouncementRecordBuilder)? updates]) =>
      (new AnnouncementRecordBuilder()..update(updates))._build();

  _$AnnouncementRecord._(
      {this.title,
      this.body,
      this.photoUrl,
      this.createdTime,
      this.createdBy,
      this.likedBy,
      this.expiryDate,
      this.isDeleted,
      this.isConfirmbySA,
      this.reason,
      this.isDeclined,
      this.ffRef})
      : super._();

  @override
  AnnouncementRecord rebuild(
          void Function(AnnouncementRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AnnouncementRecordBuilder toBuilder() =>
      new AnnouncementRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AnnouncementRecord &&
        title == other.title &&
        body == other.body &&
        photoUrl == other.photoUrl &&
        createdTime == other.createdTime &&
        createdBy == other.createdBy &&
        likedBy == other.likedBy &&
        expiryDate == other.expiryDate &&
        isDeleted == other.isDeleted &&
        isConfirmbySA == other.isConfirmbySA &&
        reason == other.reason &&
        isDeclined == other.isDeclined &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, body.hashCode);
    _$hash = $jc(_$hash, photoUrl.hashCode);
    _$hash = $jc(_$hash, createdTime.hashCode);
    _$hash = $jc(_$hash, createdBy.hashCode);
    _$hash = $jc(_$hash, likedBy.hashCode);
    _$hash = $jc(_$hash, expiryDate.hashCode);
    _$hash = $jc(_$hash, isDeleted.hashCode);
    _$hash = $jc(_$hash, isConfirmbySA.hashCode);
    _$hash = $jc(_$hash, reason.hashCode);
    _$hash = $jc(_$hash, isDeclined.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AnnouncementRecord')
          ..add('title', title)
          ..add('body', body)
          ..add('photoUrl', photoUrl)
          ..add('createdTime', createdTime)
          ..add('createdBy', createdBy)
          ..add('likedBy', likedBy)
          ..add('expiryDate', expiryDate)
          ..add('isDeleted', isDeleted)
          ..add('isConfirmbySA', isConfirmbySA)
          ..add('reason', reason)
          ..add('isDeclined', isDeclined)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class AnnouncementRecordBuilder
    implements Builder<AnnouncementRecord, AnnouncementRecordBuilder> {
  _$AnnouncementRecord? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _body;
  String? get body => _$this._body;
  set body(String? body) => _$this._body = body;

  String? _photoUrl;
  String? get photoUrl => _$this._photoUrl;
  set photoUrl(String? photoUrl) => _$this._photoUrl = photoUrl;

  DateTime? _createdTime;
  DateTime? get createdTime => _$this._createdTime;
  set createdTime(DateTime? createdTime) => _$this._createdTime = createdTime;

  DocumentReference<Object?>? _createdBy;
  DocumentReference<Object?>? get createdBy => _$this._createdBy;
  set createdBy(DocumentReference<Object?>? createdBy) =>
      _$this._createdBy = createdBy;

  ListBuilder<DocumentReference<Object?>>? _likedBy;
  ListBuilder<DocumentReference<Object?>> get likedBy =>
      _$this._likedBy ??= new ListBuilder<DocumentReference<Object?>>();
  set likedBy(ListBuilder<DocumentReference<Object?>>? likedBy) =>
      _$this._likedBy = likedBy;

  DateTime? _expiryDate;
  DateTime? get expiryDate => _$this._expiryDate;
  set expiryDate(DateTime? expiryDate) => _$this._expiryDate = expiryDate;

  bool? _isDeleted;
  bool? get isDeleted => _$this._isDeleted;
  set isDeleted(bool? isDeleted) => _$this._isDeleted = isDeleted;

  bool? _isConfirmbySA;
  bool? get isConfirmbySA => _$this._isConfirmbySA;
  set isConfirmbySA(bool? isConfirmbySA) =>
      _$this._isConfirmbySA = isConfirmbySA;

  String? _reason;
  String? get reason => _$this._reason;
  set reason(String? reason) => _$this._reason = reason;

  bool? _isDeclined;
  bool? get isDeclined => _$this._isDeclined;
  set isDeclined(bool? isDeclined) => _$this._isDeclined = isDeclined;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  AnnouncementRecordBuilder() {
    AnnouncementRecord._initializeBuilder(this);
  }

  AnnouncementRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _body = $v.body;
      _photoUrl = $v.photoUrl;
      _createdTime = $v.createdTime;
      _createdBy = $v.createdBy;
      _likedBy = $v.likedBy?.toBuilder();
      _expiryDate = $v.expiryDate;
      _isDeleted = $v.isDeleted;
      _isConfirmbySA = $v.isConfirmbySA;
      _reason = $v.reason;
      _isDeclined = $v.isDeclined;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AnnouncementRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AnnouncementRecord;
  }

  @override
  void update(void Function(AnnouncementRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AnnouncementRecord build() => _build();

  _$AnnouncementRecord _build() {
    _$AnnouncementRecord _$result;
    try {
      _$result = _$v ??
          new _$AnnouncementRecord._(
              title: title,
              body: body,
              photoUrl: photoUrl,
              createdTime: createdTime,
              createdBy: createdBy,
              likedBy: _likedBy?.build(),
              expiryDate: expiryDate,
              isDeleted: isDeleted,
              isConfirmbySA: isConfirmbySA,
              reason: reason,
              isDeclined: isDeclined,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'likedBy';
        _likedBy?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AnnouncementRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
