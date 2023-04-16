// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CommentsRecord> _$commentsRecordSerializer =
    new _$CommentsRecordSerializer();

class _$CommentsRecordSerializer
    implements StructuredSerializer<CommentsRecord> {
  @override
  final Iterable<Type> types = const [CommentsRecord, _$CommentsRecord];
  @override
  final String wireName = 'CommentsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, CommentsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.createdBy;
    if (value != null) {
      result
        ..add('created_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.comment;
    if (value != null) {
      result
        ..add('comment')
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
  CommentsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CommentsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'created_by':
          result.createdBy = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'comment':
          result.comment = serializers.deserialize(value,
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

class _$CommentsRecord extends CommentsRecord {
  @override
  final DocumentReference<Object?>? createdBy;
  @override
  final DateTime? createdAt;
  @override
  final String? comment;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$CommentsRecord([void Function(CommentsRecordBuilder)? updates]) =>
      (new CommentsRecordBuilder()..update(updates))._build();

  _$CommentsRecord._({this.createdBy, this.createdAt, this.comment, this.ffRef})
      : super._();

  @override
  CommentsRecord rebuild(void Function(CommentsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CommentsRecordBuilder toBuilder() =>
      new CommentsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CommentsRecord &&
        createdBy == other.createdBy &&
        createdAt == other.createdAt &&
        comment == other.comment &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, createdBy.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, comment.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CommentsRecord')
          ..add('createdBy', createdBy)
          ..add('createdAt', createdAt)
          ..add('comment', comment)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class CommentsRecordBuilder
    implements Builder<CommentsRecord, CommentsRecordBuilder> {
  _$CommentsRecord? _$v;

  DocumentReference<Object?>? _createdBy;
  DocumentReference<Object?>? get createdBy => _$this._createdBy;
  set createdBy(DocumentReference<Object?>? createdBy) =>
      _$this._createdBy = createdBy;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  String? _comment;
  String? get comment => _$this._comment;
  set comment(String? comment) => _$this._comment = comment;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  CommentsRecordBuilder() {
    CommentsRecord._initializeBuilder(this);
  }

  CommentsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _createdBy = $v.createdBy;
      _createdAt = $v.createdAt;
      _comment = $v.comment;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CommentsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CommentsRecord;
  }

  @override
  void update(void Function(CommentsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CommentsRecord build() => _build();

  _$CommentsRecord _build() {
    final _$result = _$v ??
        new _$CommentsRecord._(
            createdBy: createdBy,
            createdAt: createdAt,
            comment: comment,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
