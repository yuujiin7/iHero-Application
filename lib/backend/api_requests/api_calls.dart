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

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
