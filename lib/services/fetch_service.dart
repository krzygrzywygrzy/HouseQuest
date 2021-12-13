import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:hq/core/error.dart';
import 'package:hq/core/failure.dart';
import 'package:http/http.dart' as http;

class FetchService {
  static const String _url = "https://homequest.herokuapp.com/api";

  static Future<Either<Failure, Map<String, dynamic>>> get(
      String endpoint) async {
    try {
      var url = Uri.parse(_url + endpoint);
      var response = await http.get(url, headers: {
        HttpHeaders.authorizationHeader: "",
      });

      if (response.statusCode == 200) {
        return Right(jsonDecode(response.body));
      } else {
        throw FetchError(message: jsonDecode(response.body)["message"]);
      }
    } catch (err) {
      return Left(FetchFailure());
    }
  }

  static Future<Either<Failure, Map<String, dynamic>>> post(
      String endpoint, Map<String, dynamic> json) async {
    try {
      var response = await http.post(
        Uri.parse(_url + endpoint),
        headers: {
          HttpHeaders.authorizationHeader: "",
        },
        body: json,
      );
      if (response.statusCode == 200) {
        return Right(jsonDecode(response.body));
      } else {
        throw FetchError(message: jsonDecode(response.body));
      }
    } catch (err) {
      if (err is FetchError) {
        return Left(FetchFailure(message: err.message));
      } else {
        return Left(UnknownFailure());
      }
    }
  }
}
