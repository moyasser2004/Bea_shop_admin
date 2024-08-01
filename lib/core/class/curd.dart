import 'dart:convert';
import 'dart:io';

import 'package:bea_admin/core/class/request_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';


import '../function/internet_connect.dart';
import 'dart:async';


class Curd {

  Future<Either<RequestState, Map<String, dynamic>>> post(String url,
      Map<String, dynamic> data) async {
    try {
      if (await internetConnect()) {
        var response = await http.post(Uri.parse(url), body: data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map<String, dynamic> responseBody = jsonDecode(response.body);
          return Right(responseBody);
        } else {
          return const Left(RequestState.serverFailure);
        }
      } else {
        return const Left(RequestState.internetFailure);
      }
    } catch (e) {
      return const Left(RequestState.error);
    }
  }

  Future<Either<RequestState, Map<String, dynamic>>> get(String url) async {
    try {
      if (await internetConnect()) {
        var response = await http.get(
          Uri.parse(url),
        );
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map<String, dynamic> responseBody = jsonDecode(response.body);
          return Right(responseBody);
        } else {
          return const Left(RequestState.serverFailure);
        }
      } else {
        return const Left(RequestState.internetFailure);
      }
    } catch (e) {
      return const Left(RequestState.error);
    }
  }

  Future<Either<RequestState, Map<String, dynamic>>> postRequestFile(String url,
      Map data, File file) async {
    var request = http.MultipartRequest("POST", Uri.parse(url));

    var length = await file.length();
    var stream = http.ByteStream(file.openRead());
    var multipartFile = http.MultipartFile(
        "file", stream, length, filename: basename(file.path));

    request.files.add(multipartFile);

    data.forEach((key, value) {
      request.fields[key] = value;
    });

    var myRequest = await request.send();

    var response = await http.Response.fromStream(myRequest);

    if (response.statusCode == 200) {
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      return Right(responseBody);
    } else {
      if (kDebugMode) {
        print("Error in image server");
      }
      return const Left(RequestState.serverFailure);
    }
  }




Future<Either<RequestState, Map<String, dynamic>>> postRequestFiles(
    String url,
    Map data,
    File file1,
    File file2,
    ) async {
  var request = http.MultipartRequest("POST", Uri.parse(url));

  var length1 = await file1.length();
  var stream1 = http.ByteStream(file1.openRead());
  var multipartFile1 = http.MultipartFile(
    "file1",
    stream1,
    length1,
    filename: basename(file1.path),
  );

  var length2 = await file2.length();
  var stream2 = http.ByteStream(file2.openRead());
  var multipartFile2 = http.MultipartFile(
    "file2",
    stream2,
    length2,
    filename: basename(file2.path),
  );

  request.files.add(multipartFile1);
  request.files.add(multipartFile2);

  data.forEach((key, value) {
    request.fields[key] = value.toString();
  });

  try {
    var myRequest = await request.send();
    var response = await http.Response.fromStream(myRequest);

    if (response.statusCode == 200) {
      try {
        Map<String, dynamic> responseBody = jsonDecode(response.body);
        return Right(responseBody);
      } catch (e) {
        if (kDebugMode) {
          print("Error parsing JSON response: $e");
        }
        return const Left(RequestState.serverFailure);
      }
    } else {
      if (kDebugMode) {
        print("Error in server: ${response.statusCode}");
      }
      return const Left(RequestState.serverFailure);
    }
  } catch (e) {
    if (kDebugMode) {
      print("Exception occurred: $e");
    }
    return const Left(RequestState.serverFailure);
  }
}

}
