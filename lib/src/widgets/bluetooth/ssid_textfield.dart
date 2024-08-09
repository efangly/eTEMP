import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:temp_noti/src/constants/style.dart';

class InputWifiInfo extends StatelessWidget {
  final TextEditingController ssidController;
  final TextEditingController wifipasswordController;
  const InputWifiInfo({
    super.key,
    required this.ssidController,
    required this.wifipasswordController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: ssidController,
          decoration: const InputDecoration(
            border: InputBorder.none,
            labelText: 'SSID',
            labelStyle: TextInputStyle.inputStyle,
            icon: FaIcon(
              FontAwesomeIcons.wifi,
              size: 25.0,
              color: Colors.white70,
            ),
          ),
        ),
        const Divider(
          height: 22,
          thickness: 1,
          color: Colors.white70,
        ),
        TextField(
          controller: wifipasswordController,
          decoration: const InputDecoration(
            border: InputBorder.none,
            labelText: 'Password',
            labelStyle: TextInputStyle.inputStyle,
            icon: FaIcon(
              FontAwesomeIcons.lock,
              size: 25.0,
              color: Colors.white70,
            ),
          ),
        ),
      ],
    );
  }
}
