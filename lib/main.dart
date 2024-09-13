import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temp_noti/firebase_options.dart';
import 'package:temp_noti/src/app.dart';
import 'package:temp_noti/src/bloc/device/devices_bloc.dart';
import 'package:temp_noti/src/bloc/notification/notifications_bloc.dart';
import 'package:temp_noti/src/bloc/user/users_bloc.dart';
import 'package:temp_noti/src/models/users.dart';
import 'package:temp_noti/src/services/api.dart';
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
  UserData? user = await Api.getUser(prefs.getString('userId') ?? '');
  UsersState usersState = UsersState(displayName: user?.displayName ?? '', userPic: user?.userPic ?? '/img/default-pic.png');

  final deviceBloc = BlocProvider<DevicesBloc>(create: (context) => DevicesBloc());
  final notificationBloc = BlocProvider<NotificationsBloc>(create: (context) => NotificationsBloc());
  final userBloc = BlocProvider<UsersBloc>(create: (context) => UsersBloc(initialState: usersState));

  runApp(MultiBlocProvider(
    providers: [deviceBloc, notificationBloc, userBloc],
    child: App(token: token),
  ));
}
