import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:temp_noti/src/constants/style.dart';

class ManualTextfield extends StatelessWidget {
  final TextEditingController ipController;
  final TextEditingController subnetController;
  final TextEditingController gatewayController;
  final TextEditingController dnsController;
  const ManualTextfield({
    super.key,
    required this.ipController,
    required this.subnetController,
    required this.gatewayController,
    required this.dnsController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        TextField(
          controller: ipController,
          decoration: const InputDecoration(
            border: InputBorder.none,
            labelText: 'IP Address',
            labelStyle: TextInputStyle.inputStyle,
            icon: FaIcon(
              FontAwesomeIcons.addressCard,
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
          controller: subnetController,
          decoration: const InputDecoration(
            border: InputBorder.none,
            labelText: 'Subnet',
            labelStyle: TextInputStyle.inputStyle,
            icon: FaIcon(
              FontAwesomeIcons.networkWired,
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
          controller: gatewayController,
          decoration: const InputDecoration(
            border: InputBorder.none,
            labelText: 'Gateway',
            labelStyle: TextInputStyle.inputStyle,
            icon: FaIcon(
              FontAwesomeIcons.getPocket,
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
          controller: dnsController,
          decoration: const InputDecoration(
            border: InputBorder.none,
            labelText: 'DNS',
            labelStyle: TextInputStyle.inputStyle,
            icon: FaIcon(
              FontAwesomeIcons.server,
              size: 25.0,
              color: Colors.white70,
            ),
          ),
        ),
      ],
    );
  }
}
