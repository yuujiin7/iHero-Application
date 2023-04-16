import 'package:flutter/material.dart';
import 'backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    _address = await secureStorage.getString('ff_address') ?? _address;
    _locationLatLng =
        _latLngFromString(await secureStorage.getString('ff_locationLatLng')) ??
            _locationLatLng;
    _CauseList =
        await secureStorage.getStringList('ff_CauseList') ?? _CauseList;
    _ratingSuggestion =
        await secureStorage.getStringList('ff_ratingSuggestion') ??
            _ratingSuggestion;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  LatLng? _userlocation;
  LatLng? get userlocation => _userlocation;
  set userlocation(LatLng? _value) {
    _userlocation = _value;
  }

  String _searchText = '';
  String get searchText => _searchText;
  set searchText(String _value) {
    _searchText = _value;
  }

  bool _searchActive = false;
  bool get searchActive => _searchActive;
  set searchActive(bool _value) {
    _searchActive = _value;
  }

  List<String> _recentSearches = [];
  List<String> get recentSearches => _recentSearches;
  set recentSearches(List<String> _value) {
    _recentSearches = _value;
  }

  void addToRecentSearches(String _value) {
    _recentSearches.add(_value);
  }

  void removeFromRecentSearches(String _value) {
    _recentSearches.remove(_value);
  }

  void removeAtIndexFromRecentSearches(int _index) {
    _recentSearches.removeAt(_index);
  }

  List<String> _SearchFilter = [];
  List<String> get SearchFilter => _SearchFilter;
  set SearchFilter(List<String> _value) {
    _SearchFilter = _value;
  }

  void addToSearchFilter(String _value) {
    _SearchFilter.add(_value);
  }

  void removeFromSearchFilter(String _value) {
    _SearchFilter.remove(_value);
  }

  void removeAtIndexFromSearchFilter(int _index) {
    _SearchFilter.removeAt(_index);
  }

  bool _volunteerSearchActive = false;
  bool get volunteerSearchActive => _volunteerSearchActive;
  set volunteerSearchActive(bool _value) {
    _volunteerSearchActive = _value;
  }

  String _searchTextForVolunteer = '';
  String get searchTextForVolunteer => _searchTextForVolunteer;
  set searchTextForVolunteer(String _value) {
    _searchTextForVolunteer = _value;
  }

  String _address = '';
  String get address => _address;
  set address(String _value) {
    _address = _value;
    secureStorage.setString('ff_address', _value);
  }

  void deleteAddress() {
    secureStorage.delete(key: 'ff_address');
  }

  LatLng? _locationLatLng;
  LatLng? get locationLatLng => _locationLatLng;
  set locationLatLng(LatLng? _value) {
    _locationLatLng = _value;
    _value != null
        ? secureStorage.setString('ff_locationLatLng', _value.serialize())
        : secureStorage.remove('ff_locationLatLng');
  }

  void deleteLocationLatLng() {
    secureStorage.delete(key: 'ff_locationLatLng');
  }

  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  set startDate(DateTime? _value) {
    _startDate = _value;
  }

  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  set endDate(DateTime? _value) {
    _endDate = _value;
  }

  String _searchCause = '';
  String get searchCause => _searchCause;
  set searchCause(String _value) {
    _searchCause = _value;
  }

  String _searchOrg = '';
  String get searchOrg => _searchOrg;
  set searchOrg(String _value) {
    _searchOrg = _value;
  }

  List<String> _CauseList = [
    'Animal Welfare',
    'Agriculture and Food Security',
    'Arts & Culture',
    'Children & Youth',
    'Clean Water & Sanitation',
    'Community Development',
    'Digital Technology',
    'Disaster Preparedness and Response',
    'Education',
    'Elderly',
    'Electrification and Energy',
    'Environment Sustainability',
    'Gender Equality Empowerment',
    'Good Governance & Transparency',
    'Housing and Shelter',
    'Human Rights & Justice',
    'Hunger Alleviation & Nutrition',
    'Indigenous People',
    'Livelihood Employment',
    'Peace and Conflict Resolution',
    'Persons with Disability',
    'Poverty Alleviation',
    'Sports & Recreation',
    'Volunteerism',
    'Health Well-being'
  ];
  List<String> get CauseList => _CauseList;
  set CauseList(List<String> _value) {
    _CauseList = _value;
    secureStorage.setStringList('ff_CauseList', _value);
  }

  void deleteCauseList() {
    secureStorage.delete(key: 'ff_CauseList');
  }

  void addToCauseList(String _value) {
    _CauseList.add(_value);
    secureStorage.setStringList('ff_CauseList', _CauseList);
  }

  void removeFromCauseList(String _value) {
    _CauseList.remove(_value);
    secureStorage.setStringList('ff_CauseList', _CauseList);
  }

  void removeAtIndexFromCauseList(int _index) {
    _CauseList.removeAt(_index);
    secureStorage.setStringList('ff_CauseList', _CauseList);
  }

  bool _rateIsTapped = false;
  bool get rateIsTapped => _rateIsTapped;
  set rateIsTapped(bool _value) {
    _rateIsTapped = _value;
  }

  List<String> _ratingSuggestion = [
    'Terrible',
    'Poor',
    'Fair',
    'Good',
    'Excellent'
  ];
  List<String> get ratingSuggestion => _ratingSuggestion;
  set ratingSuggestion(List<String> _value) {
    _ratingSuggestion = _value;
    secureStorage.setStringList('ff_ratingSuggestion', _value);
  }

  void deleteRatingSuggestion() {
    secureStorage.delete(key: 'ff_ratingSuggestion');
  }

  void addToRatingSuggestion(String _value) {
    _ratingSuggestion.add(_value);
    secureStorage.setStringList('ff_ratingSuggestion', _ratingSuggestion);
  }

  void removeFromRatingSuggestion(String _value) {
    _ratingSuggestion.remove(_value);
    secureStorage.setStringList('ff_ratingSuggestion', _ratingSuggestion);
  }

  void removeAtIndexFromRatingSuggestion(int _index) {
    _ratingSuggestion.removeAt(_index);
    secureStorage.setStringList('ff_ratingSuggestion', _ratingSuggestion);
  }

  int _rateValue = 0;
  int get rateValue => _rateValue;
  set rateValue(int _value) {
    _rateValue = _value;
  }

  List<String> _forOrgList = [];
  List<String> get forOrgList => _forOrgList;
  set forOrgList(List<String> _value) {
    _forOrgList = _value;
  }

  void addToForOrgList(String _value) {
    _forOrgList.add(_value);
  }

  void removeFromForOrgList(String _value) {
    _forOrgList.remove(_value);
  }

  void removeAtIndexFromForOrgList(int _index) {
    _forOrgList.removeAt(_index);
  }

  bool _isFromFirestore = false;
  bool get isFromFirestore => _isFromFirestore;
  set isFromFirestore(bool _value) {
    _isFromFirestore = _value;
  }

  List<String> _userIDs = [];
  List<String> get userIDs => _userIDs;
  set userIDs(List<String> _value) {
    _userIDs = _value;
  }

  void addToUserIDs(String _value) {
    _userIDs.add(_value);
  }

  void removeFromUserIDs(String _value) {
    _userIDs.remove(_value);
  }

  void removeAtIndexFromUserIDs(int _index) {
    _userIDs.removeAt(_index);
  }

  List<String> _emailList = [];
  List<String> get emailList => _emailList;
  set emailList(List<String> _value) {
    _emailList = _value;
  }

  void addToEmailList(String _value) {
    _emailList.add(_value);
  }

  void removeFromEmailList(String _value) {
    _emailList.remove(_value);
  }

  void removeAtIndexFromEmailList(int _index) {
    _emailList.removeAt(_index);
  }

  DateTime? _startTime;
  DateTime? get startTime => _startTime;
  set startTime(DateTime? _value) {
    _startTime = _value;
  }

  DateTime? _endTime;
  DateTime? get endTime => _endTime;
  set endTime(DateTime? _value) {
    _endTime = _value;
  }

  String _selectedCountryCode = '';
  String get selectedCountryCode => _selectedCountryCode;
  set selectedCountryCode(String _value) {
    _selectedCountryCode = _value;
  }

  DateTime? _birthday;
  DateTime? get birthday => _birthday;
  set birthday(DateTime? _value) {
    _birthday = _value;
  }

  DateTime? _registrationDate;
  DateTime? get registrationDate => _registrationDate;
  set registrationDate(DateTime? _value) {
    _registrationDate = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await write(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await write(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await write(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await write(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await write(key: key, value: ListToCsvConverter().convert([value]));
}
