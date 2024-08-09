import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:temp_noti/src/constants/timer.dart';
import 'package:temp_noti/src/constants/url.dart';
import 'package:temp_noti/src/models/devices.dart';
import 'package:temp_noti/src/models/login.dart';
import 'package:temp_noti/src/models/notification.dart';

class Api {
  Api._internal();

  static final Api _instance = Api._internal();
  factory Api() => _instance;

  static final _dio = Dio()
    ..interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          options.baseUrl = URL.BASE_URL;
          options.headers['Authorization'] = prefs.getString('token') ?? '';
          options.headers["Content-Type"] = "application/json";
          options.connectTimeout = Timer.CONNECT_TIMEOUT;
          options.receiveTimeout = Timer.RECEIVE_TIMEOUT;
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (e, handler) {
          return handler.next(e);
        },
      ),
    );

  static Future<int?> checkLogin(String username, String password) async {
    final Response response = await _dio.post('/auth/login', data: {
      'username': username,
      'password': password,
    });
    if (response.statusCode == 200) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      Login valueMap = Login.fromJson(json.decode(jsonEncode(response.data)));
      await prefs.setString('token', "Bearer ${valueMap.data!.token}");
      await prefs.setString('username', valueMap.data!.userId);
      await prefs.setString('display', valueMap.data!.displayName);
      await prefs.setString('userpic', valueMap.data!.userPic);
      return response.statusCode;
    } else {
      return response.statusCode;
    }
  }

  static Future<List<DeviceList>> getDevice() async {
    List<DeviceList> device = [];
    try {
      final Response response = await _dio.get('/device',
          options: Options(validateStatus: (_) => true));
      if (response.statusCode == 200) {
        Device value = Device.fromJson(response.data as Map<String, dynamic>);
        device = value.data!;
        return device;
      } else {
        return device;
      }
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
      return device;
    }
  }

  static Future<List<NotiList>> getNotification([String? serial]) async {
    List<NotiList> notificate = [];
    String path = serial != null ? '/notification/$serial' : '/notification';
    final Response response =
        await _dio.get(path, options: Options(validateStatus: (_) => true));
    if (response.statusCode == 200) {
      Notifications value =
          Notifications.fromJson(json.decode(jsonEncode(response.data)));
      return value.data!;
    } else {
      return notificate;
    }
  }
}
