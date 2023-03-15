import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

String? getUserStatus(
  bool? isDeceased,
  DateTime? lastActive,
) {
  if (isDeceased == null || lastActive == null) {
    return "Unknown";
  }

  final now = DateTime.now();
  final inactiveDuration = now.difference(lastActive).inDays;
  if (isDeceased) {
    return 'Deceased';
  } else if (lastActive.isAfter(now)) {
    return 'Offline';
  } else if (now.difference(lastActive).inMinutes < 5) {
    return 'Online';
  } else if (inactiveDuration >= 30) {
    return 'Inactive';
  } else {
    return 'Offline';
  }
}

String? isAdminMode(bool? adminMode) {
  // convert bool into string
  if (adminMode == null) {
    return null;
  }
  return adminMode ? 'On' : 'Off';
}

double? counterVolunteer(
  double volunteercount,
  double neededvolunteer,
) {
  // Add your function code here!
  double result;
  result = volunteercount / neededvolunteer;
  return result;
}

int countnumberofitems(int numberOfItems) {
  // Add your function code here!
  int count;
  count = numberOfItems;

  return count;
}

List<EventsRecord> getPlacesMaximumDistanceCopy(
  List<EventsRecord> places,
  LatLng userGeo,
  double maxDistance,
) {
  // First create some emptyList
  List<EventsRecord> placesList = [];
  List<double> listKm = [];
  double lat1 = userGeo.latitude;
  double lon1 = userGeo.longitude;
  // This iterates through the single documents "places" in the List
  for (EventsRecord place in places) {
    double lat2 = place.eventLocation!.latitude;
    double lon2 = place.eventLocation!.longitude;
    // This is doing math for distance calculations on the surface of a spheroid
    var c = math.cos;
    var p = 0.017453292519943295;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    // This is getting us the distance
    var d = (12742 * math.asin(math.sqrt(a)));
    String inString = d.toStringAsFixed(2); // '2.35'
    double inDouble = double.parse(inString);
    listKm.add(inDouble);
    // Sort the documents that will be returned by distance
    listKm.sort();
    int listKmIndex = listKm.indexWhere((dist) => dist == inDouble);
    // Check if the document we are currently processing is no farther away from userGeo than we defined as max.
    if (inDouble <= maxDistance) {
      // If its within our radius, add it to the list of places documents that will be returned
      placesList.insert(listKmIndex, place);
    }
  }
  return placesList;
}

double? returnDistanceBetweenTwoPointsCopy(
  LatLng? positionOne,
  LatLng? positionTwo,
) {
  // calculate the distance between two points on a spheroid and return distance as double
  var p = 0.017453292519943295;
  var a = 0.5 -
      math.cos((positionTwo!.latitude - positionOne!.latitude) * p) / 2 +
      math.cos(positionOne.latitude * p) *
          math.cos(positionTwo.latitude * p) *
          (1 - math.cos((positionTwo.longitude - positionOne.longitude) * p)) /
          2;
  double result = 12742 * math.asin(math.sqrt(a));
  // uncomment the line below if you want the result to be rounded
  double finalResult = result.roundToDouble();
  // if you uncommented the line above, you have to replace result in the line below with finalResult
  return finalResult;
}

int timeOffer(
  DateTime dateCreation,
  int durationOfDay,
) {
  var today = DateTime.now();
  var diff = today.difference(dateCreation).inDays;

  var dayleft = diff - durationOfDay;
  if (dayleft.isNegative) {
    return dayleft.abs();
  } else {
    return 0;
  }
}

int timeCountdown(
  DateTime eventDate,
  DateTime currentDate,
) {
  // Countdown how many days  between the current date to designated date
  eventDate = DateTime(eventDate.year, eventDate.month, eventDate.day);
  currentDate = DateTime(currentDate.year, currentDate.month, currentDate.day);
  return (eventDate.difference(currentDate).inHours / 24).round();
}

DateTime? addExpiry(DateTime dateArchived) {
  return dateArchived.add(Duration(days: 30, hours: 00));
}

bool? isExistFunction(bool eventExist) {
  if (eventExist == true) {
    return true;
  } else {
    return false;
  }
}

