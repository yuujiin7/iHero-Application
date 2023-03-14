// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inspiring_videos_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<InspiringVideosRecord> _$inspiringVideosRecordSerializer =
    new _$InspiringVideosRecordSerializer();

class _$InspiringVideosRecordSerializer
    implements StructuredSerializer<InspiringVideosRecord> {
  @override
  final Iterable<Type> types = const [
    InspiringVideosRecord,
    _$InspiringVideosRecord
  ];
  @override
  final String wireName = 'InspiringVideosRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, InspiringVideosRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.url;
    if (value != null) {
      result
        ..add('url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.youtube;
    if (value != null) {
      result
        ..add('youtube')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.title;
    if (value != null) {
      result
        ..add('title')
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
  InspiringVideosRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new InspiringVideosRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'youtube':
          result.youtube = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
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

class _$InspiringVideosRecord extends InspiringVideosRecord {
  @override
  final String? url;
  @override
  final String? youtube;
  @override
  final String? title;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$InspiringVideosRecord(
          [void Function(InspiringVideosRecordBuilder)? updates]) =>
      (new InspiringVideosRecordBuilder()..update(updates))._build();

  _$InspiringVideosRecord._({this.url, this.youtube, this.title, this.ffRef})
      : super._();

  @override
  InspiringVideosRecord rebuild(
          void Function(InspiringVideosRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InspiringVideosRecordBuilder toBuilder() =>
      new InspiringVideosRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InspiringVideosRecord &&
        url == other.url &&
        youtube == other.youtube &&
        title == other.title &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, url.hashCode), youtube.hashCode), title.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'InspiringVideosRecord')
          ..add('url', url)
          ..add('youtube', youtube)
          ..add('title', title)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class InspiringVideosRecordBuilder
    implements Builder<InspiringVideosRecord, InspiringVideosRecordBuilder> {
  _$InspiringVideosRecord? _$v;

  String? _url;
  String? get url => _$this._url;
  set url(String? url) => _$this._url = url;

  String? _youtube;
  String? get youtube => _$this._youtube;
  set youtube(String? youtube) => _$this._youtube = youtube;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  InspiringVideosRecordBuilder() {
    InspiringVideosRecord._initializeBuilder(this);
  }

  InspiringVideosRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _url = $v.url;
      _youtube = $v.youtube;
      _title = $v.title;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InspiringVideosRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$InspiringVideosRecord;
  }

  @override
  void update(void Function(InspiringVideosRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  InspiringVideosRecord build() => _build();

  _$InspiringVideosRecord _build() {
    final _$result = _$v ??
        new _$InspiringVideosRecord._(
            url: url, youtube: youtube, title: title, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
