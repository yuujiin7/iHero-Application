import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'events_record.g.dart';

abstract class EventsRecord
    implements Built<EventsRecord, EventsRecordBuilder> {
  static Serializer<EventsRecord> get serializer => _$eventsRecordSerializer;

  String? get eventTitle;

  String? get eventPhotoUrl;

  String? get eventDescription;

  String? get eventInChargePerson;

  @BuiltValueField(wireName: 'event_Location')
  LatLng? get eventLocation;

  String? get eventAddress;

  @BuiltValueField(wireName: 'volunteer_names')
  BuiltList<String>? get volunteerNames;

  @BuiltValueField(wireName: 'needed_volunteer_count')
  double? get neededVolunteerCount;

  double? get neededVolunteer;

  @BuiltValueField(wireName: 'created_date')
  DateTime? get createdDate;

  BuiltList<String>? get eventTag;

  bool? get isEnded;

  @BuiltValueField(wireName: 'volunteer_count')
  double? get volunteerCount;

  bool? get isDeleted;

  String? get eventContactNumber;

  bool? get isConfirmbySA;

  @BuiltValueField(wireName: 'expiry_date')
  DateTime? get expiryDate;

  @BuiltValueField(wireName: 'admin_ref')
  BuiltList<DocumentReference>? get adminRef;

  DateTime? get eventDateStart;

  DateTime? get eventDateEnd;

  @BuiltValueField(wireName: 'organization_partner')
  BuiltList<String>? get organizationPartner;

  String? get eventStartDate;

  String? get eventEndDate;

  bool? get isReqCancel;

  @BuiltValueField(wireName: 'volunteer_ref')
  BuiltList<DocumentReference>? get volunteerRef;

  @BuiltValueField(wireName: 'partnerOrg_ref')
  DocumentReference? get partnerOrgRef;

  @BuiltValueField(wireName: 'volunteer_list')
  BuiltList<String>? get volunteerList;

  DateTime? get startTime;

  DateTime? get endTime;

  bool? get isRecurring;

  String? get recurranceDate;

  double? get rateTotal;

  double? get rateCount;

  String? get reason;

  bool? get isDeclined;

  @BuiltValueField(wireName: 'rate_ref')
  BuiltList<DocumentReference>? get rateRef;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(EventsRecordBuilder builder) => builder
    ..eventTitle = ''
    ..eventPhotoUrl = ''
    ..eventDescription = ''
    ..eventInChargePerson = ''
    ..eventAddress = ''
    ..volunteerNames = ListBuilder()
    ..neededVolunteerCount = 0.0
    ..neededVolunteer = 0.0
    ..eventTag = ListBuilder()
    ..isEnded = false
    ..volunteerCount = 0.0
    ..isDeleted = false
    ..eventContactNumber = ''
    ..isConfirmbySA = false
    ..adminRef = ListBuilder()
    ..organizationPartner = ListBuilder()
    ..eventStartDate = ''
    ..eventEndDate = ''
    ..isReqCancel = false
    ..volunteerRef = ListBuilder()
    ..volunteerList = ListBuilder()
    ..isRecurring = false
    ..recurranceDate = ''
    ..rateTotal = 0.0
    ..rateCount = 0.0
    ..reason = ''
    ..isDeclined = false
    ..rateRef = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('events');

  static Stream<EventsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<EventsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static EventsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      EventsRecord(
        (c) => c
          ..eventTitle = snapshot.data['eventTitle']
          ..eventPhotoUrl = snapshot.data['eventPhotoUrl']
          ..eventDescription = snapshot.data['eventDescription']
          ..eventInChargePerson = snapshot.data['eventInChargePerson']
          ..eventLocation = safeGet(() => LatLng(
                snapshot.data['_geoloc']['lat'],
                snapshot.data['_geoloc']['lng'],
              ))
          ..eventAddress = snapshot.data['eventAddress']
          ..volunteerNames =
              safeGet(() => ListBuilder(snapshot.data['volunteer_names']))
          ..neededVolunteerCount =
              snapshot.data['needed_volunteer_count']?.toDouble()
          ..neededVolunteer = snapshot.data['neededVolunteer']?.toDouble()
          ..createdDate = safeGet(() => DateTime.fromMillisecondsSinceEpoch(
              snapshot.data['created_date']))
          ..eventTag = safeGet(() => ListBuilder(snapshot.data['eventTag']))
          ..isEnded = snapshot.data['isEnded']
          ..volunteerCount = snapshot.data['volunteer_count']?.toDouble()
          ..isDeleted = snapshot.data['isDeleted']
          ..eventContactNumber = snapshot.data['eventContactNumber']
          ..isConfirmbySA = snapshot.data['isConfirmbySA']
          ..expiryDate = safeGet(() =>
              DateTime.fromMillisecondsSinceEpoch(snapshot.data['expiry_date']))
          ..adminRef = safeGet(() =>
              ListBuilder(snapshot.data['admin_ref'].map((s) => toRef(s))))
          ..eventDateStart = safeGet(() => DateTime.fromMillisecondsSinceEpoch(
              snapshot.data['eventDateStart']))
          ..eventDateEnd = safeGet(() => DateTime.fromMillisecondsSinceEpoch(
              snapshot.data['eventDateEnd']))
          ..organizationPartner =
              safeGet(() => ListBuilder(snapshot.data['organization_partner']))
          ..eventStartDate = snapshot.data['eventStartDate']
          ..eventEndDate = snapshot.data['eventEndDate']
          ..isReqCancel = snapshot.data['isReqCancel']
          ..volunteerRef = safeGet(() =>
              ListBuilder(snapshot.data['volunteer_ref'].map((s) => toRef(s))))
          ..partnerOrgRef =
              safeGet(() => toRef(snapshot.data['partnerOrg_ref']))
          ..volunteerList =
              safeGet(() => ListBuilder(snapshot.data['volunteer_list']))
          ..startTime = safeGet(() =>
              DateTime.fromMillisecondsSinceEpoch(snapshot.data['startTime']))
          ..endTime = safeGet(() =>
              DateTime.fromMillisecondsSinceEpoch(snapshot.data['endTime']))
          ..isRecurring = snapshot.data['isRecurring']
          ..recurranceDate = snapshot.data['recurranceDate']
          ..rateTotal = snapshot.data['rateTotal']?.toDouble()
          ..rateCount = snapshot.data['rateCount']?.toDouble()
          ..reason = snapshot.data['reason']
          ..isDeclined = snapshot.data['isDeclined']
          ..rateRef = safeGet(
              () => ListBuilder(snapshot.data['rate_ref'].map((s) => toRef(s))))
          ..ffRef = EventsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<EventsRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'events',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  EventsRecord._();
  factory EventsRecord([void Function(EventsRecordBuilder) updates]) =
      _$EventsRecord;

  static EventsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createEventsRecordData({
  String? eventTitle,
  String? eventPhotoUrl,
  String? eventDescription,
  String? eventInChargePerson,
  LatLng? eventLocation,
  String? eventAddress,
  double? neededVolunteerCount,
  double? neededVolunteer,
  DateTime? createdDate,
  bool? isEnded,
  double? volunteerCount,
  bool? isDeleted,
  String? eventContactNumber,
  bool? isConfirmbySA,
  DateTime? expiryDate,
  DateTime? eventDateStart,
  DateTime? eventDateEnd,
  String? eventStartDate,
  String? eventEndDate,
  bool? isReqCancel,
  DocumentReference? partnerOrgRef,
  DateTime? startTime,
  DateTime? endTime,
  bool? isRecurring,
  String? recurranceDate,
  double? rateTotal,
  double? rateCount,
  String? reason,
  bool? isDeclined,
}) {
  final firestoreData = serializers.toFirestore(
    EventsRecord.serializer,
    EventsRecord(
      (e) => e
        ..eventTitle = eventTitle
        ..eventPhotoUrl = eventPhotoUrl
        ..eventDescription = eventDescription
        ..eventInChargePerson = eventInChargePerson
        ..eventLocation = eventLocation
        ..eventAddress = eventAddress
        ..volunteerNames = null
        ..neededVolunteerCount = neededVolunteerCount
        ..neededVolunteer = neededVolunteer
        ..createdDate = createdDate
        ..eventTag = null
        ..isEnded = isEnded
        ..volunteerCount = volunteerCount
        ..isDeleted = isDeleted
        ..eventContactNumber = eventContactNumber
        ..isConfirmbySA = isConfirmbySA
        ..expiryDate = expiryDate
        ..adminRef = null
        ..eventDateStart = eventDateStart
        ..eventDateEnd = eventDateEnd
        ..organizationPartner = null
        ..eventStartDate = eventStartDate
        ..eventEndDate = eventEndDate
        ..isReqCancel = isReqCancel
        ..volunteerRef = null
        ..partnerOrgRef = partnerOrgRef
        ..volunteerList = null
        ..startTime = startTime
        ..endTime = endTime
        ..isRecurring = isRecurring
        ..recurranceDate = recurranceDate
        ..rateTotal = rateTotal
        ..rateCount = rateCount
        ..reason = reason
        ..isDeclined = isDeclined
        ..rateRef = null,
    ),
  );

  return firestoreData;
}
