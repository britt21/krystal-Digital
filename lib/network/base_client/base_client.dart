import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../utils/widget/dialog_helper.dart';
import 'base_printer.dart';
import 'exceptions.dart';


class BaseClient {
  final introdata = GetStorage();

  static const int TIME_OUT_DURATION = 180;

  Map<String, String> headers = {
    "Content-Type": "application/json",
  };





  Future<dynamic> get(String baseUrl, String api, {bool use2 = false}) async {
    var token = introdata.read('token');
    var uri = Uri.parse(baseUrl + api);

    if (token != null) {
      headers = {"Content-Type": "application/json", 'authorization': token};
    }
    try {
      if (kDebugMode) {
        print(token);
        getLogger().d(''' URL:: $uri,
         header:: ${json.encode(headers)}''');
      }

      var response = await http
          .get(uri, headers: headers)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));

      if (kDebugMode) {
        getLogger().d(
            'Received Response status code is :${response
                .statusCode} and response body is  ${response.body} ');
      }

      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  dynamic _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(utf8.decode(response.bodyBytes));
        return responseJson;
    //break;
      case 201:
        var responseJson = json.decode(utf8.decode(response.bodyBytes));
        return responseJson;
    // break;
      case 400:
        var responseJson = json.decode(utf8.decode(response.bodyBytes));
        throw BadRequestException(responseJson['message'] ?? 'An error occured',
            response.request!.url.toString());
      case 401:
        var responseJson = json.decode(utf8.decode(response.bodyBytes));
        throw BadRequestException(
            responseJson['message'] ?? responseJson['message'] ?? 'An error occured', response.request!.url.toString());
      case 403:
        var responseJson = json.decode(utf8.decode(response.bodyBytes));
        throw UnAuthorizedException(
            responseJson['error'] ??
                responseJson['message'] ??
                'An error occured',
            response.request!.url.toString());
      case 404:
        var responseJson = json.decode(utf8.decode(response.bodyBytes));
        throw BadRequestException(
            responseJson['error'] ??
                responseJson['message'] ??
                'An error occured',
            response.request!.url.toString());
      case 422:
        var responseJson = json.decode(utf8.decode(response.bodyBytes));
        throw BadRequestException(responseJson['message'] ?? 'An error occured',
            response.request!.url.toString());
      case 503:
        var responseJson = json.decode(utf8.decode(response.bodyBytes));
        throw BadRequestException(responseJson['error'] ?? 'An error occured',
            response.request!.url.toString());
      case 500:
      default:
        var responseJson = json.decode(utf8.decode(response.bodyBytes));
        throw FetchDataException(responseJson['message'] ?? 'An error occured',
            response.request!.url.toString());
    }
  }

}