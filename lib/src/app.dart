import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:temp_noti/src/bloc/devices_bloc/devices_bloc.dart';
import 'package:temp_noti/src/bloc/notifications_bloc/notifications_bloc.dart';
import 'package:temp_noti/src/configs/route.dart' as custom_route;
import 'package:temp_noti/src/services/firebase_api.dart';
// import 'package:temp_noti/src/widgets/utils/sound.dart';

class App extends StatelessWidget {
  const App({super.key, required this.token});
  final String? token;
  @override
  Widget build(BuildContext context) {
    FirebaseMessaging.onBackgroundMessage(FirebaseApi.messagingBackgroundHandler);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      if (kDebugMode) {
        print("Message: ${message.notification?.title}, ${message.notification?.body}, ${message.data.toString()}");
      }
      context.read<DevicesBloc>().add(GetAllDevices());
      context.read<NotificationsBloc>().add(GetAllNotifications());
      Fluttertoast.showToast(
        msg: "${message.notification?.title}: ${message.notification?.body}",
        textColor: Colors.white70,
        backgroundColor: Colors.grey,
        gravity: ToastGravity.BOTTOM,
        fontSize: 18,
        toastLength: Toast.LENGTH_SHORT,
      );
      // PlaySound.notification();
    });
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: token == null ? '/login' : '/',
      routes: custom_route.Route.getAll(),
      title: 'ThanesEtemp',
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Anuphan',
      ),
    );
  }
}
