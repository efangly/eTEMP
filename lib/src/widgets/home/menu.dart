import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:temp_noti/src/bloc/notifications_bloc/notifications_bloc.dart';
import 'package:temp_noti/src/configs/route.dart' as custom_route;
import 'package:badges/badges.dart' as badges;

enum Menu { setting, logout }

class ManuBar extends StatelessWidget {
  const ManuBar({super.key});

  @override
  Widget build(BuildContext context) {
    void logout() {
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            title: const Text('ลงชื่อออก'),
            content: const Text('ต้องการที่จะออกจากระบบ?'),
            actions: [
              TextButton(
                child: const Text('ยกเลิก'),
                onPressed: () {
                  Navigator.of(dialogContext).pop(); // Dismiss alert dialog
                },
              ),
              TextButton(
                child: const Text('ออกจากระบบ', style: TextStyle(color: Colors.red)),
                onPressed: () {
                  SharedPreferences.getInstance().then((prefs) {
                    prefs.clear();
                    Navigator.of(dialogContext).pop();
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      custom_route.Route.login,
                      (route) => false,
                    );
                  });
                },
              ),
            ],
          );
        },
      );
    }

    return Row(
      children: [
        BlocBuilder<NotificationsBloc, NotificationsState>(
          builder: (context, state) {
            return IconButton(
              padding: const EdgeInsets.all(12.0),
              icon: badges.Badge(
                badgeContent: Text(
                  "${state.notifications.length}",
                  style: const TextStyle(color: Colors.white, fontSize: 8),
                ),
                position: badges.BadgePosition.topEnd(top: -5, end: -5),
                child: const Icon(Icons.notifications, size: 35.0),
              ),
              onPressed: () => Navigator.pushNamed(context, custom_route.Route.notification),
            );
          },
        ),
        PopupMenuButton<Menu>(
          icon: const Icon(Icons.more_vert, size: 35.0),
          onSelected: (Menu item) {
            switch (item) {
              case Menu.setting:
                Navigator.pushNamed(context, custom_route.Route.bluetooth);
                break;
              default:
                logout();
            }
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
            const PopupMenuItem<Menu>(
              value: Menu.setting,
              child: ListTile(
                leading: Icon(Icons.bluetooth_searching, size: 28),
                title: Text('Connect eTEMP', style: TextStyle(fontSize: 18)),
              ),
            ),
            const PopupMenuItem<Menu>(
              value: Menu.logout,
              child: ListTile(
                leading: Icon(Icons.logout_rounded, size: 28),
                title: Text('Logout', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        )
      ],
    );
  }
}
