import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:temp_noti/src/constants/color.dart';
import 'package:temp_noti/src/widgets/bluetooth/manual_textfield.dart';
import 'package:temp_noti/src/widgets/bluetooth/ssid_textfield.dart';
import 'package:temp_noti/src/widgets/utils/appbar.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({super.key});

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  late ScanResult data;
  late BluetoothCharacteristic targetCharacteristic;
  final ssidController = TextEditingController();
  final wifipasswordController = TextEditingController();
  final ipController = TextEditingController();
  final subnetController = TextEditingController();
  final gatewayController = TextEditingController();
  final dnsController = TextEditingController();
  String mode = "0";
  bool isManual = false;

  Future<void> discoverServices(BluetoothDevice device) async {
    List<BluetoothService> services = await device.discoverServices();
    for (var service in services) {
      for (BluetoothCharacteristic characteristics in service.characteristics) {
        targetCharacteristic = characteristics;
      }
    }
  }

  Future<void> sendDevice(String message, BuildContext context) async {
    try {
      List<int> bytes = utf8.encode(message);
      await targetCharacteristic.write(bytes);
    } catch (error) {
      Fluttertoast.showToast(
        msg: error.toString(),
        backgroundColor: Colors.red,
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }

  Future<void> connectDevice(BuildContext context) async {
    try {
      await data.device.connect();
      await discoverServices(data.device);
    } catch (error) {
      Fluttertoast.showToast(
        msg: error.toString(),
        backgroundColor: Colors.red,
      );
    }
  }

  String setMessage() {
    if (isManual) {
      return "$mode,${ssidController.text},${wifipasswordController.text},${ipController.text},${subnetController.text},${gatewayController.text},${dnsController.text}";
    } else {
      return "$mode,${ssidController.text},${wifipasswordController.text}";
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    ssidController.dispose();
    wifipasswordController.dispose();
    ipController.dispose();
    subnetController.dispose();
    gatewayController.dispose();
    dnsController.dispose();
    data.device.disconnect();
  }

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;
    data = arguments['device'];
    connectDevice(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: CustomAppbar(
          titleInfo: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back, size: 30.0, color: Colors.white60),
              ),
              Text(
                data.device.advName,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              ),
              IconButton(
                onPressed: () async {
                  await sendDevice(setMessage(), context);
                },
                icon: const Icon(Icons.save, size: 30.0),
              ),
            ],
          ),
        ),
      ),
      body: Stack(children: [
        Container(decoration: ConstColor.bgColor),
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              StreamBuilder<BluetoothConnectionState>(
                stream: data.device.connectionState,
                builder: (context, snapshot) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 15),
                      Text(
                        snapshot.data == BluetoothConnectionState.connected ? "Status: Connected" : "Status: Disconnected",
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  );
                },
              ),
              SizedBox(
                width: 400,
                child: Column(
                  children: [
                    InputWifiInfo(
                      ssidController: ssidController,
                      wifipasswordController: wifipasswordController,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 200,
                          child: RadioListTile<String>(
                            selected: true,
                            title: const Text('Auto'),
                            value: "0",
                            groupValue: mode,
                            onChanged: (value) {
                              setState(() {
                                mode = value ?? "0";
                                isManual = false;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          width: 200,
                          child: RadioListTile<String>(
                            title: const Text('Manual'),
                            value: "1",
                            groupValue: mode,
                            onChanged: (value) {
                              setState(() {
                                mode = value ?? "1";
                                isManual = true;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: isManual,
                      child: ManualTextfield(
                        ipController: ipController,
                        subnetController: subnetController,
                        gatewayController: gatewayController,
                        dnsController: dnsController,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
