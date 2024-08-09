import 'package:flutter/material.dart';
import 'package:temp_noti/src/constants/color.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:temp_noti/src/configs/route.dart' as custom_route;
import 'package:temp_noti/src/widgets/utils/appbar.dart';

class BluetoothPage extends StatefulWidget {
  const BluetoothPage({super.key});

  @override
  State<BluetoothPage> createState() => _BluetoothPageState();
}

class _BluetoothPageState extends State<BluetoothPage> {
  @override
  void initState() {
    super.initState();
    FlutterBluePlus.startScan(timeout: const Duration(seconds: 5));
  }

  @override
  void dispose() {
    super.dispose();
    FlutterBluePlus.stopScan();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: CustomAppbar(
          titleInfo: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back,
                    size: 30.0, color: Colors.white60),
              ),
              const Text(
                "Search for devices",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 3, left: 3),
                child: StreamBuilder<bool>(
                  stream: FlutterBluePlus.isScanning,
                  initialData: false,
                  builder: (c, snapshot) {
                    if (snapshot.data!) {
                      return IconButton(
                        onPressed: () => FlutterBluePlus.stopScan(),
                        color: Colors.red,
                        icon: const Icon(Icons.bluetooth_searching, size: 30.0),
                      );
                    } else {
                      return IconButton(
                        icon: const Icon(Icons.bluetooth_sharp, size: 30.0),
                        onPressed: () => FlutterBluePlus.startScan(
                          timeout: const Duration(seconds: 4),
                        ),
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(decoration: ConstColor.bgColor),
          StreamBuilder<List<ScanResult>>(
              stream: FlutterBluePlus.scanResults,
              initialData: const [],
              builder: (context, snapshot) {
                List<ScanResult> result = snapshot.data!
                    .where((i) => i.device.advName != "")
                    .toList();
                if (result.isEmpty) {
                  return const Center(child: Text("No device"));
                }
                return ListView.separated(
                  shrinkWrap: true,
                  itemCount: result.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                  itemBuilder: (BuildContext context, int index) {
                    final data = result[index];
                    return ListTile(
                      title: Text(data.device.advName),
                      subtitle: Text(data.device.platformName),
                      trailing: Text(data.rssi.toString()),
                      onTap: () => {
                        Navigator.pushNamed(
                          context,
                          custom_route.Route.config,
                          arguments: {'device': data},
                        )
                      },
                    );
                  },
                );
              }),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
