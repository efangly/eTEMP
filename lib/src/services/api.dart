import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:temp_noti/src/constants/timer.dart';
import 'package:temp_noti/src/constants/url.dart';
import 'package:temp_noti/src/models/devices.dart';
import 'package:temp_noti/src/models/login.dart';
import 'package:temp_noti/src/models/notification.dart';
import 'package:temp_noti/src/models/users.dart';

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

  static Future<Login> checkLogin(String username, String password) async {
    try {
      final Response response = await _dio.post('/auth/login', data: {
        'username': username,
        'password': password,
      });
      if (response.statusCode == 200) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        Login valueMap = Login.fromJson(json.decode(jsonEncode(response.data)));
        await prefs.setString('token', "Bearer ${valueMap.data!.token}");
        await prefs.setString('userId', valueMap.data!.userId);
        return valueMap;
      } else {
        throw Exception('Failed to login');
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      throw Exception('Failed to login');
    }
  }

  static Future<List<DeviceList>> getDevice() async {
    List<DeviceList> device = [];
    try {
      final Response response = await _dio.get('/device', options: Options(validateStatus: (_) => true));
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

  static Future<List<NotiList>> getNotification() async {
    List<NotiList> notificate = [];
    try {
      final Response response = await _dio.get('/notification', options: Options(validateStatus: (_) => true));
      if (response.statusCode == 200) {
        Notifications value = Notifications.fromJson(json.decode(jsonEncode(response.data)));
        return value.data!;
      } else {
        return notificate;
      }
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
      return notificate;
    }
  }

  static Future<UserData?> getUser(String userId) async {
    try {
      final Response response = await _dio.get('/user/$userId');
      if (response.statusCode == 200) {
        User value = User.fromJson(json.decode(jsonEncode(response.data)));
        return value.data!;
      } else {
        return null;
      }
    } on DioException catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
      return null;
    }
  }
}
