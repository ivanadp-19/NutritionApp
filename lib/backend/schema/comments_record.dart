import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'comments_record.g.dart';

abstract class CommentsRecord
    implements Built<CommentsRecord, CommentsRecordBuilder> {
  static Serializer<CommentsRecord> get serializer =>
      _$commentsRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'Commentdescription')
  String get commentdescription;

  @nullable
  @BuiltValueField(wireName: 'Created_at')
  DateTime get createdAt;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  DocumentReference get parentReference => reference.parent.parent;

  static void _initializeBuilder(CommentsRecordBuilder builder) =>
      builder..commentdescription = '';

  static Query<Map<String, dynamic>> collection([DocumentReference parent]) =>
      parent != null
          ? parent.collection('Comments')
          : FirebaseFirestore.instance.collectionGroup('Comments');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('Comments').doc();

  static Stream<CommentsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<CommentsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  CommentsRecord._();
  factory CommentsRecord([void Function(CommentsRecordBuilder) updates]) =
      _$CommentsRecord;

  static CommentsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createCommentsRecordData({
  String commentdescription,
  DateTime createdAt,
}) =>
    serializers.toFirestore(
        CommentsRecord.serializer,
        CommentsRecord((c) => c
          ..commentdescription = commentdescription
          ..createdAt = createdAt));
