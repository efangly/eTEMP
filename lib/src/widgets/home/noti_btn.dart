import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temp_noti/src/bloc/notification/notifications_bloc.dart';
import 'package:temp_noti/src/configs/route.dart' as custom_route;

class NotificationButton extends StatelessWidget {
  const NotificationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsBloc, NotificationsState>(builder: (context, state) {
      if (state.notifications.isEmpty) {
        return IconButton.filled(
          padding: const EdgeInsets.all(12.0),
          icon: const badges.Badge(
            child: Icon(Icons.notifications, size: 40.0),
          ),
          onPressed: () => Navigator.pushNamed(context, custom_route.Route.notification),
        );
      }
      return IconButton.filled(
        padding: const EdgeInsets.all(12.0),
        icon: badges.Badge(
          badgeContent: Text(
            "${state.notifications.length}",
            style: const TextStyle(color: Colors.white, fontSize: 10),
          ),
          position: badges.BadgePosition.topEnd(top: -3, end: -5),
          child: const Icon(Icons.notifications, size: 40.0),
        ),
        onPressed: () => Navigator.pushNamed(context, custom_route.Route.notification),
      );
    });
  }
}
