import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'my_events_record.g.dart';

abstract class MyEventsRecord
    implements Built<MyEventsRecord, MyEventsRecordBuilder> {
  static Serializer<MyEventsRecord> get serializer =>
      _$myEventsRecordSerializer;

  DateTime? get dateJoined;

  DocumentReference? get eventReference;

  DocumentReference? get userRef;

  DateTime? get dateCreated;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(MyEventsRecordBuilder builder) => builder;

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('myEvents')
          : FirebaseFirestore.instance.collectionGroup('myEvents');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('myEvents').doc();

  static Stream<MyEventsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<MyEventsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  MyEventsRecord._();
  factory MyEventsRecord([void Function(MyEventsRecordBuilder) updates]) =
      _$MyEventsRecord;

  static MyEventsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createMyEventsRecordData({
  DateTime? dateJoined,
  DocumentReference? eventReference,
  DocumentReference? userRef,
  DateTime? dateCreated,
}) {
  final firestoreData = serializers.toFirestore(
    MyEventsRecord.serializer,
    MyEventsRecord(
      (m) => m
        ..dateJoined = dateJoined
        ..eventReference = eventReference
        ..userRef = userRef
        ..dateCreated = dateCreated,
    ),
  );

  return firestoreData;
}