bool finishedEvent(
  DateTime searchEventStartDateIn,
  DateTime searchEventEndDateIn,
) {
  DateTime currentTime = DateTime.now();

  DateTime startDate = searchEventStartDateIn;
  DateTime endDate = searchEventEndDateIn;

  if (currentTime.isBefore(startDate)) {
    return false;
  } else if (currentTime.isAfter(startDate) &&
      (currentTime.isBefore(endDate))) {
    return false;
  } else if (currentTime.isAtSameMomentAs(endDate) ||
      currentTime.isAtSameMomentAs(startDate)) {
    return false;
  } else if (currentTime.isAfter(endDate)) {
    return true;
  } else {
    return true;
  }
}

bool upComingEvent(
  DateTime searchEventStartDateIn,
  DateTime searchEventEndDateIn,
) {
  DateTime currentTime = DateTime.now();

  DateTime startDate = searchEventStartDateIn;
  DateTime endDate = searchEventEndDateIn;

  //kapag true ishoshow yung mga upcoming events
  //kapag false di nya shoshow yung event kase di naman upcoming
  if (currentTime.isBefore(startDate)) {
    print('before start so can show');
    return true;
  } else if (currentTime.isAfter(startDate) &&
      (currentTime.isBefore(endDate))) {
    print('between start and end date ');
    return false;
  } else if (currentTime.isAtSameMomentAs(endDate) ||
      currentTime.isAtSameMomentAs(startDate)) {
    print('sameee ');
    return false;
  } else if (currentTime.isAfter(endDate)) {
    print('Selected Date is after end date so cant show');
    return false;
  } else {
    return false;
  }
}

String formatDateTime(DateTime date) {
//This format the DateTime to String
// Format Date/Time from API
  //DateTime parseDate = DateTime.parse(date);
  DateFormat format = DateFormat.yMMMMd('en_US');
  String formatedDate = format.format(date);
  return formatedDate;
}

bool onGoingEvent(
  DateTime searchEventStartDateIn,
  DateTime searchEventEndDateIn,
) {
  DateTime currentTime = DateTime.now();

  DateTime startDate = searchEventStartDateIn;
  DateTime endDate = searchEventEndDateIn;

  //kapag true ishoshow yung mga ongoing events
  //kapag false di nya shoshow yung event kase di naman ongoing
  if (currentTime.isBefore(startDate)) {
    print('before start so cant show');
    return false;
  } else if (currentTime.isAfter(startDate) &&
      (currentTime.isBefore(endDate))) {
    print('between start and end date ');
    return true;
  } else if (currentTime.isAtSameMomentAs(endDate) ||
      currentTime.isAtSameMomentAs(startDate)) {
    print('sameee ');
    return true;
  } else if (currentTime.isAfter(endDate)) {
    print('Selected Date is after end date so cant show');
    return false;
  } else {
    return false;
  }
}

DateTime? futureDate(
  DateTime? startDate,
  int? minutes,
  int? seconds,
  int? hours,
  int? days,
) {
  // create a new variable for the result
  DateTime result;

  // set initial value from startDate input parameter.
  //If startDate is null then use current Timestamp as StartDate
  result = startDate ?? (DateTime.now());

  // null saftey checks for all input parameters
  int addMinutes = 0 + (minutes ?? 0);
  int addSeconds = 0 + (seconds ?? 0);
  int addHours = 0 + (hours ?? 0);
  int addDays = 0 + (days ?? 0);

//calculate future date by adding all input durations to the StartDate stored in result variable

  result = result.add(Duration(
      seconds: addSeconds,
      minutes: addMinutes,
      hours: addHours,
      days: addDays));

//return final result with the future date

  return result;
}

bool showSearchResult(
  String searchTitleFor,
  String searchTitleIn,
) {
  var search1 =
      searchTitleIn.toLowerCase().contains(searchTitleFor.toLowerCase());
  return search1;
  // var search2 = searchOrgIn.toLowerCase().contains(searchOrgFor.toLowerCase());
}

String getImageAtIndex(
  int? index,
  List<String>? inputList,
) {
  if (inputList == null) {
    throw 'Input list is null!';
  } else if (index == null || index < 0 || index >= inputList.length) {
    throw 'Index out of bounds!';
  } else {
    return inputList[index];
  }
}

