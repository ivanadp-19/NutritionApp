import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'recetas_record.g.dart';

abstract class RecetasRecord
    implements Built<RecetasRecord, RecetasRecordBuilder> {
  static Serializer<RecetasRecord> get serializer => _$recetasRecordSerializer;

  @nullable
  String get titulo;

  @nullable
  @BuiltValueField(wireName: 'Descripcion')
  String get descripcion;

  @nullable
  String get categoria;

  @nullable
  String get foto;

  @nullable
  @BuiltValueField(wireName: 'Ingredientes')
  String get ingredientes;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(RecetasRecordBuilder builder) => builder
    ..titulo = ''
    ..descripcion = ''
    ..categoria = ''
    ..foto = ''
    ..ingredientes = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Recetas');

  static Stream<RecetasRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<RecetasRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static RecetasRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      RecetasRecord(
        (c) => c
          ..titulo = snapshot.data['titulo']
          ..descripcion = snapshot.data['Descripcion']
          ..categoria = snapshot.data['categoria']
          ..foto = snapshot.data['foto']
          ..ingredientes = snapshot.data['Ingredientes']
          ..reference = RecetasRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<RecetasRecord>> search(
          {String term,
          FutureOr<LatLng> location,
          int maxResults,
          double searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'Recetas',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  RecetasRecord._();
  factory RecetasRecord([void Function(RecetasRecordBuilder) updates]) =
      _$RecetasRecord;

  static RecetasRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createRecetasRecordData({
  String titulo,
  String descripcion,
  String categoria,
  String foto,
  String ingredientes,
}) =>
    serializers.toFirestore(
        RecetasRecord.serializer,
        RecetasRecord((r) => r
          ..titulo = titulo
          ..descripcion = descripcion
          ..categoria = categoria
          ..foto = foto
          ..ingredientes = ingredientes));
