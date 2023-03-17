// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<EventsRecord> _$eventsRecordSerializer =
    new _$EventsRecordSerializer();

class _$EventsRecordSerializer implements StructuredSerializer<EventsRecord> {
  @override
  final Iterable<Type> types = const [EventsRecord, _$EventsRecord];
  @override
  final String wireName = 'EventsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, EventsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.eventTitle;
    if (value != null) {
      result
        ..add('eventTitle')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.eventPhotoUrl;
    if (value != null) {
      result
        ..add('eventPhotoUrl')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.eventDescription;
    if (value != null) {
      result
        ..add('eventDescription')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.eventInChargePerson;
    if (value != null) {
      result
        ..add('eventInChargePerson')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.eventLocation;
    if (value != null) {
      result
        ..add('event_Location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.eventAddress;
    if (value != null) {
      result
        ..add('eventAddress')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.volunteerNames;
    if (value != null) {
      result
        ..add('volunteer_names')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.neededVolunteerCount;
    if (value != null) {
      result
        ..add('needed_volunteer_count')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.neededVolunteer;
    if (value != null) {
      result
        ..add('neededVolunteer')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.createdDate;
    if (value != null) {
      result
        ..add('created_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.eventTag;
    if (value != null) {
      result
        ..add('eventTag')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.isEnded;
    if (value != null) {
      result
        ..add('isEnded')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.volunteerCount;
    if (value != null) {
      result
        ..add('volunteer_count')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.isDeleted;
    if (value != null) {
      result
        ..add('isDeleted')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.eventContactNumber;
    if (value != null) {
      result
        ..add('eventContactNumber')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isConfirmbySA;
    if (value != null) {
      result
        ..add('isConfirmbySA')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.expiryDate;
    if (value != null) {
      result
        ..add('expiry_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.adminRef;
    if (value != null) {
      result
        ..add('admin_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.eventDateStart;
    if (value != null) {
      result
        ..add('eventDateStart')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.eventDateEnd;
    if (value != null) {
      result
        ..add('eventDateEnd')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.isReqCancel;
    if (value != null) {
      result
        ..add('isReqCancel')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.volunteerRef;
    if (value != null) {
      result
        ..add('volunteer_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.partnerOrgRef;
    if (value != null) {
      result
        ..add('partnerOrg_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.volunteerList;
    if (value != null) {
      result
        ..add('volunteer_list')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.isRecurring;
    if (value != null) {
      result
        ..add('isRecurring')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.recurranceDate;
    if (value != null) {
      result
        ..add('recurranceDate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.rateTotal;
    if (value != null) {
      result
        ..add('rateTotal')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.rateCount;
    if (value != null) {
      result
        ..add('rateCount')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.reason;
    if (value != null) {
      result
        ..add('reason')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isDeclined;
    if (value != null) {
      result
        ..add('isDeclined')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.rateRef;
    if (value != null) {
      result
        ..add('rate_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.ageRequirement;
    if (value != null) {
      result
        ..add('ageRequirement')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.isMeritScoreUpdated;
    if (value != null) {
      result
        ..add('isMeritScoreUpdated')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.addRequirementEvent;
    if (value != null) {
      result
        ..add('addRequirementEvent')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.organizationPartnter;
    if (value != null) {
      result
        ..add('organization_partnter')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  EventsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EventsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'eventTitle':
          result.eventTitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'eventPhotoUrl':
          result.eventPhotoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'eventDescription':
          result.eventDescription = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'eventInChargePerson':
          result.eventInChargePerson = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'event_Location':
          result.eventLocation = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng?;
          break;
        case 'eventAddress':
          result.eventAddress = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'volunteer_names':
          result.volunteerNames.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'needed_volunteer_count':
          result.neededVolunteerCount = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'neededVolunteer':
          result.neededVolunteer = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'created_date':
          result.createdDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'eventTag':
          result.eventTag.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'isEnded':
          result.isEnded = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'volunteer_count':
          result.volunteerCount = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'isDeleted':
          result.isDeleted = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'eventContactNumber':
          result.eventContactNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'isConfirmbySA':
          result.isConfirmbySA = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'expiry_date':
          result.expiryDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'admin_ref':
          result.adminRef.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'eventDateStart':
          result.eventDateStart = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'eventDateEnd':
          result.eventDateEnd = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'isReqCancel':
          result.isReqCancel = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'volunteer_ref':
          result.volunteerRef.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'partnerOrg_ref':
          result.partnerOrgRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'volunteer_list':
          result.volunteerList.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'isRecurring':
          result.isRecurring = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'recurranceDate':
          result.recurranceDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'rateTotal':
          result.rateTotal = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'rateCount':
          result.rateCount = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'reason':
          result.reason = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'isDeclined':
          result.isDeclined = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'rate_ref':
          result.rateRef.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'ageRequirement':
          result.ageRequirement = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'isMeritScoreUpdated':
          result.isMeritScoreUpdated = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'addRequirementEvent':
          result.addRequirementEvent = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'organization_partnter':
          result.organizationPartnter = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$EventsRecord extends EventsRecord {
  @override
  final String? eventTitle;
  @override
  final String? eventPhotoUrl;
  @override
  final String? eventDescription;
  @override
  final String? eventInChargePerson;
  @override
  final LatLng? eventLocation;
  @override
  final String? eventAddress;
  @override
  final BuiltList<String>? volunteerNames;
  @override
  final double? neededVolunteerCount;
  @override
  final double? neededVolunteer;
  @override
  final DateTime? createdDate;
  @override
  final BuiltList<String>? eventTag;
  @override
  final bool? isEnded;
  @override
  final double? volunteerCount;
  @override
  final bool? isDeleted;
  @override
  final String? eventContactNumber;
  @override
  final bool? isConfirmbySA;
  @override
  final DateTime? expiryDate;
  @override
  final BuiltList<DocumentReference<Object?>>? adminRef;
  @override
  final DateTime? eventDateStart;
  @override
  final DateTime? eventDateEnd;
  @override
  final bool? isReqCancel;
  @override
  final BuiltList<DocumentReference<Object?>>? volunteerRef;
  @override
  final DocumentReference<Object?>? partnerOrgRef;
  @override
  final BuiltList<String>? volunteerList;
  @override
  final bool? isRecurring;
  @override
  final String? recurranceDate;
  @override
  final double? rateTotal;
  @override
  final double? rateCount;
  @override
  final String? reason;
  @override
  final bool? isDeclined;
  @override
  final BuiltList<DocumentReference<Object?>>? rateRef;
  @override
  final int? ageRequirement;
  @override
  final bool? isMeritScoreUpdated;
  @override
  final String? addRequirementEvent;
  @override
  final String? organizationPartnter;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$EventsRecord([void Function(EventsRecordBuilder)? updates]) =>
      (new EventsRecordBuilder()..update(updates))._build();

  _$EventsRecord._(
      {this.eventTitle,
      this.eventPhotoUrl,
      this.eventDescription,
      this.eventInChargePerson,
      this.eventLocation,
      this.eventAddress,
      this.volunteerNames,
      this.neededVolunteerCount,
      this.neededVolunteer,
      this.createdDate,
      this.eventTag,
      this.isEnded,
      this.volunteerCount,
      this.isDeleted,
      this.eventContactNumber,
      this.isConfirmbySA,
      this.expiryDate,
      this.adminRef,
      this.eventDateStart,
      this.eventDateEnd,
      this.isReqCancel,
      this.volunteerRef,
      this.partnerOrgRef,
      this.volunteerList,
      this.isRecurring,
      this.recurranceDate,
      this.rateTotal,
      this.rateCount,
      this.reason,
      this.isDeclined,
      this.rateRef,
      this.ageRequirement,
      this.isMeritScoreUpdated,
      this.addRequirementEvent,
      this.organizationPartnter,
      this.ffRef})
      : super._();

  @override
  EventsRecord rebuild(void Function(EventsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EventsRecordBuilder toBuilder() => new EventsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EventsRecord &&
        eventTitle == other.eventTitle &&
        eventPhotoUrl == other.eventPhotoUrl &&
        eventDescription == other.eventDescription &&
        eventInChargePerson == other.eventInChargePerson &&
        eventLocation == other.eventLocation &&
        eventAddress == other.eventAddress &&
        volunteerNames == other.volunteerNames &&
        neededVolunteerCount == other.neededVolunteerCount &&
        neededVolunteer == other.neededVolunteer &&
        createdDate == other.createdDate &&
        eventTag == other.eventTag &&
        isEnded == other.isEnded &&
        volunteerCount == other.volunteerCount &&
        isDeleted == other.isDeleted &&
        eventContactNumber == other.eventContactNumber &&
        isConfirmbySA == other.isConfirmbySA &&
        expiryDate == other.expiryDate &&
        adminRef == other.adminRef &&
        eventDateStart == other.eventDateStart &&
        eventDateEnd == other.eventDateEnd &&
        isReqCancel == other.isReqCancel &&
        volunteerRef == other.volunteerRef &&
        partnerOrgRef == other.partnerOrgRef &&
        volunteerList == other.volunteerList &&
        isRecurring == other.isRecurring &&
        recurranceDate == other.recurranceDate &&
        rateTotal == other.rateTotal &&
        rateCount == other.rateCount &&
        reason == other.reason &&
        isDeclined == other.isDeclined &&
        rateRef == other.rateRef &&
        ageRequirement == other.ageRequirement &&
        isMeritScoreUpdated == other.isMeritScoreUpdated &&
        addRequirementEvent == other.addRequirementEvent &&
        organizationPartnter == other.organizationPartnter &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc(0, eventTitle.hashCode), eventPhotoUrl.hashCode), eventDescription.hashCode), eventInChargePerson.hashCode), eventLocation.hashCode), eventAddress.hashCode), volunteerNames.hashCode), neededVolunteerCount.hashCode), neededVolunteer.hashCode), createdDate.hashCode), eventTag.hashCode), isEnded.hashCode), volunteerCount.hashCode), isDeleted.hashCode), eventContactNumber.hashCode), isConfirmbySA.hashCode), expiryDate.hashCode),
                                                                                adminRef.hashCode),
                                                                            eventDateStart.hashCode),
                                                                        eventDateEnd.hashCode),
                                                                    isReqCancel.hashCode),
                                                                volunteerRef.hashCode),
                                                            partnerOrgRef.hashCode),
                                                        volunteerList.hashCode),
                                                    isRecurring.hashCode),
                                                recurranceDate.hashCode),
                                            rateTotal.hashCode),
                                        rateCount.hashCode),
                                    reason.hashCode),
                                isDeclined.hashCode),
                            rateRef.hashCode),
                        ageRequirement.hashCode),
                    isMeritScoreUpdated.hashCode),
                addRequirementEvent.hashCode),
            organizationPartnter.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EventsRecord')
          ..add('eventTitle', eventTitle)
          ..add('eventPhotoUrl', eventPhotoUrl)
          ..add('eventDescription', eventDescription)
          ..add('eventInChargePerson', eventInChargePerson)
          ..add('eventLocation', eventLocation)
          ..add('eventAddress', eventAddress)
          ..add('volunteerNames', volunteerNames)
          ..add('neededVolunteerCount', neededVolunteerCount)
          ..add('neededVolunteer', neededVolunteer)
          ..add('createdDate', createdDate)
          ..add('eventTag', eventTag)
          ..add('isEnded', isEnded)
          ..add('volunteerCount', volunteerCount)
          ..add('isDeleted', isDeleted)
          ..add('eventContactNumber', eventContactNumber)
          ..add('isConfirmbySA', isConfirmbySA)
          ..add('expiryDate', expiryDate)
          ..add('adminRef', adminRef)
          ..add('eventDateStart', eventDateStart)
          ..add('eventDateEnd', eventDateEnd)
          ..add('isReqCancel', isReqCancel)
          ..add('volunteerRef', volunteerRef)
          ..add('partnerOrgRef', partnerOrgRef)
          ..add('volunteerList', volunteerList)
          ..add('isRecurring', isRecurring)
          ..add('recurranceDate', recurranceDate)
          ..add('rateTotal', rateTotal)
          ..add('rateCount', rateCount)
          ..add('reason', reason)
          ..add('isDeclined', isDeclined)
          ..add('rateRef', rateRef)
          ..add('ageRequirement', ageRequirement)
          ..add('isMeritScoreUpdated', isMeritScoreUpdated)
          ..add('addRequirementEvent', addRequirementEvent)
          ..add('organizationPartnter', organizationPartnter)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class EventsRecordBuilder
    implements Builder<EventsRecord, EventsRecordBuilder> {
  _$EventsRecord? _$v;

  String? _eventTitle;
  String? get eventTitle => _$this._eventTitle;
  set eventTitle(String? eventTitle) => _$this._eventTitle = eventTitle;

  String? _eventPhotoUrl;
  String? get eventPhotoUrl => _$this._eventPhotoUrl;
  set eventPhotoUrl(String? eventPhotoUrl) =>
      _$this._eventPhotoUrl = eventPhotoUrl;

  String? _eventDescription;
  String? get eventDescription => _$this._eventDescription;
  set eventDescription(String? eventDescription) =>
      _$this._eventDescription = eventDescription;

  String? _eventInChargePerson;
  String? get eventInChargePerson => _$this._eventInChargePerson;
  set eventInChargePerson(String? eventInChargePerson) =>
      _$this._eventInChargePerson = eventInChargePerson;

  LatLng? _eventLocation;
  LatLng? get eventLocation => _$this._eventLocation;
  set eventLocation(LatLng? eventLocation) =>
      _$this._eventLocation = eventLocation;

  String? _eventAddress;
  String? get eventAddress => _$this._eventAddress;
  set eventAddress(String? eventAddress) => _$this._eventAddress = eventAddress;

  ListBuilder<String>? _volunteerNames;
  ListBuilder<String> get volunteerNames =>
      _$this._volunteerNames ??= new ListBuilder<String>();
  set volunteerNames(ListBuilder<String>? volunteerNames) =>
      _$this._volunteerNames = volunteerNames;

  double? _neededVolunteerCount;
  double? get neededVolunteerCount => _$this._neededVolunteerCount;
  set neededVolunteerCount(double? neededVolunteerCount) =>
      _$this._neededVolunteerCount = neededVolunteerCount;

  double? _neededVolunteer;
  double? get neededVolunteer => _$this._neededVolunteer;
  set neededVolunteer(double? neededVolunteer) =>
      _$this._neededVolunteer = neededVolunteer;

  DateTime? _createdDate;
  DateTime? get createdDate => _$this._createdDate;
  set createdDate(DateTime? createdDate) => _$this._createdDate = createdDate;

  ListBuilder<String>? _eventTag;
  ListBuilder<String> get eventTag =>
      _$this._eventTag ??= new ListBuilder<String>();
  set eventTag(ListBuilder<String>? eventTag) => _$this._eventTag = eventTag;

  bool? _isEnded;
  bool? get isEnded => _$this._isEnded;
  set isEnded(bool? isEnded) => _$this._isEnded = isEnded;

  double? _volunteerCount;
  double? get volunteerCount => _$this._volunteerCount;
  set volunteerCount(double? volunteerCount) =>
      _$this._volunteerCount = volunteerCount;

  bool? _isDeleted;
  bool? get isDeleted => _$this._isDeleted;
  set isDeleted(bool? isDeleted) => _$this._isDeleted = isDeleted;

  String? _eventContactNumber;
  String? get eventContactNumber => _$this._eventContactNumber;
  set eventContactNumber(String? eventContactNumber) =>
      _$this._eventContactNumber = eventContactNumber;

  bool? _isConfirmbySA;
  bool? get isConfirmbySA => _$this._isConfirmbySA;
  set isConfirmbySA(bool? isConfirmbySA) =>
      _$this._isConfirmbySA = isConfirmbySA;

  DateTime? _expiryDate;
  DateTime? get expiryDate => _$this._expiryDate;
  set expiryDate(DateTime? expiryDate) => _$this._expiryDate = expiryDate;

  ListBuilder<DocumentReference<Object?>>? _adminRef;
  ListBuilder<DocumentReference<Object?>> get adminRef =>
      _$this._adminRef ??= new ListBuilder<DocumentReference<Object?>>();
  set adminRef(ListBuilder<DocumentReference<Object?>>? adminRef) =>
      _$this._adminRef = adminRef;

  DateTime? _eventDateStart;
  DateTime? get eventDateStart => _$this._eventDateStart;
  set eventDateStart(DateTime? eventDateStart) =>
      _$this._eventDateStart = eventDateStart;

  DateTime? _eventDateEnd;
  DateTime? get eventDateEnd => _$this._eventDateEnd;
  set eventDateEnd(DateTime? eventDateEnd) =>
      _$this._eventDateEnd = eventDateEnd;

  bool? _isReqCancel;
  bool? get isReqCancel => _$this._isReqCancel;
  set isReqCancel(bool? isReqCancel) => _$this._isReqCancel = isReqCancel;

  ListBuilder<DocumentReference<Object?>>? _volunteerRef;
  ListBuilder<DocumentReference<Object?>> get volunteerRef =>
      _$this._volunteerRef ??= new ListBuilder<DocumentReference<Object?>>();
  set volunteerRef(ListBuilder<DocumentReference<Object?>>? volunteerRef) =>
      _$this._volunteerRef = volunteerRef;

  DocumentReference<Object?>? _partnerOrgRef;
  DocumentReference<Object?>? get partnerOrgRef => _$this._partnerOrgRef;
  set partnerOrgRef(DocumentReference<Object?>? partnerOrgRef) =>
      _$this._partnerOrgRef = partnerOrgRef;

  ListBuilder<String>? _volunteerList;
  ListBuilder<String> get volunteerList =>
      _$this._volunteerList ??= new ListBuilder<String>();
  set volunteerList(ListBuilder<String>? volunteerList) =>
      _$this._volunteerList = volunteerList;

  bool? _isRecurring;
  bool? get isRecurring => _$this._isRecurring;
  set isRecurring(bool? isRecurring) => _$this._isRecurring = isRecurring;

  String? _recurranceDate;
  String? get recurranceDate => _$this._recurranceDate;
  set recurranceDate(String? recurranceDate) =>
      _$this._recurranceDate = recurranceDate;

  double? _rateTotal;
  double? get rateTotal => _$this._rateTotal;
  set rateTotal(double? rateTotal) => _$this._rateTotal = rateTotal;

  double? _rateCount;
  double? get rateCount => _$this._rateCount;
  set rateCount(double? rateCount) => _$this._rateCount = rateCount;

  String? _reason;
  String? get reason => _$this._reason;
  set reason(String? reason) => _$this._reason = reason;

  bool? _isDeclined;
  bool? get isDeclined => _$this._isDeclined;
  set isDeclined(bool? isDeclined) => _$this._isDeclined = isDeclined;

  ListBuilder<DocumentReference<Object?>>? _rateRef;
  ListBuilder<DocumentReference<Object?>> get rateRef =>
      _$this._rateRef ??= new ListBuilder<DocumentReference<Object?>>();
  set rateRef(ListBuilder<DocumentReference<Object?>>? rateRef) =>
      _$this._rateRef = rateRef;

  int? _ageRequirement;
  int? get ageRequirement => _$this._ageRequirement;
  set ageRequirement(int? ageRequirement) =>
      _$this._ageRequirement = ageRequirement;

  bool? _isMeritScoreUpdated;
  bool? get isMeritScoreUpdated => _$this._isMeritScoreUpdated;
  set isMeritScoreUpdated(bool? isMeritScoreUpdated) =>
      _$this._isMeritScoreUpdated = isMeritScoreUpdated;

  String? _addRequirementEvent;
  String? get addRequirementEvent => _$this._addRequirementEvent;
  set addRequirementEvent(String? addRequirementEvent) =>
      _$this._addRequirementEvent = addRequirementEvent;

  String? _organizationPartnter;
  String? get organizationPartnter => _$this._organizationPartnter;
  set organizationPartnter(String? organizationPartnter) =>
      _$this._organizationPartnter = organizationPartnter;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  EventsRecordBuilder() {
    EventsRecord._initializeBuilder(this);
  }

  EventsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _eventTitle = $v.eventTitle;
      _eventPhotoUrl = $v.eventPhotoUrl;
      _eventDescription = $v.eventDescription;
      _eventInChargePerson = $v.eventInChargePerson;
      _eventLocation = $v.eventLocation;
      _eventAddress = $v.eventAddress;
      _volunteerNames = $v.volunteerNames?.toBuilder();
      _neededVolunteerCount = $v.neededVolunteerCount;
      _neededVolunteer = $v.neededVolunteer;
      _createdDate = $v.createdDate;
      _eventTag = $v.eventTag?.toBuilder();
      _isEnded = $v.isEnded;
      _volunteerCount = $v.volunteerCount;
      _isDeleted = $v.isDeleted;
      _eventContactNumber = $v.eventContactNumber;
      _isConfirmbySA = $v.isConfirmbySA;
      _expiryDate = $v.expiryDate;
      _adminRef = $v.adminRef?.toBuilder();
      _eventDateStart = $v.eventDateStart;
      _eventDateEnd = $v.eventDateEnd;
      _isReqCancel = $v.isReqCancel;
      _volunteerRef = $v.volunteerRef?.toBuilder();
      _partnerOrgRef = $v.partnerOrgRef;
      _volunteerList = $v.volunteerList?.toBuilder();
      _isRecurring = $v.isRecurring;
      _recurranceDate = $v.recurranceDate;
      _rateTotal = $v.rateTotal;
      _rateCount = $v.rateCount;
      _reason = $v.reason;
      _isDeclined = $v.isDeclined;
      _rateRef = $v.rateRef?.toBuilder();
      _ageRequirement = $v.ageRequirement;
      _isMeritScoreUpdated = $v.isMeritScoreUpdated;
      _addRequirementEvent = $v.addRequirementEvent;
      _organizationPartnter = $v.organizationPartnter;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EventsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EventsRecord;
  }

  @override
  void update(void Function(EventsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EventsRecord build() => _build();

  _$EventsRecord _build() {
    _$EventsRecord _$result;
    try {
      _$result = _$v ??
          new _$EventsRecord._(
              eventTitle: eventTitle,
              eventPhotoUrl: eventPhotoUrl,
              eventDescription: eventDescription,
              eventInChargePerson: eventInChargePerson,
              eventLocation: eventLocation,
              eventAddress: eventAddress,
              volunteerNames: _volunteerNames?.build(),
              neededVolunteerCount: neededVolunteerCount,
              neededVolunteer: neededVolunteer,
              createdDate: createdDate,
              eventTag: _eventTag?.build(),
              isEnded: isEnded,
              volunteerCount: volunteerCount,
              isDeleted: isDeleted,
              eventContactNumber: eventContactNumber,
              isConfirmbySA: isConfirmbySA,
              expiryDate: expiryDate,
              adminRef: _adminRef?.build(),
              eventDateStart: eventDateStart,
              eventDateEnd: eventDateEnd,
              isReqCancel: isReqCancel,
              volunteerRef: _volunteerRef?.build(),
              partnerOrgRef: partnerOrgRef,
              volunteerList: _volunteerList?.build(),
              isRecurring: isRecurring,
              recurranceDate: recurranceDate,
              rateTotal: rateTotal,
              rateCount: rateCount,
              reason: reason,
              isDeclined: isDeclined,
              rateRef: _rateRef?.build(),
              ageRequirement: ageRequirement,
              isMeritScoreUpdated: isMeritScoreUpdated,
              addRequirementEvent: addRequirementEvent,
              organizationPartnter: organizationPartnter,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'volunteerNames';
        _volunteerNames?.build();

        _$failedField = 'eventTag';
        _eventTag?.build();

        _$failedField = 'adminRef';
        _adminRef?.build();

        _$failedField = 'volunteerRef';
        _volunteerRef?.build();

        _$failedField = 'volunteerList';
        _volunteerList?.build();

        _$failedField = 'rateRef';
        _rateRef?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'EventsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
