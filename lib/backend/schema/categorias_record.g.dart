// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categorias_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CategoriasRecord> _$categoriasRecordSerializer =
    new _$CategoriasRecordSerializer();

class _$CategoriasRecordSerializer
    implements StructuredSerializer<CategoriasRecord> {
  @override
  final Iterable<Type> types = const [CategoriasRecord, _$CategoriasRecord];
  @override
  final String wireName = 'CategoriasRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, CategoriasRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.nombre;
    if (value != null) {
      result
        ..add('Nombre')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.foto;
    if (value != null) {
      result
        ..add('foto')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  CategoriasRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CategoriasRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'Nombre':
          result.nombre = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'foto':
          result.foto = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
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

class _$CategoriasRecord extends CategoriasRecord {
  @override
  final String nombre;
  @override
  final String foto;
  @override
  final DocumentReference<Object> reference;

  factory _$CategoriasRecord(
          [void Function(CategoriasRecordBuilder) updates]) =>
      (new CategoriasRecordBuilder()..update(updates)).build();

  _$CategoriasRecord._({this.nombre, this.foto, this.reference}) : super._();

  @override
  CategoriasRecord rebuild(void Function(CategoriasRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CategoriasRecordBuilder toBuilder() =>
      new CategoriasRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CategoriasRecord &&
        nombre == other.nombre &&
        foto == other.foto &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, nombre.hashCode), foto.hashCode), reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CategoriasRecord')
          ..add('nombre', nombre)
          ..add('foto', foto)
          ..add('reference', reference))
        .toString();
  }
}

class CategoriasRecordBuilder
    implements Builder<CategoriasRecord, CategoriasRecordBuilder> {
  _$CategoriasRecord _$v;

  String _nombre;
  String get nombre => _$this._nombre;
  set nombre(String nombre) => _$this._nombre = nombre;

  String _foto;
  String get foto => _$this._foto;
  set foto(String foto) => _$this._foto = foto;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  CategoriasRecordBuilder() {
    CategoriasRecord._initializeBuilder(this);
  }

  CategoriasRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _nombre = $v.nombre;
      _foto = $v.foto;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CategoriasRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CategoriasRecord;
  }

  @override
  void update(void Function(CategoriasRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CategoriasRecord build() {
    final _$result = _$v ??
        new _$CategoriasRecord._(
            nombre: nombre, foto: foto, reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
