import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:movies_app/app/src/home/model/homemodel.dart';

class ApiserviceMovieList {
  Future<List<Movie>?> movieListGetFunction() async {
    try {
      final response = await Dio().get(
        'https://api.tvmaze.com/shows',
      );
      if (response.statusCode! >= 200 || response.statusCode! <= 299) {
        return movieFromJson(jsonEncode(response.data));
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