int rateSuggestion(int rateValue) {
  int result = rateValue - 1;

  if (result <= 0) {
    return 0;
  } else if (result >= 4) {
    return 4;
  } else {
    return result;
  }
}

String? ratingFunction(int? rating) {
  if (rating! >= 85 && rating <= 100) {
    return ("Excellent");
  } else if (rating <= 80 && rating >= 65) {
    return ("Good");
  } else if (rating <= 60 && rating >= 45) {
    return ("Fair");
  } else if (rating <= 40 && rating >= 25) {
    return ("Low");
  } else if (rating <= 20 && rating >= 0) {
    return ("Extremely Low");
  } else {
    return ("Error");
  }
}

bool showSearchResultCopy(
  String searchTagFor,
  List<String> searchTagIn,
  DateTime searchDateStartFor,
  DateTime searchDateStartIn,
  DateTime searchDateEndFor,
  DateTime searchDateEndIn,
  String searchOrgFor,
  List<String> searchOrgIn,
) {
  if ((searchDateStartIn.isAfter(searchDateEndFor) ||
          searchDateStartIn.isBefore(searchDateStartFor)) ||
      (searchDateEndIn.isBefore(searchDateStartFor) ||
          searchDateEndIn.isAfter(searchDateEndFor)) ||
      (!searchDateStartIn.isAtSameMomentAs(searchDateStartFor) &&
          !searchDateEndIn.isAtSameMomentAs(searchDateEndFor))) {
    return false;
  }
  for (var tag in searchTagIn) {
    if (tag.contains(searchTagFor)) {
      break;
    }
    if (tag == searchTagIn.last) {
      return false;
    }
  }
  for (var org in searchOrgIn) {
    if (org.contains(searchOrgFor)) {
      break;
    }
    if (org == searchOrgIn.last) {
      return false;
    }
  }
  return true;
}

String customColorRating(int rating) {
  String color;
  if (rating >= 85 && rating <= 100) {
    color = ("#57e32c");
  } else if (rating < 85 && rating >= 65) {
    color = ("#b7dd29");
  } else if (rating < 65 && rating >= 45) {
    color = ("#ffe23b");
  } else if (rating < 45 && rating >= 25) {
    color = ("#ffa534");
  } else if (rating < 25 && rating >= 0) {
    color = ("#ff0000");
  } else {
    color = ("#ff0000");
  }
  return color;
}

double meritCounter(int merit) {
  return merit / 100;
}

String pointEquivalent(double point) {
  if (point >= 85 && point <= 100) {
    return ("Congratulations! Keep up the great work! Your dedication and commitment to the volunteer program are greatly appreciated. Keep striving for excellence!");
  } else if (point < 85 && point >= 65) {
    return ("Needs room for improvement. Keep working hard and be proactive in your involvement in the volunteer program. Your contributions are valuable and make a difference!");
  } else if (point < 65 && point >= 45) {
    return ("We encourage you to review your performance and consider ways to improve. Remember, your involvement and dedication to the volunteer program are crucial to its success. Let's work together to achieve your full potential!");
  } else if (point < 55 && point >= 25) {
    return ("Your credit score has fallen into the low range. We recommend that you take the necessary steps to join events to improve your performance and regain your excellent standing. If you need support or have questions, please don't hesitate to reach out to us.");
  } else if (point < 25 && point >= 0) {
    return ("Your credit score is extremely low. As a result, your account has been temporarily suspended and you are temporarily ineligible to join any events or activities organized by the volunteer organization. We strongly encourage you to visit our office to discuss your performance and take the necessary steps to reactivate your account and improve your credit score. Your involvement and commitment to the volunteer program are important, and we are here to help you succeed!");
  } else {
    return ("Your credit score is extremely low. As a result, your account has been temporarily suspended and you are temporarily ineligible to join any events or activities organized by the volunteer organization. We strongly encourage you to visit our office to discuss your performance and take the necessary steps to reactivate your account and improve your credit score. Your involvement and commitment to the volunteer program are important, and we are here to help you succeed!");
  }
}

