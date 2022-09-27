// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserDataRecord> _$userDataRecordSerializer =
    new _$UserDataRecordSerializer();

class _$UserDataRecordSerializer
    implements StructuredSerializer<UserDataRecord> {
  @override
  final Iterable<Type> types = const [UserDataRecord, _$UserDataRecord];
  @override
  final String wireName = 'UserDataRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, UserDataRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.numCIta;
    if (value != null) {
      result
        ..add('NumCIta')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.peso;
    if (value != null) {
      result
        ..add('Peso')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.musculo;
    if (value != null) {
      result
        ..add('Musculo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.grasa;
    if (value != null) {
      result
        ..add('Grasa')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.imc;
    if (value != null) {
      result
        ..add('IMC')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
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
  UserDataRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserDataRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'NumCIta':
          result.numCIta = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'Peso':
          result.peso = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'Musculo':
          result.musculo = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'Grasa':
          result.grasa = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'IMC':
          result.imc = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
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

class _$UserDataRecord extends UserDataRecord {
  @override
  final int numCIta;
  @override
  final double peso;
  @override
  final double musculo;
  @override
  final double grasa;
  @override
  final double imc;
  @override
  final DocumentReference<Object> reference;

  factory _$UserDataRecord([void Function(UserDataRecordBuilder) updates]) =>
      (new UserDataRecordBuilder()..update(updates)).build();

  _$UserDataRecord._(
      {this.numCIta,
      this.peso,
      this.musculo,
      this.grasa,
      this.imc,
      this.reference})
      : super._();

  @override
  UserDataRecord rebuild(void Function(UserDataRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserDataRecordBuilder toBuilder() =>
      new UserDataRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserDataRecord &&
        numCIta == other.numCIta &&
        peso == other.peso &&
        musculo == other.musculo &&
        grasa == other.grasa &&
        imc == other.imc &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, numCIta.hashCode), peso.hashCode),
                    musculo.hashCode),
                grasa.hashCode),
            imc.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserDataRecord')
          ..add('numCIta', numCIta)
          ..add('peso', peso)
          ..add('musculo', musculo)
          ..add('grasa', grasa)
          ..add('imc', imc)
          ..add('reference', reference))
        .toString();
  }
}

class UserDataRecordBuilder
    implements Builder<UserDataRecord, UserDataRecordBuilder> {
  _$UserDataRecord _$v;

  int _numCIta;
  int get numCIta => _$this._numCIta;
  set numCIta(int numCIta) => _$this._numCIta = numCIta;

  double _peso;
  double get peso => _$this._peso;
  set peso(double peso) => _$this._peso = peso;

  double _musculo;
  double get musculo => _$this._musculo;
  set musculo(double musculo) => _$this._musculo = musculo;

  double _grasa;
  double get grasa => _$this._grasa;
  set grasa(double grasa) => _$this._grasa = grasa;

  double _imc;
  double get imc => _$this._imc;
  set imc(double imc) => _$this._imc = imc;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  UserDataRecordBuilder() {
    UserDataRecord._initializeBuilder(this);
  }

  UserDataRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _numCIta = $v.numCIta;
      _peso = $v.peso;
      _musculo = $v.musculo;
      _grasa = $v.grasa;
      _imc = $v.imc;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserDataRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserDataRecord;
  }

  @override
  void update(void Function(UserDataRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UserDataRecord build() {
    final _$result = _$v ??
        new _$UserDataRecord._(
            numCIta: numCIta,
            peso: peso,
            musculo: musculo,
            grasa: grasa,
            imc: imc,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
