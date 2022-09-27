import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'dietas_record.g.dart';

abstract class DietasRecord
    implements Built<DietasRecord, DietasRecordBuilder> {
  static Serializer<DietasRecord> get serializer => _$dietasRecordSerializer;

  @nullable
  String get dietaUrl;

  @nullable
  @BuiltValueField(wireName: 'created_at')
  DateTime get createdAt;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  DocumentReference get parentReference => reference.parent.parent;

  static void _initializeBuilder(DietasRecordBuilder builder) =>
      builder..dietaUrl = '';

  static Query<Map<String, dynamic>> collection([DocumentReference parent]) =>
      parent != null
          ? parent.collection('Dietas')
          : FirebaseFirestore.instance.collectionGroup('Dietas');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('Dietas').doc();

  static Stream<DietasRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<DietasRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  DietasRecord._();
  factory DietasRecord([void Function(DietasRecordBuilder) updates]) =
      _$DietasRecord;

  static DietasRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createDietasRecordData({
  String dietaUrl,
  DateTime createdAt,
}) =>
    serializers.toFirestore(
        DietasRecord.serializer,
        DietasRecord((d) => d
          ..dietaUrl = dietaUrl
          ..createdAt = createdAt));
