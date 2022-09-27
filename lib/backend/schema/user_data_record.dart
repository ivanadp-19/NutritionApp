import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'user_data_record.g.dart';

abstract class UserDataRecord
    implements Built<UserDataRecord, UserDataRecordBuilder> {
  static Serializer<UserDataRecord> get serializer =>
      _$userDataRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'NumCIta')
  int get numCIta;

  @nullable
  @BuiltValueField(wireName: 'Peso')
  double get peso;

  @nullable
  @BuiltValueField(wireName: 'Musculo')
  double get musculo;

  @nullable
  @BuiltValueField(wireName: 'Grasa')
  double get grasa;

  @nullable
  @BuiltValueField(wireName: 'IMC')
  double get imc;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  DocumentReference get parentReference => reference.parent.parent;

  static void _initializeBuilder(UserDataRecordBuilder builder) => builder
    ..numCIta = 0
    ..peso = 0.0
    ..musculo = 0.0
    ..grasa = 0.0
    ..imc = 0.0;

  static Query<Map<String, dynamic>> collection([DocumentReference parent]) =>
      parent != null
          ? parent.collection('userData')
          : FirebaseFirestore.instance.collectionGroup('userData');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('userData').doc();

  static Stream<UserDataRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<UserDataRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  UserDataRecord._();
  factory UserDataRecord([void Function(UserDataRecordBuilder) updates]) =
      _$UserDataRecord;

  static UserDataRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createUserDataRecordData({
  int numCIta,
  double peso,
  double musculo,
  double grasa,
  double imc,
}) =>
    serializers.toFirestore(
        UserDataRecord.serializer,
        UserDataRecord((u) => u
          ..numCIta = numCIta
          ..peso = peso
          ..musculo = musculo
          ..grasa = grasa
          ..imc = imc));
