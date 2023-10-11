import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';

import 'app_exceptions.dart';

class ApiClient extends GetConnect {
  var api = GetConnect();
  dynamic res;
  var headers = {
    'Accept': 'application/json',
    // 'Authorization': 'Bearer ${SessionManager.getToken()}',
  };

  Future<dynamic> getResponse(String endPoint) async {
    try {
      String url = "";
      var response =
          await get(url, headers: headers).timeout(const Duration(seconds: 10));
      res = returnResponse(response);
      printInfo(info: 'GET API CALLING');
      printInfo(info: 'url$url');
      printInfo(info: 'res$res');
    } on SocketException catch (e) {
      throw NoInternetException(e.message);
    } on TimeoutException catch (e) {
      throw RequestTimeOut(e.message);
    }
    return res;
  }

  Future<dynamic> postResponse(
      String endPoint, dynamic body, bool isEncoded) async {
    if (isEncoded) {
      headers.addAll({
        'Content-Type': 'application/json',
      });
    } else {
      headers.addAll({
        'Content-Type': 'application/x-www-form-urlencoded',
      });
    }

    try {
      var url = "";
      var response = await post(
        url, body,
        // headers: {SessionManager.getToken() != null ? headers : null}
      ).timeout(const Duration(seconds: 10));
      res = returnResponse(response);
      printInfo(info: 'POST API CALLING');
      printInfo(info: 'url$url');
      printInfo(info: 'res$res');
    } on SocketException catch (e) {
      throw NoInternetException(e.message);
    } on TimeoutException catch (e) {
      throw RequestTimeOut(e.message);
    }
    return res;
  }

  @override
  Future<dynamic> putResponse(
      String endPoint, dynamic body, bool isEncoded) async {
    if (isEncoded) {
      headers.addAll({
        'Content-Type': 'application/json',
      });
    } else {
      headers.addAll({
        'Content-Type': 'application/x-www-form-urlencoded',
      });
    }

    try {
      var url = "";
      var response = await put(url, body, headers: headers)
          .timeout(const Duration(seconds: 10));
      res = returnResponse(response);
      printInfo(info: 'PUT API CALLING');
      printInfo(info: 'url$url');
      printInfo(info: 'res$res');
    } on SocketException catch (e) {
      throw NoInternetException(e.message);
    } on TimeoutException catch (e) {
      throw RequestTimeOut(e.message);
    }
    return res;
  }

  @override
  Future<dynamic> deleteResponse(String endPoint) async {
    try {
      var url = '';
      var response = await delete(url, headers: headers)
          .timeout(const Duration(seconds: 10));
      res = returnResponse(response);
      printInfo(info: 'DELETE API CALLING');
      printInfo(info: 'url$url');
      printInfo(info: 'res$res');
    } on SocketException catch (e) {
      throw NoInternetException(e.message);
    } on TimeoutException catch (e) {
      throw RequestTimeOut(e.message);
    }
    return res;
  }

  // @override
  // Future<dynamic> formData(
  //   String endPoint,
  //   dynamic file,
  //   dynamic body,
  //   String method,
  // ) async {
  //   try {
  //     var url = Uri.parse(endPoint);
  //     var request = http.MultipartRequest(method, url);
  //     request.headers.addAll(headers);
  //     file != null ? request.files.addAll(file) : null;
  //     body != null ? request.fields.addAll(body) : null;

  //     var response = await request.send();
  //     var responseData = await response.stream.toBytes();
  //     var responseString = String.fromCharCodes(responseData);
  //     res = jsonDecode(responseString);
  //     printInfo(info: 'FORMDATA API CALLING');
  //     printInfo(info: 'url$url');
  //     printInfo(info: 'res$res');
  //   } on SocketException catch (e) {
  //     throw NoInternetException(e.message);
  //   } on TimeoutException catch (e) {
  //     throw RequestTimeOut(e.message);
  //   }
  //   return res;
  // }

  dynamic returnResponse(response) {
    String jsonString = response.body.toString();
    int startIndex = jsonString.indexOf('{');
    int endIndex = jsonString.lastIndexOf('}');
    String jsonSubstring = jsonString.substring(startIndex, endIndex + 1);
    Map<String, dynamic> jsonMap = json.decode(jsonSubstring);
    String errorMessage = jsonMap['message'];
    printInfo(info: 'statusCode${response.statusCode}');

    switch (response.statusCode) {
      case 200:
        var responseJson = jsonDecode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(errorMessage);
      case 401:
      case 422:
        // throw unauthorizedDialog();
      case 500:
        throw InternalServerException(errorMessage);
      default:
        throw InternalServerException(
            'Internal Server Error : ${response.statusCode}');
    }
  }
}
