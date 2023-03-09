// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments_and_rate_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CommentsAndRateRecord> _$commentsAndRateRecordSerializer =
    new _$CommentsAndRateRecordSerializer();

class _$CommentsAndRateRecordSerializer
    implements StructuredSerializer<CommentsAndRateRecord> {
  @override
  final Iterable<Type> types = const [
    CommentsAndRateRecord,
    _$CommentsAndRateRecord
  ];
  @override
  final String wireName = 'CommentsAndRateRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, CommentsAndRateRecord object,
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
    value = object.rating;
    if (value != null) {
      result
        ..add('rating')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.postType;
    if (value != null) {
      result
        ..add('post_type')
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
  CommentsAndRateRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CommentsAndRateRecordBuilder();

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
        case 'rating':
          result.rating = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'post_type':
          result.postType = serializers.deserialize(value,
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

class _$CommentsAndRateRecord extends CommentsAndRateRecord {
  @override
  final DocumentReference<Object?>? createdBy;
  @override
  final DateTime? createdAt;
  @override
  final String? comment;
  @override
  final double? rating;
  @override
  final DocumentReference<Object?>? postType;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$CommentsAndRateRecord(
          [void Function(CommentsAndRateRecordBuilder)? updates]) =>
      (new CommentsAndRateRecordBuilder()..update(updates))._build();

  _$CommentsAndRateRecord._(
      {this.createdBy,
      this.createdAt,
      this.comment,
      this.rating,
      this.postType,
      this.ffRef})
      : super._();

  @override
  CommentsAndRateRecord rebuild(
          void Function(CommentsAndRateRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CommentsAndRateRecordBuilder toBuilder() =>
      new CommentsAndRateRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CommentsAndRateRecord &&
        createdBy == other.createdBy &&
        createdAt == other.createdAt &&
        comment == other.comment &&
        rating == other.rating &&
        postType == other.postType &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, createdBy.hashCode), createdAt.hashCode),
                    comment.hashCode),
                rating.hashCode),
            postType.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CommentsAndRateRecord')
          ..add('createdBy', createdBy)
          ..add('createdAt', createdAt)
          ..add('comment', comment)
          ..add('rating', rating)
          ..add('postType', postType)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class CommentsAndRateRecordBuilder
    implements Builder<CommentsAndRateRecord, CommentsAndRateRecordBuilder> {
  _$CommentsAndRateRecord? _$v;

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

  double? _rating;
  double? get rating => _$this._rating;
  set rating(double? rating) => _$this._rating = rating;

  DocumentReference<Object?>? _postType;
  DocumentReference<Object?>? get postType => _$this._postType;
  set postType(DocumentReference<Object?>? postType) =>
      _$this._postType = postType;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  CommentsAndRateRecordBuilder() {
    CommentsAndRateRecord._initializeBuilder(this);
  }

  CommentsAndRateRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _createdBy = $v.createdBy;
      _createdAt = $v.createdAt;
      _comment = $v.comment;
      _rating = $v.rating;
      _postType = $v.postType;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CommentsAndRateRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CommentsAndRateRecord;
  }

  @override
  void update(void Function(CommentsAndRateRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CommentsAndRateRecord build() => _build();

  _$CommentsAndRateRecord _build() {
    final _$result = _$v ??
        new _$CommentsAndRateRecord._(
            createdBy: createdBy,
            createdAt: createdAt,
            comment: comment,
            rating: rating,
            postType: postType,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
