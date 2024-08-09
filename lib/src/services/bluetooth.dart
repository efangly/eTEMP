import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BluetoothInfo {
  final ScanResult scan;
  BluetoothCharacteristic targetCharacteristic;
  BluetoothInfo(this.scan, this.targetCharacteristic);
}
