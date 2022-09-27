// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userfoto_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserfotoRecord> _$userfotoRecordSerializer =
    new _$UserfotoRecordSerializer();

class _$UserfotoRecordSerializer
    implements StructuredSerializer<UserfotoRecord> {
  @override
  final Iterable<Type> types = const [UserfotoRecord, _$UserfotoRecord];
  @override
  final String wireName = 'UserfotoRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, UserfotoRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.foto;
    if (value != null) {
      result
        ..add('Foto')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.descripcion;
    if (value != null) {
      result
        ..add('descripcion')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('Created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.creator;
    if (value != null) {
      result
        ..add('Creator')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.random;
    if (value != null) {
      result
        ..add('random')
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
  UserfotoRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserfotoRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'Foto':
          result.foto = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'descripcion':
          result.descripcion = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Creator':
          result.creator = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'random':
          result.random = serializers.deserialize(value,
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

class _$UserfotoRecord extends UserfotoRecord {
  @override
  final String foto;
  @override
  final String descripcion;
  @override
  final DateTime createdAt;
  @override
  final String uid;
  @override
  final String creator;
  @override
  final String random;
  @override
  final DocumentReference<Object> reference;

  factory _$UserfotoRecord([void Function(UserfotoRecordBuilder) updates]) =>
      (new UserfotoRecordBuilder()..update(updates)).build();

  _$UserfotoRecord._(
      {this.foto,
      this.descripcion,
      this.createdAt,
      this.uid,
      this.creator,
      this.random,
      this.reference})
      : super._();

  @override
  UserfotoRecord rebuild(void Function(UserfotoRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserfotoRecordBuilder toBuilder() =>
      new UserfotoRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserfotoRecord &&
        foto == other.foto &&
        descripcion == other.descripcion &&
        createdAt == other.createdAt &&
        uid == other.uid &&
        creator == other.creator &&
        random == other.random &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, foto.hashCode), descripcion.hashCode),
                        createdAt.hashCode),
                    uid.hashCode),
                creator.hashCode),
            random.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserfotoRecord')
          ..add('foto', foto)
          ..add('descripcion', descripcion)
          ..add('createdAt', createdAt)
          ..add('uid', uid)
          ..add('creator', creator)
          ..add('random', random)
          ..add('reference', reference))
        .toString();
  }
}

class UserfotoRecordBuilder
    implements Builder<UserfotoRecord, UserfotoRecordBuilder> {
  _$UserfotoRecord _$v;

  String _foto;
  String get foto => _$this._foto;
  set foto(String foto) => _$this._foto = foto;

  String _descripcion;
  String get descripcion => _$this._descripcion;
  set descripcion(String descripcion) => _$this._descripcion = descripcion;

  DateTime _createdAt;
  DateTime get createdAt => _$this._createdAt;
  set createdAt(DateTime createdAt) => _$this._createdAt = createdAt;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  String _creator;
  String get creator => _$this._creator;
  set creator(String creator) => _$this._creator = creator;

  String _random;
  String get random => _$this._random;
  set random(String random) => _$this._random = random;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  UserfotoRecordBuilder() {
    UserfotoRecord._initializeBuilder(this);
  }

  UserfotoRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _foto = $v.foto;
      _descripcion = $v.descripcion;
      _createdAt = $v.createdAt;
      _uid = $v.uid;
      _creator = $v.creator;
      _random = $v.random;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserfotoRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserfotoRecord;
  }

  @override
  void update(void Function(UserfotoRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UserfotoRecord build() {
    final _$result = _$v ??
        new _$UserfotoRecord._(
            foto: foto,
            descripcion: descripcion,
            createdAt: createdAt,
            uid: uid,
            creator: creator,
            random: random,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
