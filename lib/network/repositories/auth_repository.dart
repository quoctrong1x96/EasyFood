import 'dart:convert';

import 'package:cenafood/models/auth.dart';
import 'package:cenafood/models/user.dart';
import 'package:cenafood/shared/value.dart';
import 'package:cenafood/utils/response_util.dart';
import 'package:cenafood/utils/storage_util.dart';
import 'package:dio/dio.dart';

import 'package:flutter/services.dart' show rootBundle;

class AuthRepository {
  static Future<ResponseUtil> signIn(Auth auth) async {
    String apiURL = apiBaseURL + 'dang-nhap';

    FormData authData = FormData.fromMap({
      'user_name': auth.email,
      'password': auth.password,
    });

    // final response = await Dio().post(
    //   apiURL,
    //   data: authData,
    //   queryParameters: {"usertype": "1"},
    //   options: Options(
    //     followRedirects: false,
    //     validateStatus: (status) {
    //       return status! <= 500;
    //     },
    //     headers: {
    //       'Accept': 'application/json',
    //       'Content-Type': 'application/json',
    //     },
    //     receiveTimeout: 2000,
    //   ),
    // );
    StorageUtil.writeStorage('token',
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImRlc2lnbmVybG92ZTk2QGdtYWlsLmNvbSIsIm5iZiI6MTYzMjE0MjU3NiwiZXhwIjoxNjMyMTcxMzc2LCJpYXQiOjE2MzIxNDI1NzZ9.ZvqQLwoxiRGrz4iaO-ZMBK9ghvclp-5cYtSWrl5Ur8o");
    // final meta = response.data['meta'];
    // final data = response.data['data'];

    // if (response.statusCode == 200) {
    //   StorageUtil.writeStorage('token', data['access_token']);
    var jsonData = await rootBundle.loadString('assets/json/user.json');

    return ResponseUtil.resultResponse(
        message: "Thành công", //meta['message'],
        data: User.fromJson(
            jsonDecode(jsonData)[0]), // User.fromJson(data['user']),
        statusCode: 200, //response.statusCode,
        error: "",
        list: []);
    // }

    // return ResponseUtil.resultResponse(
    //   message: meta['message'],
    //   error:data['error'],
    //   statusCode: response.statusCode!,
    //   data: [],
    //   list: [],
    // );
  }

  static Future<ResponseUtil> signUp(Auth auth, {String? code}) async {
    String apiURL = apiBaseURL + '/auth/register';

    FormData authData = FormData.fromMap({
      'name': auth.name,
      'email': auth.email,
      'password': auth.password,
      'password_confirmation': auth.confirmPassword,
      'phone_number': auth.phoneNumber,
      'address': auth.address,
      'code': code,
    });

    final response = await Dio().post(
      apiURL,
      data: authData,
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! <= 500;
        },
      ),
    );

    final meta = response.data['meta'];
    final data = response.data['data'];

    if (response.statusCode == 200) {
      StorageUtil.writeStorage('token', data['access_token']);

      return ResponseUtil.resultResponse(
          message: meta['message'],
          data: User.fromJson(data['user']),
          statusCode: response.statusCode!,
          error: "",
          list: []);
    }

    return ResponseUtil.resultResponse(
        message: meta['message'],
        error: data['error'],
        statusCode: response.statusCode!,
        data: [],
        list: []);
  }

  static Future<ResponseUtil> verification(String name, String email) async {
    String apiURL = apiBaseURL + '/auth/verification';

    FormData authData = FormData.fromMap({
      'name': name,
      'email': email,
    });

    final response = await Dio().post(
      apiURL,
      data: authData,
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! <= 500;
        },
      ),
    );

    final meta = response.data['meta'];
    final data = response.data['data'];

    if (response.statusCode == 200) {
      return ResponseUtil.resultResponse(
          message: meta['message'],
          data: data,
          statusCode: response.statusCode!,
          error: "",
          list: []);
    }

    return ResponseUtil.resultResponse(
        message: meta['message'],
        error: data['error'],
        statusCode: response.statusCode!,
        data: [],
        list: []);
  }

  static Future<ResponseUtil> signOut() async {
    String apiURL = apiBaseURL + '/logout';

    final String token = StorageUtil.readStorage('token');

    final response = await Dio().post(
      apiURL,
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! <= 500;
        },
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );

    final meta = response.data['meta'];

    StorageUtil.removeStorage('token');

    return ResponseUtil.resultResponse(
        message: meta['message'],
        statusCode: response.statusCode!,
        data: [],
        error: "",
        list: []);
  }

  static Future<ResponseUtil> sendReset(String email) async {
    String apiURL = apiBaseURL + '/auth/password/send';

    FormData authData = FormData.fromMap({
      'email': email,
    });

    final response = await Dio().post(
      apiURL,
      data: authData,
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! <= 500;
        },
      ),
    );

    final meta = response.data['meta'];
    final data = response.data['data'];

    if (response.statusCode == 200) {
      return ResponseUtil.resultResponse(
          message: meta['message'],
          data: data['access_token'],
          statusCode: response.statusCode!,
          error: "",
          list: []);
    }

    return ResponseUtil.resultResponse(
        message: meta['message'],
        error: data['error'],
        statusCode: response.statusCode!,
        data: [],
        list: []);
  }

  static Future<ResponseUtil> updatePassword(Auth auth) async {
    String apiURL = apiBaseURL + '/auth/password/reset?_method=PUT';

    User fetchedUser = await fetchUser();

    FormData authData = FormData.fromMap({
      'id': fetchedUser.id,
      'password': auth.password,
      'password_confirmation': auth.confirmPassword,
    });

    final response = await Dio().post(
      apiURL,
      data: authData,
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! <= 500;
        },
      ),
    );

    final meta = response.data['meta'];

    return ResponseUtil.resultResponse(
        message: meta['message'],
        statusCode: response.statusCode!,
        data: [],
        error: "",
        list: []);
  }

  static Future<ResponseUtil> social(Auth auth) async {
    String apiURL = apiBaseURL + '/auth/social';

    FormData authData = FormData.fromMap({
      'name': auth.name,
      'email': auth.email,
    });

    final response = await Dio().post(
      apiURL,
      data: authData,
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! <= 500;
        },
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );

    final meta = response.data['meta'];
    final data = response.data['data'];

    if (response.statusCode == 200) {
      return ResponseUtil.resultResponse(
          message: meta['message'],
          data: data['access_token'],
          statusCode: response.statusCode!,
          error: "",
          list: []);
    }

    return ResponseUtil.resultResponse(
        message: meta['message'],
        error: data['error'],
        statusCode: response.statusCode!,
        data: [],
        list: []);
  }

  static Future<User> fetchUser() async {
    String apiURL = apiBaseURL + '/user';

    final String resetToken = StorageUtil.readStorage('reset_token');

    final response = await Dio().get(
      apiURL,
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! <= 500;
        },
        headers: {
          'Authorization': 'Bearer $resetToken',
        },
      ),
    );

    return User.fromJson(response.data['data']);
  }
}
