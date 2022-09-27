// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sentimientos_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SentimientosRecord> _$sentimientosRecordSerializer =
    new _$SentimientosRecordSerializer();

class _$SentimientosRecordSerializer
    implements StructuredSerializer<SentimientosRecord> {
  @override
  final Iterable<Type> types = const [SentimientosRecord, _$SentimientosRecord];
  @override
  final String wireName = 'SentimientosRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, SentimientosRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.sentimientoTitulo;
    if (value != null) {
      result
        ..add('SentimientoTitulo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.descripcionSentimiento;
    if (value != null) {
      result
        ..add('DescripcionSentimiento')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdTime;
    if (value != null) {
      result
        ..add('CreatedTime')
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
  SentimientosRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SentimientosRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'SentimientoTitulo':
          result.sentimientoTitulo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'DescripcionSentimiento':
          result.descripcionSentimiento = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'CreatedTime':
          result.createdTime = serializers.deserialize(value,
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

class _$SentimientosRecord extends SentimientosRecord {
  @override
  final String sentimientoTitulo;
  @override
  final String descripcionSentimiento;
  @override
  final DateTime createdTime;
  @override
  final DocumentReference<Object> reference;

  factory _$SentimientosRecord(
          [void Function(SentimientosRecordBuilder) updates]) =>
      (new SentimientosRecordBuilder()..update(updates)).build();

  _$SentimientosRecord._(
      {this.sentimientoTitulo,
      this.descripcionSentimiento,
      this.createdTime,
      this.reference})
      : super._();

  @override
  SentimientosRecord rebuild(
          void Function(SentimientosRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SentimientosRecordBuilder toBuilder() =>
      new SentimientosRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SentimientosRecord &&
        sentimientoTitulo == other.sentimientoTitulo &&
        descripcionSentimiento == other.descripcionSentimiento &&
        createdTime == other.createdTime &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc(0, sentimientoTitulo.hashCode),
                descripcionSentimiento.hashCode),
            createdTime.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SentimientosRecord')
          ..add('sentimientoTitulo', sentimientoTitulo)
          ..add('descripcionSentimiento', descripcionSentimiento)
          ..add('createdTime', createdTime)
          ..add('reference', reference))
        .toString();
  }
}

class SentimientosRecordBuilder
    implements Builder<SentimientosRecord, SentimientosRecordBuilder> {
  _$SentimientosRecord _$v;

  String _sentimientoTitulo;
  String get sentimientoTitulo => _$this._sentimientoTitulo;
  set sentimientoTitulo(String sentimientoTitulo) =>
      _$this._sentimientoTitulo = sentimientoTitulo;

  String _descripcionSentimiento;
  String get descripcionSentimiento => _$this._descripcionSentimiento;
  set descripcionSentimiento(String descripcionSentimiento) =>
      _$this._descripcionSentimiento = descripcionSentimiento;

  DateTime _createdTime;
  DateTime get createdTime => _$this._createdTime;
  set createdTime(DateTime createdTime) => _$this._createdTime = createdTime;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  SentimientosRecordBuilder() {
    SentimientosRecord._initializeBuilder(this);
  }

  SentimientosRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _sentimientoTitulo = $v.sentimientoTitulo;
      _descripcionSentimiento = $v.descripcionSentimiento;
      _createdTime = $v.createdTime;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SentimientosRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SentimientosRecord;
  }

  @override
  void update(void Function(SentimientosRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SentimientosRecord build() {
    final _$result = _$v ??
        new _$SentimientosRecord._(
            sentimientoTitulo: sentimientoTitulo,
            descripcionSentimiento: descripcionSentimiento,
            createdTime: createdTime,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
