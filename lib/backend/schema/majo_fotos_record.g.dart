// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'majo_fotos_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MajoFotosRecord> _$majoFotosRecordSerializer =
    new _$MajoFotosRecordSerializer();

class _$MajoFotosRecordSerializer
    implements StructuredSerializer<MajoFotosRecord> {
  @override
  final Iterable<Type> types = const [MajoFotosRecord, _$MajoFotosRecord];
  @override
  final String wireName = 'MajoFotosRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, MajoFotosRecord object,
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
        ..add('Descripcion')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.likes;
    if (value != null) {
      result
        ..add('Likes')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.userImage;
    if (value != null) {
      result
        ..add('userImage')
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
  MajoFotosRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MajoFotosRecordBuilder();

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
        case 'Descripcion':
          result.descripcion = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Likes':
          result.likes = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'userImage':
          result.userImage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Created_at':
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

class _$MajoFotosRecord extends MajoFotosRecord {
  @override
  final String foto;
  @override
  final String descripcion;
  @override
  final int likes;
  @override
  final String userImage;
  @override
  final DateTime createdAt;
  @override
  final DocumentReference<Object> reference;

  factory _$MajoFotosRecord([void Function(MajoFotosRecordBuilder) updates]) =>
      (new MajoFotosRecordBuilder()..update(updates)).build();

  _$MajoFotosRecord._(
      {this.foto,
      this.descripcion,
      this.likes,
      this.userImage,
      this.createdAt,
      this.reference})
      : super._();

  @override
  MajoFotosRecord rebuild(void Function(MajoFotosRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MajoFotosRecordBuilder toBuilder() =>
      new MajoFotosRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MajoFotosRecord &&
        foto == other.foto &&
        descripcion == other.descripcion &&
        likes == other.likes &&
        userImage == other.userImage &&
        createdAt == other.createdAt &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, foto.hashCode), descripcion.hashCode),
                    likes.hashCode),
                userImage.hashCode),
            createdAt.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MajoFotosRecord')
          ..add('foto', foto)
          ..add('descripcion', descripcion)
          ..add('likes', likes)
          ..add('userImage', userImage)
          ..add('createdAt', createdAt)
          ..add('reference', reference))
        .toString();
  }
}

class MajoFotosRecordBuilder
    implements Builder<MajoFotosRecord, MajoFotosRecordBuilder> {
  _$MajoFotosRecord _$v;

  String _foto;
  String get foto => _$this._foto;
  set foto(String foto) => _$this._foto = foto;

  String _descripcion;
  String get descripcion => _$this._descripcion;
  set descripcion(String descripcion) => _$this._descripcion = descripcion;

  int _likes;
  int get likes => _$this._likes;
  set likes(int likes) => _$this._likes = likes;

  String _userImage;
  String get userImage => _$this._userImage;
  set userImage(String userImage) => _$this._userImage = userImage;

  DateTime _createdAt;
  DateTime get createdAt => _$this._createdAt;
  set createdAt(DateTime createdAt) => _$this._createdAt = createdAt;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  MajoFotosRecordBuilder() {
    MajoFotosRecord._initializeBuilder(this);
  }

  MajoFotosRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _foto = $v.foto;
      _descripcion = $v.descripcion;
      _likes = $v.likes;
      _userImage = $v.userImage;
      _createdAt = $v.createdAt;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MajoFotosRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MajoFotosRecord;
  }

  @override
  void update(void Function(MajoFotosRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MajoFotosRecord build() {
    final _$result = _$v ??
        new _$MajoFotosRecord._(
            foto: foto,
            descripcion: descripcion,
            likes: likes,
            userImage: userImage,
            createdAt: createdAt,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
