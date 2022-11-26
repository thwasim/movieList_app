import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:movies_app/app/src/cast/model/model.dart';

class ApiServiceMoviCast {
  Future<List<MovieCast>?> getMovieCast(int id) async {
    try {
      final response = await Dio().get(
        'https://api.tvmaze.com/shows/$id/cast',
      );
      if (response.statusCode! >= 200 || response.statusCode! <= 299) {
        log("success man we got it");
        return movieCastFromJson(jsonEncode(response.data));
      } else {
        log('error');
      }
    } on DioError catch (e) {
      if (e.response == null) {
        log('network error');
      }
      if (e.response?.data != null) {
        log('errrrrro');
      }
      log('hey ');
      if (e.error.toString().contains('SocketException')) {
        log("Connection refused !");
        return null;
      } else {
        log(e.toString());
      }
    }
    return null;
  }
}
