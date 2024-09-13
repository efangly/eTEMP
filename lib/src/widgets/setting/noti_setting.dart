import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:temp_noti/src/constants/style.dart';

typedef FirstMsgVal = void Function(bool firstMsg);
typedef ReturnToNormalVal = void Function(bool normalMsg);
typedef RepeatVal = void Function(bool repeatMsg);
typedef NotificationVal = void Function(bool notificationMsg);

class NotiSetting extends StatelessWidget {
  final FirstMsgVal onFirstMsg;
  final ReturnToNormalVal onNormalMsg;
  final RepeatVal onRepeatMsg;
  final NotificationVal onNotificationMsg;
  final bool firstMsg;
  final bool normalMsg;
  final bool repeatMsg;
  final bool notificationMsg;
  final TextEditingController firstController;
  final TextEditingController repeatController;
  const NotiSetting({
    super.key,
    required this.onFirstMsg,
    required this.onNormalMsg,
    required this.onRepeatMsg,
    required this.onNotificationMsg,
    required this.firstMsg,
    required this.normalMsg,
    required this.repeatMsg,
    required this.notificationMsg,
    required this.firstController,
    required this.repeatController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            Icon(Icons.notifications, color: Colors.white70),
            Text(
              "Notification Setting",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white70,
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(" Return to normal", style: TextStyle(fontSize: 18)),
            Switch(
              value: normalMsg,
              onChanged: (bool value) => onNormalMsg(value),
              activeColor: Colors.green[800],
              activeTrackColor: Colors.green[400],
              inactiveThumbColor: Colors.grey[600],
              inactiveTrackColor: Colors.white70,
            ),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(" Notification", style: TextStyle(fontSize: 18)),
            Switch(
              value: notificationMsg,
              onChanged: (bool value) => onNotificationMsg(value),
              activeColor: Colors.green[800],
              activeTrackColor: Colors.green[400],
              inactiveThumbColor: Colors.grey[600],
              inactiveTrackColor: Colors.white70,
            ),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(" First message delay", style: TextStyle(fontSize: 18)),
            SizedBox(
              width: 50,
              height: 40,
              child: TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                controller: firstController,
                decoration: const InputDecoration(
                  labelStyle: TextInputStyle.inputStyle,
                ),
                inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(" Repeat", style: TextStyle(fontSize: 18)),
            SizedBox(
              width: 50,
              height: 40,
              child: TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                controller: repeatController,
                decoration: const InputDecoration(
                  labelStyle: TextInputStyle.inputStyle,
                ),
                inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
