// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dietas_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DietasRecord> _$dietasRecordSerializer =
    new _$DietasRecordSerializer();

class _$DietasRecordSerializer implements StructuredSerializer<DietasRecord> {
  @override
  final Iterable<Type> types = const [DietasRecord, _$DietasRecord];
  @override
  final String wireName = 'DietasRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, DietasRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.dietaUrl;
    if (value != null) {
      result
        ..add('dietaUrl')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    return result;
  }

  @override
  DietasRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DietasRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'dietaUrl':
          result.dietaUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
      }
    }

    return result.build();
  }
}

class _$DietasRecord extends DietasRecord {
  @override
  final String dietaUrl;
  @override
  final DateTime createdAt;
  @override
  final DocumentReference<Object> reference;

  factory _$DietasRecord([void Function(DietasRecordBuilder) updates]) =>
      (new DietasRecordBuilder()..update(updates)).build();

  _$DietasRecord._({this.dietaUrl, this.createdAt, this.reference}) : super._();

  @override
  DietasRecord rebuild(void Function(DietasRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DietasRecordBuilder toBuilder() => new DietasRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DietasRecord &&
        dietaUrl == other.dietaUrl &&
        createdAt == other.createdAt &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, dietaUrl.hashCode), createdAt.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DietasRecord')
          ..add('dietaUrl', dietaUrl)
          ..add('createdAt', createdAt)
          ..add('reference', reference))
        .toString();
  }
}

class DietasRecordBuilder
    implements Builder<DietasRecord, DietasRecordBuilder> {
  _$DietasRecord _$v;

  String _dietaUrl;
  String get dietaUrl => _$this._dietaUrl;
  set dietaUrl(String dietaUrl) => _$this._dietaUrl = dietaUrl;

  DateTime _createdAt;
  DateTime get createdAt => _$this._createdAt;
  set createdAt(DateTime createdAt) => _$this._createdAt = createdAt;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  DietasRecordBuilder() {
    DietasRecord._initializeBuilder(this);
  }

  DietasRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _dietaUrl = $v.dietaUrl;
      _createdAt = $v.createdAt;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DietasRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DietasRecord;
  }

  @override
  void update(void Function(DietasRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DietasRecord build() {
    final _$result = _$v ??
        new _$DietasRecord._(
            dietaUrl: dietaUrl, createdAt: createdAt, reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
