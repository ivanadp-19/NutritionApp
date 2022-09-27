import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'metas_user_record.g.dart';

abstract class MetasUserRecord
    implements Built<MetasUserRecord, MetasUserRecordBuilder> {
  static Serializer<MetasUserRecord> get serializer =>
      _$metasUserRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'TituloMeta')
  String get tituloMeta;

  @nullable
  @BuiltValueField(wireName: 'DescripcionMeta')
  String get descripcionMeta;

  @nullable
  @BuiltValueField(wireName: 'Cumplido')
  bool get cumplido;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  DocumentReference get parentReference => reference.parent.parent;

  static void _initializeBuilder(MetasUserRecordBuilder builder) => builder
    ..tituloMeta = ''
    ..descripcionMeta = ''
    ..cumplido = false;

  static Query<Map<String, dynamic>> collection([DocumentReference parent]) =>
      parent != null
          ? parent.collection('MetasUser')
          : FirebaseFirestore.instance.collectionGroup('MetasUser');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('MetasUser').doc();

  static Stream<MetasUserRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<MetasUserRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  MetasUserRecord._();
  factory MetasUserRecord([void Function(MetasUserRecordBuilder) updates]) =
      _$MetasUserRecord;

  static MetasUserRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createMetasUserRecordData({
  String tituloMeta,
  String descripcionMeta,
  bool cumplido,
}) =>
    serializers.toFirestore(
        MetasUserRecord.serializer,
        MetasUserRecord((m) => m
          ..tituloMeta = tituloMeta
          ..descripcionMeta = descripcionMeta
          ..cumplido = cumplido));
