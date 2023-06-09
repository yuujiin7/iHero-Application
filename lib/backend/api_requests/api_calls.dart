import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class SendEmailCall {
  static Future<ApiCallResponse> call({
    String? serviceId = 'service_goh0ize',
    String? userId = 'UH047zYJllec6akwn',
    String? accessToken = 'HWB-Pwzl-b8RqKhNl0yPR',
    String? appointmentDate = 'date',
    String? toName = 'user',
    String? toEmail = '',
    String? bugReport = 'bug_report',
    String? templateId = 'template_3axj5wc',
    String? title = '',
    String? decription = '',
    String? photoUrl = '',
    String? eventDateStart = '',
    String? eventDateEnd = '',
    String? personInCharge = '',
    String? contactNumber = '',
    String? startTime = '',
    String? endTime = '',
  }) {
    final body = '''
{
  "accessToken": "${accessToken}",
  "service_id": "${serviceId}",
  "template_id": "${templateId}",
  "user_id": "${userId}",
  "template_params": {
    "to_email": "${toEmail}",
    "to_name": "${toName}",
    "appointment_date": "${appointmentDate}",
    "bug_report": "${bugReport}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SendEmail',
      apiUrl: 'https://api.emailjs.com/api/v1.0/email/send',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class SendEmailCopyCall {
  static Future<ApiCallResponse> call({
    String? serviceId = 'service_goh0ize',
    String? userId = 'UH047zYJllec6akwn',
    String? accessToken = 'HWB-Pwzl-b8RqKhNl0yPR',
    String? toName = 'user',
    String? toEmail = '',
    String? bugReport = 'bug_report',
    String? templateId = 'template_3axj5wc',
    String? title = '',
    String? decription = '',
    String? photoUrl = '',
    String? eventDateStart = '',
    String? eventDateEnd = '',
    String? personInCharge = '',
    String? contactNumber = '',
    String? startTime = '',
    String? endTime = '',
  }) {
    final body = '''
{
  "accessToken": "${accessToken}",
  "service_id": "${serviceId}",
  "template_id": "${templateId}",
  "user_id": "${userId}",
  "template_params": {
    "to_email": "${toEmail}",
    "to_name": "${toName}",
    "appointment_date": "<appointment_date>",
    "bug_report": "${bugReport}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SendEmail Copy',
      apiUrl: 'https://api.emailjs.com/api/v1.0/email/send',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CountryCodeCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Country Code',
      apiUrl:
          'https://restcountries.com/v2/all?fields=name,flags,callingCodes,alpha3Code',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic name(dynamic response) => getJsonField(
        response,
        r'''$[:].name''',
        true,
      );
  static dynamic alpha3Code(dynamic response) => getJsonField(
        response,
        r'''$[:].alpha3Code''',
        true,
      );
  static dynamic callingCodes(dynamic response) => getJsonField(
        response,
        r'''$[:].callingCodes''',
        true,
      );
  static dynamic flag(dynamic response) => getJsonField(
        response,
        r'''$[:].flags.png''',
        true,
      );
}

class CountryCodeSearchCall {
  static Future<ApiCallResponse> call({
    String? name = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'countryCodeSearch',
      apiUrl: 'https://restcountries.com/v2/name/${name}',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'name': name,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic name(dynamic response) => getJsonField(
        response,
        r'''$[:].name''',
      );
  static dynamic alpha3Code(dynamic response) => getJsonField(
        response,
        r'''$[:].alpha3Code''',
      );
  static dynamic callingCodes(dynamic response) => getJsonField(
        response,
        r'''$[:].callingCodes''',
      );
  static dynamic flag(dynamic response) => getJsonField(
        response,
        r'''$[:].flags.png''',
      );
}

class NewEventSendGridCall {
  static Future<ApiCallResponse> call({
    String? toEmail = '',
    String? subject = '',
    String? title = '',
    String? description = '',
    String? eventAddress = '',
    String? startDate = '',
    String? endDate = '',
    String? startTime = '',
    String? endTime = '',
    String? personInCharge = '',
    String? contactNumber = '',
    String? photoUrl = '',
  }) {
    final body = '''
{
  "from": {
    "email": "ihero.info@gmail.com"
  },
  "personalizations": [
    {
      "to": [
        {
          "email": "${toEmail}"
        }
      ],
      "dynamic_template_data": {
        "photo_url": "${photoUrl}",
        "title": "${title}",
        "description": "${description}",
        "eventAddress": "${eventAddress}",
        "startDate": "${startDate}",
        "endDate": "${endDate}",
        "startTime": "${startTime}",
        "endTime": "${endTime}",
        "personIncharge": "${personInCharge}",
        "contactNumber": "${contactNumber}"
      }
    }
  ],
  "template_id": "d-71a1cf855c0548a497807aa6aebb00a1"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'New Event SendGrid',
      apiUrl: 'https://api.sendgrid.com/v3/mail/send',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer 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',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class NewAnnouncementSendGridCall {
  static Future<ApiCallResponse> call({
    String? toEmail = '',
    String? subject = '',
    String? title = '',
    String? description = '',
  }) {
    final body = '''
{
  "from": {
    "email": "ihero.info@gmail.com"
  },
  "personalizations": [
    {
      "to": [
        {
          "email": "${toEmail}"
        }
      ],
      "dynamic_template_data": {
        "title": "${title}",
        "description": "${description}"
      }
    }
  ],
  "template_id": "d-9169d5ce98654d2386c49dd4fd37513d"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'New Announcement SendGrid ',
      apiUrl: 'https://api.sendgrid.com/v3/mail/send',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer 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',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ChangePasswordSendGridCall {
  static Future<ApiCallResponse> call({
    String? toEmail = '',
    String? subject = '',
    String? date = '',
    String? time = '',
    String? toName = '',
  }) {
    final body = '''
{
  "from": {
    "email": "ihero.info@gmail.com"
  },
  "personalizations": [
    {
      "to": [
        {
          "email": "${toEmail}"
        }
      ],
      "dynamic_template_data": {
        "Date": "${date}",
        "Time": "${time}",
        "to_name": "${toName}"
      }
    }
  ],
  "template_id": "d-002ec12126a34bc6a3d39484e595969c"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Change Password SendGrid',
      apiUrl: 'https://api.sendgrid.com/v3/mail/send',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer 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',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
