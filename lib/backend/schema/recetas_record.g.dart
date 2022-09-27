// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recetas_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RecetasRecord> _$recetasRecordSerializer =
    new _$RecetasRecordSerializer();

class _$RecetasRecordSerializer implements StructuredSerializer<RecetasRecord> {
  @override
  final Iterable<Type> types = const [RecetasRecord, _$RecetasRecord];
  @override
  final String wireName = 'RecetasRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, RecetasRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.titulo;
    if (value != null) {
      result
        ..add('titulo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.descripcion;
    if (value != null) {
      result
        ..add('Descripcion')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.categoria;
    if (value != null) {
      result
        ..add('categoria')
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
    value = object.ingredientes;
    if (value != null) {
      result
        ..add('Ingredientes')
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
  RecetasRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RecetasRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'titulo':
          result.titulo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Descripcion':
          result.descripcion = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'categoria':
          result.categoria = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'foto':
          result.foto = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Ingredientes':
          result.ingredientes = serializers.deserialize(value,
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

class _$RecetasRecord extends RecetasRecord {
  @override
  final String titulo;
  @override
  final String descripcion;
  @override
  final String categoria;
  @override
  final String foto;
  @override
  final String ingredientes;
  @override
  final DocumentReference<Object> reference;

  factory _$RecetasRecord([void Function(RecetasRecordBuilder) updates]) =>
      (new RecetasRecordBuilder()..update(updates)).build();

  _$RecetasRecord._(
      {this.titulo,
      this.descripcion,
      this.categoria,
      this.foto,
      this.ingredientes,
      this.reference})
      : super._();

  @override
  RecetasRecord rebuild(void Function(RecetasRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RecetasRecordBuilder toBuilder() => new RecetasRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RecetasRecord &&
        titulo == other.titulo &&
        descripcion == other.descripcion &&
        categoria == other.categoria &&
        foto == other.foto &&
        ingredientes == other.ingredientes &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, titulo.hashCode), descripcion.hashCode),
                    categoria.hashCode),
                foto.hashCode),
            ingredientes.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RecetasRecord')
          ..add('titulo', titulo)
          ..add('descripcion', descripcion)
          ..add('categoria', categoria)
          ..add('foto', foto)
          ..add('ingredientes', ingredientes)
          ..add('reference', reference))
        .toString();
  }
}

class RecetasRecordBuilder
    implements Builder<RecetasRecord, RecetasRecordBuilder> {
  _$RecetasRecord _$v;

  String _titulo;
  String get titulo => _$this._titulo;
  set titulo(String titulo) => _$this._titulo = titulo;

  String _descripcion;
  String get descripcion => _$this._descripcion;
  set descripcion(String descripcion) => _$this._descripcion = descripcion;

  String _categoria;
  String get categoria => _$this._categoria;
  set categoria(String categoria) => _$this._categoria = categoria;

  String _foto;
  String get foto => _$this._foto;
  set foto(String foto) => _$this._foto = foto;

  String _ingredientes;
  String get ingredientes => _$this._ingredientes;
  set ingredientes(String ingredientes) => _$this._ingredientes = ingredientes;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  RecetasRecordBuilder() {
    RecetasRecord._initializeBuilder(this);
  }

  RecetasRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _titulo = $v.titulo;
      _descripcion = $v.descripcion;
      _categoria = $v.categoria;
      _foto = $v.foto;
      _ingredientes = $v.ingredientes;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RecetasRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RecetasRecord;
  }

  @override
  void update(void Function(RecetasRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$RecetasRecord build() {
    final _$result = _$v ??
        new _$RecetasRecord._(
            titulo: titulo,
            descripcion: descripcion,
            categoria: categoria,
            foto: foto,
            ingredientes: ingredientes,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