int getListIndex(
  String value,
  List<String> list,
) {
  return list.indexOf(value);
}

List<String> getListValueListFormat(
  List<int> indices,
  List<String> myList,
) {
  List<String> items = [];

  for (int index in indices) {
    if (index >= 0 && index < myList.length) {
      String item = myList[index];
      items.add(item);
    } else {
      print("Index out of range");
    }
  }

  return items;
}

List<String> sortList(List<String> myList) {
  List<String> sortedList = myList;
  sortedList.sort();

  return sortedList;
}

bool isListEmpty(List<String> myList) {
  bool isEmpty = myList.isEmpty;

  return isEmpty;
}

String getListValue(
  List<String> myList,
  int index,
) {
  if (index >= 0 && index < myList.length) {
    return myList[index];
  } else {
    return "Index out of range";
  }
}

String getFileNameFromUrl(String url) {
  List<String> segments = Uri.parse(url).pathSegments;
  String fileNameWithQueryParams = segments.last;
  int questionMarkIndex = fileNameWithQueryParams.indexOf("?");
  String fileName = fileNameWithQueryParams.substring(
      0,
      questionMarkIndex != -1
          ? questionMarkIndex
          : fileNameWithQueryParams.length);
  String fullPath = Uri.decodeComponent(fileName);

  List<String> pathSegments = fullPath.split("/");
  return pathSegments.last;
}

List<String>? getDaysBetweenDates(
  DateTime? startDate,
  DateTime? endDate,
) {
  if (startDate == null || endDate == null) {
    return ['no date specified'];
  }
  final dateFormat = DateFormat('EEEE');
  final days = <String>[];
  final start = DateTime(startDate.year, startDate.month, startDate.day);
  final end = DateTime(endDate.year, endDate.month, endDate.day);
  final addedDays = <String>{};
  for (var date = start;
      date.isBefore(end) || date.isAtSameMomentAs(end);
      date = date.add(const Duration(days: 1))) {
    final dayName = dateFormat.format(date);
    if (!addedDays.contains(dayName)) {
      days.add(dayName);
      addedDays.add(dayName);
    }
  }
  days.sort((a, b) => DateFormat('EEEE')
      .parse(a)
      .weekday
      .compareTo(DateFormat('EEEE').parse(b).weekday));
  return days;
}

String? getStatusColor(
  bool? isDeceased,
  DateTime? lastActive,
) {
  if (isDeceased == null || lastActive == null) {
    return "57e32c";
  }

  final now = DateTime.now();
  final inactiveDuration = now.difference(lastActive).inDays;
  if (isDeceased) {
    return '#2e2b2b';
  } else if (lastActive.isAfter(now)) {
    return '#ff0000';
  } else if (now.difference(lastActive).inMinutes < 5) {
    return '#57e32c';
  } else if (inactiveDuration >= 30) {
    return '#0051ff';
  } else {
    return '#ff0000';
  }
}

String formatEmailList(List<String> emails) {
  String formattedEmails = '';
  for (int i = 0; i < emails.length; i++) {
    if (i == 0) {
      formattedEmails += emails[i];
    } else {
      formattedEmails += ', ${emails[i]}';
    }
  }
  return formattedEmails;
}

String getStringAtIndex(
  int? index,
  List<String>? inputList,
) {
  if (inputList == null) {
    throw 'Input list is null!';
  } else if (index == null) {
    throw 'Index is null!';
  } else if (index < 0 || index >= inputList.length) {
    throw 'Index out of bounds!';
  } else {
    return inputList[index];
  }
}

String getFileNamesFromUrls(List<String> urls) {
  List<String> fileNames = [];
  String delimiter = ",";

  for (String url in urls) {
    String fileName = getFileNameFromUrl(url);
    fileNames.add(fileName);
  }

  return fileNames.join(delimiter);
}

int calculateAge(DateTime birthday) {
  DateTime currentDate = DateTime.now();
  int age = currentDate.year - birthday.year;
  if (currentDate.month < birthday.month ||
      (currentDate.month == birthday.month && currentDate.day < birthday.day)) {
    age--;
  }
  return age;
}
