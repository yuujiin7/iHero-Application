import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/algolia_manager.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventsRecord extends FirestoreRecord {
  EventsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "eventTitle" field.
  String? _eventTitle;
  String get eventTitle => _eventTitle ?? '';
  bool hasEventTitle() => _eventTitle != null;

  // "eventPhotoUrl" field.
  String? _eventPhotoUrl;
  String get eventPhotoUrl => _eventPhotoUrl ?? '';
  bool hasEventPhotoUrl() => _eventPhotoUrl != null;

  // "eventDescription" field.
  String? _eventDescription;
  String get eventDescription => _eventDescription ?? '';
  bool hasEventDescription() => _eventDescription != null;

  // "eventInChargePerson" field.
  String? _eventInChargePerson;
  String get eventInChargePerson => _eventInChargePerson ?? '';
  bool hasEventInChargePerson() => _eventInChargePerson != null;

  // "event_Location" field.
  LatLng? _eventLocation;
  LatLng? get eventLocation => _eventLocation;
  bool hasEventLocation() => _eventLocation != null;

  // "eventAddress" field.
  String? _eventAddress;
  String get eventAddress => _eventAddress ?? '';
  bool hasEventAddress() => _eventAddress != null;

  // "volunteer_names" field.
  List<String>? _volunteerNames;
  List<String> get volunteerNames => _volunteerNames ?? const [];
  bool hasVolunteerNames() => _volunteerNames != null;

  // "needed_volunteer_count" field.
  double? _neededVolunteerCount;
  double get neededVolunteerCount => _neededVolunteerCount ?? 0.0;
  bool hasNeededVolunteerCount() => _neededVolunteerCount != null;

  // "neededVolunteer" field.
  double? _neededVolunteer;
  double get neededVolunteer => _neededVolunteer ?? 0.0;
  bool hasNeededVolunteer() => _neededVolunteer != null;

  // "created_date" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  // "eventTag" field.
  List<String>? _eventTag;
  List<String> get eventTag => _eventTag ?? const [];
  bool hasEventTag() => _eventTag != null;

  // "isEnded" field.
  bool? _isEnded;
  bool get isEnded => _isEnded ?? false;
  bool hasIsEnded() => _isEnded != null;

  // "volunteer_count" field.
  double? _volunteerCount;
  double get volunteerCount => _volunteerCount ?? 0.0;
  bool hasVolunteerCount() => _volunteerCount != null;

  // "isDeleted" field.
  bool? _isDeleted;
  bool get isDeleted => _isDeleted ?? false;
  bool hasIsDeleted() => _isDeleted != null;

  // "eventContactNumber" field.
  String? _eventContactNumber;
  String get eventContactNumber => _eventContactNumber ?? '';
  bool hasEventContactNumber() => _eventContactNumber != null;

  // "isConfirmbySA" field.
  bool? _isConfirmbySA;
  bool get isConfirmbySA => _isConfirmbySA ?? false;
  bool hasIsConfirmbySA() => _isConfirmbySA != null;

  // "expiry_date" field.
  DateTime? _expiryDate;
  DateTime? get expiryDate => _expiryDate;
  bool hasExpiryDate() => _expiryDate != null;

  // "admin_ref" field.
  List<DocumentReference>? _adminRef;
  List<DocumentReference> get adminRef => _adminRef ?? const [];
  bool hasAdminRef() => _adminRef != null;

  // "eventDateStart" field.
  DateTime? _eventDateStart;
  DateTime? get eventDateStart => _eventDateStart;
  bool hasEventDateStart() => _eventDateStart != null;

  // "eventDateEnd" field.
  DateTime? _eventDateEnd;
  DateTime? get eventDateEnd => _eventDateEnd;
  bool hasEventDateEnd() => _eventDateEnd != null;

  // "isReqCancel" field.
  bool? _isReqCancel;
  bool get isReqCancel => _isReqCancel ?? false;
  bool hasIsReqCancel() => _isReqCancel != null;

  // "volunteer_ref" field.
  List<DocumentReference>? _volunteerRef;
  List<DocumentReference> get volunteerRef => _volunteerRef ?? const [];
  bool hasVolunteerRef() => _volunteerRef != null;

  // "partnerOrg_ref" field.
  DocumentReference? _partnerOrgRef;
  DocumentReference? get partnerOrgRef => _partnerOrgRef;
  bool hasPartnerOrgRef() => _partnerOrgRef != null;

  // "volunteer_list" field.
  List<String>? _volunteerList;
  List<String> get volunteerList => _volunteerList ?? const [];
  bool hasVolunteerList() => _volunteerList != null;

  // "isRecurring" field.
  bool? _isRecurring;
  bool get isRecurring => _isRecurring ?? false;
  bool hasIsRecurring() => _isRecurring != null;

  // "rateTotal" field.
  double? _rateTotal;
  double get rateTotal => _rateTotal ?? 0.0;
  bool hasRateTotal() => _rateTotal != null;

  // "rateCount" field.
  double? _rateCount;
  double get rateCount => _rateCount ?? 0.0;
  bool hasRateCount() => _rateCount != null;

  // "reason" field.
  String? _reason;
  String get reason => _reason ?? '';
  bool hasReason() => _reason != null;

  // "isDeclined" field.
  bool? _isDeclined;
  bool get isDeclined => _isDeclined ?? false;
  bool hasIsDeclined() => _isDeclined != null;

  // "rate_ref" field.
  List<DocumentReference>? _rateRef;
  List<DocumentReference> get rateRef => _rateRef ?? const [];
  bool hasRateRef() => _rateRef != null;

  // "ageRequirement" field.
  int? _ageRequirement;
  int get ageRequirement => _ageRequirement ?? 0;
  bool hasAgeRequirement() => _ageRequirement != null;

  // "isMeritScoreUpdated" field.
  bool? _isMeritScoreUpdated;
  bool get isMeritScoreUpdated => _isMeritScoreUpdated ?? false;
  bool hasIsMeritScoreUpdated() => _isMeritScoreUpdated != null;

  // "addRequirementEvent" field.
  String? _addRequirementEvent;
  String get addRequirementEvent => _addRequirementEvent ?? '';
  bool hasAddRequirementEvent() => _addRequirementEvent != null;

  // "organization_partnter" field.
  String? _organizationPartnter;
  String get organizationPartnter => _organizationPartnter ?? '';
  bool hasOrganizationPartnter() => _organizationPartnter != null;

  // "recurranceDate" field.
  List<String>? _recurranceDate;
  List<String> get recurranceDate => _recurranceDate ?? const [];
  bool hasRecurranceDate() => _recurranceDate != null;

  // "registrationDate" field.
  DateTime? _registrationDate;
  DateTime? get registrationDate => _registrationDate;
  bool hasRegistrationDate() => _registrationDate != null;

  // "minimumVolunteer" field.
  double? _minimumVolunteer;
  double get minimumVolunteer => _minimumVolunteer ?? 0.0;
  bool hasMinimumVolunteer() => _minimumVolunteer != null;

  void _initializeFields() {
    _eventTitle = snapshotData['eventTitle'] as String?;
    _eventPhotoUrl = snapshotData['eventPhotoUrl'] as String?;
    _eventDescription = snapshotData['eventDescription'] as String?;
    _eventInChargePerson = snapshotData['eventInChargePerson'] as String?;
    _eventLocation = snapshotData['event_Location'] as LatLng?;
    _eventAddress = snapshotData['eventAddress'] as String?;
    _volunteerNames = getDataList(snapshotData['volunteer_names']);
    _neededVolunteerCount =
        castToType<double>(snapshotData['needed_volunteer_count']);
    _neededVolunteer = castToType<double>(snapshotData['neededVolunteer']);
    _createdDate = snapshotData['created_date'] as DateTime?;
    _eventTag = getDataList(snapshotData['eventTag']);
    _isEnded = snapshotData['isEnded'] as bool?;
    _volunteerCount = castToType<double>(snapshotData['volunteer_count']);
    _isDeleted = snapshotData['isDeleted'] as bool?;
    _eventContactNumber = snapshotData['eventContactNumber'] as String?;
    _isConfirmbySA = snapshotData['isConfirmbySA'] as bool?;
    _expiryDate = snapshotData['expiry_date'] as DateTime?;
    _adminRef = getDataList(snapshotData['admin_ref']);
    _eventDateStart = snapshotData['eventDateStart'] as DateTime?;
    _eventDateEnd = snapshotData['eventDateEnd'] as DateTime?;
    _isReqCancel = snapshotData['isReqCancel'] as bool?;
    _volunteerRef = getDataList(snapshotData['volunteer_ref']);
    _partnerOrgRef = snapshotData['partnerOrg_ref'] as DocumentReference?;
    _volunteerList = getDataList(snapshotData['volunteer_list']);
    _isRecurring = snapshotData['isRecurring'] as bool?;
    _rateTotal = castToType<double>(snapshotData['rateTotal']);
    _rateCount = castToType<double>(snapshotData['rateCount']);
    _reason = snapshotData['reason'] as String?;
    _isDeclined = snapshotData['isDeclined'] as bool?;
    _rateRef = getDataList(snapshotData['rate_ref']);
    _ageRequirement = snapshotData['ageRequirement'] as int?;
    _isMeritScoreUpdated = snapshotData['isMeritScoreUpdated'] as bool?;
    _addRequirementEvent = snapshotData['addRequirementEvent'] as String?;
    _organizationPartnter = snapshotData['organization_partnter'] as String?;
    _recurranceDate = getDataList(snapshotData['recurranceDate']);
    _registrationDate = snapshotData['registrationDate'] as DateTime?;
    _minimumVolunteer = castToType<double>(snapshotData['minimumVolunteer']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('events');

  static Stream<EventsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventsRecord.fromSnapshot(s));

  static Future<EventsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EventsRecord.fromSnapshot(s));

  static EventsRecord fromSnapshot(DocumentSnapshot snapshot) => EventsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventsRecord._(reference, mapFromFirestore(data));

  static EventsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      EventsRecord.getDocumentFromData(
        {
          'eventTitle': snapshot.data['eventTitle'],
          'eventPhotoUrl': snapshot.data['eventPhotoUrl'],
          'eventDescription': snapshot.data['eventDescription'],
          'eventInChargePerson': snapshot.data['eventInChargePerson'],
          'event_Location': safeGet(
            () => LatLng(
              snapshot.data['_geoloc']['lat'],
              snapshot.data['_geoloc']['lng'],
            ),
          ),
          'eventAddress': snapshot.data['eventAddress'],
          'volunteer_names': safeGet(
            () => snapshot.data['volunteer_names'].toList(),
          ),
          'needed_volunteer_count':
              snapshot.data['needed_volunteer_count']?.toDouble(),
          'neededVolunteer': snapshot.data['neededVolunteer']?.toDouble(),
          'created_date': safeGet(
            () => DateTime.fromMillisecondsSinceEpoch(
                snapshot.data['created_date']),
          ),
          'eventTag': safeGet(
            () => snapshot.data['eventTag'].toList(),
          ),
          'isEnded': snapshot.data['isEnded'],
          'volunteer_count': snapshot.data['volunteer_count']?.toDouble(),
          'isDeleted': snapshot.data['isDeleted'],
          'eventContactNumber': snapshot.data['eventContactNumber'],
          'isConfirmbySA': snapshot.data['isConfirmbySA'],
          'expiry_date': safeGet(
            () => DateTime.fromMillisecondsSinceEpoch(
                snapshot.data['expiry_date']),
          ),
          'admin_ref': safeGet(
            () => snapshot.data['admin_ref'].map((s) => toRef(s)).toList(),
          ),
          'eventDateStart': safeGet(
            () => DateTime.fromMillisecondsSinceEpoch(
                snapshot.data['eventDateStart']),
          ),
          'eventDateEnd': safeGet(
            () => DateTime.fromMillisecondsSinceEpoch(
                snapshot.data['eventDateEnd']),
          ),
          'isReqCancel': snapshot.data['isReqCancel'],
          'volunteer_ref': safeGet(
            () => snapshot.data['volunteer_ref'].map((s) => toRef(s)).toList(),
          ),
          'partnerOrg_ref': safeGet(
            () => toRef(snapshot.data['partnerOrg_ref']),
          ),
          'volunteer_list': safeGet(
            () => snapshot.data['volunteer_list'].toList(),
          ),
          'isRecurring': snapshot.data['isRecurring'],
          'rateTotal': snapshot.data['rateTotal']?.toDouble(),
          'rateCount': snapshot.data['rateCount']?.toDouble(),
          'reason': snapshot.data['reason'],
          'isDeclined': snapshot.data['isDeclined'],
          'rate_ref': safeGet(
            () => snapshot.data['rate_ref'].map((s) => toRef(s)).toList(),
          ),
          'ageRequirement': snapshot.data['ageRequirement']?.round(),
          'isMeritScoreUpdated': snapshot.data['isMeritScoreUpdated'],
          'addRequirementEvent': snapshot.data['addRequirementEvent'],
          'organization_partnter': snapshot.data['organization_partnter'],
          'recurranceDate': safeGet(
            () => snapshot.data['recurranceDate'].toList(),
          ),
          'registrationDate': safeGet(
            () => DateTime.fromMillisecondsSinceEpoch(
                snapshot.data['registrationDate']),
          ),
          'minimumVolunteer': snapshot.data['minimumVolunteer']?.toDouble(),
        },
        EventsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<EventsRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'events',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'EventsRecord(reference: ${reference.path}, data: $snapshotData)';
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
  bool? isReqCancel,
  DocumentReference? partnerOrgRef,
  bool? isRecurring,
  double? rateTotal,
  double? rateCount,
  String? reason,
  bool? isDeclined,
  int? ageRequirement,
  bool? isMeritScoreUpdated,
  String? addRequirementEvent,
  String? organizationPartnter,
  DateTime? registrationDate,
  double? minimumVolunteer,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'eventTitle': eventTitle,
      'eventPhotoUrl': eventPhotoUrl,
      'eventDescription': eventDescription,
      'eventInChargePerson': eventInChargePerson,
      'event_Location': eventLocation,
      'eventAddress': eventAddress,
      'needed_volunteer_count': neededVolunteerCount,
      'neededVolunteer': neededVolunteer,
      'created_date': createdDate,
      'isEnded': isEnded,
      'volunteer_count': volunteerCount,
      'isDeleted': isDeleted,
      'eventContactNumber': eventContactNumber,
      'isConfirmbySA': isConfirmbySA,
      'expiry_date': expiryDate,
      'eventDateStart': eventDateStart,
      'eventDateEnd': eventDateEnd,
      'isReqCancel': isReqCancel,
      'partnerOrg_ref': partnerOrgRef,
      'isRecurring': isRecurring,
      'rateTotal': rateTotal,
      'rateCount': rateCount,
      'reason': reason,
      'isDeclined': isDeclined,
      'ageRequirement': ageRequirement,
      'isMeritScoreUpdated': isMeritScoreUpdated,
      'addRequirementEvent': addRequirementEvent,
      'organization_partnter': organizationPartnter,
      'registrationDate': registrationDate,
      'minimumVolunteer': minimumVolunteer,
    }.withoutNulls,
  );

  return firestoreData;
}
