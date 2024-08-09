import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temp_noti/firebase_options.dart';
import 'package:temp_noti/src/app.dart';
import 'package:temp_noti/src/bloc/devices_bloc/devices_bloc.dart';
import 'package:temp_noti/src/bloc/notifications_bloc/notifications_bloc.dart';
import 'package:temp_noti/src/services/firebase_api.dart';
import 'package:temp_noti/src/services/network.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  HttpOverrides.global = PostHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotifications();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token');

  final deviceBloc = BlocProvider<DevicesBloc>(create: (context) => DevicesBloc());
  final notificationBloc = BlocProvider<NotificationsBloc>(create: (context) => NotificationsBloc());

  runApp(MultiBlocProvider(
    providers: [deviceBloc, notificationBloc],
    child: App(token: token),
  ));
}
