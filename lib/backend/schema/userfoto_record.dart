import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'userfoto_record.g.dart';

abstract class UserfotoRecord
    implements Built<UserfotoRecord, UserfotoRecordBuilder> {
  static Serializer<UserfotoRecord> get serializer =>
      _$userfotoRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'Foto')
  String get foto;

  @nullable
  String get descripcion;

  @nullable
  @BuiltValueField(wireName: 'Created_at')
  DateTime get createdAt;

  @nullable
  String get uid;

  @nullable
  @BuiltValueField(wireName: 'Creator')
  String get creator;

  @nullable
  String get random;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(UserfotoRecordBuilder builder) => builder
    ..foto = ''
    ..descripcion = ''
    ..uid = ''
    ..creator = ''
    ..random = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Userfoto');

  static Stream<UserfotoRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<UserfotoRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  UserfotoRecord._();
  factory UserfotoRecord([void Function(UserfotoRecordBuilder) updates]) =
      _$UserfotoRecord;

  static UserfotoRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createUserfotoRecordData({
  String foto,
  String descripcion,
  DateTime createdAt,
  String uid,
  String creator,
  String random,
}) =>
    serializers.toFirestore(
        UserfotoRecord.serializer,
        UserfotoRecord((u) => u
          ..foto = foto
          ..descripcion = descripcion
          ..createdAt = createdAt
          ..uid = uid
          ..creator = creator
          ..random = random));
