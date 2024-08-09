import 'package:flutter/material.dart';
import 'package:temp_noti/src/pages/pages.dart';
import 'package:temp_noti/src/pages/register_page.dart';
import 'package:temp_noti/src/pages/setting_page.dart';

class Route {
  static const home = '/';
  static const detail = '/detail';
  static const login = '/login';
  static const notification = '/notification';
  static const config = '/config';
  static const bluetooth = '/bluetooth';
  static const register = '/register';
  static const setting = '/setting';

  static Map<String, WidgetBuilder> getAll() => _route;

  static final Map<String, WidgetBuilder> _route = {
    home: (context) => const HomePage(),
    login: (context) => const LoginPage(),
    detail: (context) => const DetailPage(),
    notification: (context) => const NotificationPage(),
    config: (context) => const ConfigPage(),
    bluetooth: (context) => const BluetoothPage(),
    register: (context) => const RegisterPage(),
    setting: (context) => const SettingPage(),
  };
}
