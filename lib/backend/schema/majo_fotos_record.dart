import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'majo_fotos_record.g.dart';

abstract class MajoFotosRecord
    implements Built<MajoFotosRecord, MajoFotosRecordBuilder> {
  static Serializer<MajoFotosRecord> get serializer =>
      _$majoFotosRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'Foto')
  String get foto;

  @nullable
  @BuiltValueField(wireName: 'Descripcion')
  String get descripcion;

  @nullable
  @BuiltValueField(wireName: 'Likes')
  int get likes;

  @nullable
  String get userImage;

  @nullable
  @BuiltValueField(wireName: 'Created_at')
  DateTime get createdAt;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(MajoFotosRecordBuilder builder) => builder
    ..foto = ''
    ..descripcion = ''
    ..likes = 0
    ..userImage = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('MajoFotos');

  static Stream<MajoFotosRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<MajoFotosRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  MajoFotosRecord._();
  factory MajoFotosRecord([void Function(MajoFotosRecordBuilder) updates]) =
      _$MajoFotosRecord;

  static MajoFotosRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createMajoFotosRecordData({
  String foto,
  String descripcion,
  int likes,
  String userImage,
  DateTime createdAt,
}) =>
    serializers.toFirestore(
        MajoFotosRecord.serializer,
        MajoFotosRecord((m) => m
          ..foto = foto
          ..descripcion = descripcion
          ..likes = likes
          ..userImage = userImage
          ..createdAt = createdAt));
