// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metas_user_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MetasUserRecord> _$metasUserRecordSerializer =
    new _$MetasUserRecordSerializer();

class _$MetasUserRecordSerializer
    implements StructuredSerializer<MetasUserRecord> {
  @override
  final Iterable<Type> types = const [MetasUserRecord, _$MetasUserRecord];
  @override
  final String wireName = 'MetasUserRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, MetasUserRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.tituloMeta;
    if (value != null) {
      result
        ..add('TituloMeta')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.descripcionMeta;
    if (value != null) {
      result
        ..add('DescripcionMeta')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.cumplido;
    if (value != null) {
      result
        ..add('Cumplido')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
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
  MetasUserRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MetasUserRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'TituloMeta':
          result.tituloMeta = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'DescripcionMeta':
          result.descripcionMeta = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Cumplido':
          result.cumplido = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
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

class _$MetasUserRecord extends MetasUserRecord {
  @override
  final String tituloMeta;
  @override
  final String descripcionMeta;
  @override
  final bool cumplido;
  @override
  final DocumentReference<Object> reference;

  factory _$MetasUserRecord([void Function(MetasUserRecordBuilder) updates]) =>
      (new MetasUserRecordBuilder()..update(updates)).build();

  _$MetasUserRecord._(
      {this.tituloMeta, this.descripcionMeta, this.cumplido, this.reference})
      : super._();

  @override
  MetasUserRecord rebuild(void Function(MetasUserRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MetasUserRecordBuilder toBuilder() =>
      new MetasUserRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MetasUserRecord &&
        tituloMeta == other.tituloMeta &&
        descripcionMeta == other.descripcionMeta &&
        cumplido == other.cumplido &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, tituloMeta.hashCode), descripcionMeta.hashCode),
            cumplido.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MetasUserRecord')
          ..add('tituloMeta', tituloMeta)
          ..add('descripcionMeta', descripcionMeta)
          ..add('cumplido', cumplido)
          ..add('reference', reference))
        .toString();
  }
}

class MetasUserRecordBuilder
    implements Builder<MetasUserRecord, MetasUserRecordBuilder> {
  _$MetasUserRecord _$v;

  String _tituloMeta;
  String get tituloMeta => _$this._tituloMeta;
  set tituloMeta(String tituloMeta) => _$this._tituloMeta = tituloMeta;

  String _descripcionMeta;
  String get descripcionMeta => _$this._descripcionMeta;
  set descripcionMeta(String descripcionMeta) =>
      _$this._descripcionMeta = descripcionMeta;

  bool _cumplido;
  bool get cumplido => _$this._cumplido;
  set cumplido(bool cumplido) => _$this._cumplido = cumplido;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  MetasUserRecordBuilder() {
    MetasUserRecord._initializeBuilder(this);
  }

  MetasUserRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _tituloMeta = $v.tituloMeta;
      _descripcionMeta = $v.descripcionMeta;
      _cumplido = $v.cumplido;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MetasUserRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MetasUserRecord;
  }

  @override
  void update(void Function(MetasUserRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MetasUserRecord build() {
    final _$result = _$v ??
        new _$MetasUserRecord._(
            tituloMeta: tituloMeta,
            descripcionMeta: descripcionMeta,
            cumplido: cumplido,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
