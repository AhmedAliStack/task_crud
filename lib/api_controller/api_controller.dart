import 'dart:convert';

import 'package:http/http.dart';

import '../utils/utils.dart';

class ApiController {
  String? url;
  final endPoint = "https://cat-fact.herokuapp.com/";

  ApiController({this.url});

  final Map<String, String> _headers = {'Accept': 'application/json'};

  Future getData({String? url, String? token}) async {
    if (token != null) {
      _headers.addAll({'Authorization': "Bearer $token"});
    }

    Response response =
        await get(Uri.parse(endPoint + url!), headers: _headers);
    if (response.statusCode == 200) {
    }else if (response.statusCode == 203) {
      Utils.showMsg(jsonDecode(response.body)["message"], error: true);
    } else {
      errorHandler(response.body, response.statusCode);
    }
    return response;
  }

  Future<Response> postData(
      {String? url,
      dynamic body,
      String? token,
      bool acceptJson = false}) async {
    if (token != null) {
      _headers.addAll({'Authorization': "Bearer $token"});
    }
    if (acceptJson) {
      _headers.addAll({'Accept': "application/json"});
      _headers.addAll({'Content-Type': "application/json"});
    }
    Response response =
        await post(Uri.parse(endPoint + url!), body: body, headers: _headers);
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 204) {
    } else if (response.statusCode == 203) {
      Utils.showMsg(jsonDecode(response.body)["message"], error: true);
    } else {
      errorHandler(response.body, response.statusCode);
    }
    return response;
  }

  void errorHandler(String? errorBody, int? statusCode) {
    String message = "";
    if (errorBody != null) {
      String body = errorBody;
      var jsonObject = jsonDecode(body);
      // var jsonObjectErrors = jsonObject['errors'];
      // message = jsonObject['error'];
      // _log.warning(message);
      // do something here with the value...
    }
  }
}
