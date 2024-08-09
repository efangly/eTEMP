import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:temp_noti/src/configs/route.dart' as custom_route;

class Logout extends StatelessWidget {
  const Logout({super.key});

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
                child: const Text('ออกจากระบบ',
                    style: TextStyle(color: Colors.red)),
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

    return IconButton.filled(
      padding: const EdgeInsets.all(12.0),
      icon: const Icon(Icons.logout_rounded, size: 40.0),
      onPressed: logout,
      tooltip: 'ลงชื่อออก',
    );
  }
}
