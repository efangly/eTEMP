import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:temp_noti/src/models/devices.dart';

class SubtitleList extends StatelessWidget {
  const SubtitleList({super.key, this.deviceInfo});
  final DeviceList? deviceInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          deviceInfo!.locInstall ?? "-",
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 2),
        Row(
          children: [
            const FaIcon(FontAwesomeIcons.temperatureHigh, size: 18.0),
            const SizedBox(width: 2),
            Text(
              deviceInfo!.noti!.where((i) => i.notiDetail!.substring(0, 4) == "TEMP").toList().length.toString(),
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(width: 10),
            const FaIcon(FontAwesomeIcons.doorOpen, size: 18.0),
            const SizedBox(width: 2),
            Text(
              deviceInfo!.noti!
                  .where((i) => i.notiDetail!.substring(0, 5) == "PROBE" && i.notiDetail!.substring(13, 15) == "ON")
                  .toList()
                  .length
                  .toString(),
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(width: 10),
            const FaIcon(FontAwesomeIcons.plugCircleXmark, size: 18.0),
            const SizedBox(width: 2),
            Text(
              deviceInfo!.noti!.where((i) => i.notiDetail!.substring(0, 2) == "AC").toList().length.toString(),
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(width: 10),
            const FaIcon(FontAwesomeIcons.sdCard, size: 18.0),
            const SizedBox(width: 2),
            Text(
              deviceInfo!.noti!.where((i) => i.notiDetail!.substring(0, 2) == "SD").toList().length.toString(),
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(width: 10),
            const FaIcon(FontAwesomeIcons.wifi, size: 18.0),
            const SizedBox(width: 2),
            Text(
              deviceInfo!.cCount!.log.toString(),
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(width: 10),
            const FaIcon(FontAwesomeIcons.batteryHalf, size: 18.0),
            const SizedBox(width: 2),
            Text(
              deviceInfo!.log!.isEmpty ? "0%" : "${deviceInfo!.log![0].battery}%",
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ],
    );
  }
}
