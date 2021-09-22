import 'dart:convert';

import 'package:cenafood/models/user.dart';
import 'package:cenafood/shared/value.dart';
import 'package:cenafood/utils/storage_util.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart' show rootBundle;

class UserRepository {
  static Future<User> getUser() async {
    String apiURL = apiBaseURL + '/user';

    final String token = StorageUtil.readStorage('token');

    // Dio dio = Dio();
    // dio.options.connectTimeout = 5000; //5s
    // dio.options.receiveTimeout = 3000;

    // final response = await dio.get(
    //   apiURL,
    //   options: Options(
    //     sendTimeout: 5000,
    //     receiveTimeout: 3000,
    //     followRedirects: false,
    //     validateStatus: (status) {
    //       return status! <= 500;
    //     },
    //     headers: {
    //       'Authorization': 'Bearer $token',
    //       'Accept': 'application/json',
    //       'Content-Type': 'application/json',
    //     },
    //   ),
    // );
    var jsonData = await rootBundle.loadString('assets/json/user.json');
    List foodTypes = List.from(jsonDecode(jsonData));
    return User.fromJson(foodTypes[0]);
    //return User.fromJson(response.data['data']);
  }

  static Future<int> createUser(User user) async {
    String apiURL = apiBaseURL + '/user';

    final String token = StorageUtil.readStorage('token');

    Dio dio = Dio();
    dio.options.connectTimeout = 5000; //5s
    dio.options.receiveTimeout = 3000;

    final response = await Dio().post(apiURL,
        options: Options(
          sendTimeout: 5000,
          receiveTimeout: 3000,
          followRedirects: false,
          validateStatus: (status) {
            return status! <= 500;
          },
          headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
        data: user);

    return response.data['data']['id'];
  }

  static Future<int> updateUser(int id, User user) async {
    String apiURL = apiBaseURL + '/user';

    final String token = StorageUtil.readStorage('token');

    Dio dio = Dio();
    dio.options.connectTimeout = 5000; //5s
    dio.options.receiveTimeout = 3000;

    final response = await Dio().put(apiURL,
        options: Options(
          sendTimeout: 5000,
          receiveTimeout: 3000,
          followRedirects: false,
          validateStatus: (status) {
            return status! <= 500;
          },
          headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
        data: {"id": id, "user": user});

    return response.data['data']['id'];
  }

  static Future<int> deleteUser(int id) async {
    String apiURL = apiBaseURL + '/user';

    final String token = StorageUtil.readStorage('token');

    Dio dio = Dio();
    dio.options.connectTimeout = 5000; //5s
    dio.options.receiveTimeout = 3000;

    final response = await Dio().delete(apiURL,
        options: Options(
          sendTimeout: 5000,
          receiveTimeout: 3000,
          followRedirects: false,
          validateStatus: (status) {
            return status! <= 500;
          },
          headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
        data: {"id": id});

    return response.data['data']['id'];
  }
}
