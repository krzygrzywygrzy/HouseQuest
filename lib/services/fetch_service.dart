import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:hq/core/Error.dart';
import 'package:hq/core/Failure.dart';
import 'package:http/http.dart' as http;

class FetchService {
  static const String URL = "";

  static Future<Either<Failure, Map<String, dynamic>>> get(
      String endpoint) async {
    try {
      var url = Uri.parse(URL + endpoint);
      var response = await http.get(url, headers: {
        HttpHeaders.authorizationHeader: "",
      });

      if (response.statusCode == 200) {
        return Right(jsonDecode(response.body));
      } else {
        throw FetchError();
      }
    } catch (err) {
      return Left(FetchFailure());
    }
  }

  static Future<Either<Failure, Map<String, dynamic>>> post(
      String endpoint, Map<String, dynamic> json) async {
    try {
      var url = Uri.parse(URL + endpoint);
      var response = await http.post(
        url,
        headers: {
          HttpHeaders.authorizationHeader: "",
        },
        body: jsonEncode(json),
      );

      if (response.statusCode == 200) {
        return Right(jsonDecode(response.body));
      } else {
        throw FetchError();
      }
    } catch (err) {
      return Left(FetchFailure());
    }
  }
}
