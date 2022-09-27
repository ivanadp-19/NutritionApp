import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'sentimientos_record.g.dart';

abstract class SentimientosRecord
    implements Built<SentimientosRecord, SentimientosRecordBuilder> {
  static Serializer<SentimientosRecord> get serializer =>
      _$sentimientosRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'SentimientoTitulo')
  String get sentimientoTitulo;

  @nullable
  @BuiltValueField(wireName: 'DescripcionSentimiento')
  String get descripcionSentimiento;

  @nullable
  @BuiltValueField(wireName: 'CreatedTime')
  DateTime get createdTime;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  DocumentReference get parentReference => reference.parent.parent;

  static void _initializeBuilder(SentimientosRecordBuilder builder) => builder
    ..sentimientoTitulo = ''
    ..descripcionSentimiento = '';

  static Query<Map<String, dynamic>> collection([DocumentReference parent]) =>
      parent != null
          ? parent.collection('Sentimientos')
          : FirebaseFirestore.instance.collectionGroup('Sentimientos');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('Sentimientos').doc();

  static Stream<SentimientosRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<SentimientosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  SentimientosRecord._();
  factory SentimientosRecord(
          [void Function(SentimientosRecordBuilder) updates]) =
      _$SentimientosRecord;

  static SentimientosRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createSentimientosRecordData({
  String sentimientoTitulo,
  String descripcionSentimiento,
  DateTime createdTime,
}) =>
    serializers.toFirestore(
        SentimientosRecord.serializer,
        SentimientosRecord((s) => s
          ..sentimientoTitulo = sentimientoTitulo
          ..descripcionSentimiento = descripcionSentimiento
          ..createdTime = createdTime));
