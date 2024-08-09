import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ConvertMessage {
  static String setNotiMsg(String detail) {
    final msgType = detail.split("/");
    String result = "";
    switch (msgType[0]) {
      case "TEMP":
        if (msgType[1] == "OVER") {
          result = "Temperature is too high";
        } else if (msgType[1] == "LOWER") {
          result = "Temperature is too low";
        } else {
          result = "Temperature returned to normal";
        }
        break;
      case "SD":
        result = msgType[1] == "ON" ? "SDCard connected" : "SDCard failed";
        break;
      case "AC":
        result = msgType[1] == "ON" ? "Power on" : "Power off";
        break;
      default:
        result =
            "${msgType[0].replaceAll("PROBE", "Probe")}: ${msgType[1].replaceAll("DOOR", "Doors")} is ${msgType[2] == "ON" ? "opened" : "closed"}";
    }
    return result;
  }

  static Widget showIcon(String data) {
    final result = data.split("/");
    switch (result[0]) {
      case "TEMP":
        return const FaIcon(FontAwesomeIcons.temperatureHigh, size: 25.0);
      case "SD":
        return const FaIcon(FontAwesomeIcons.sdCard, size: 25.0);
      case "AC":
        return const FaIcon(FontAwesomeIcons.plug, size: 25.0);
      default:
        return FaIcon(result[2] == "ON" ? FontAwesomeIcons.doorOpen : FontAwesomeIcons.doorClosed, size: 25.0);
    }
  }
}
