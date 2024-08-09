import 'package:flutter/material.dart';
import 'package:temp_noti/src/constants/color.dart';
import 'package:temp_noti/src/widgets/detail/detail_info.dart';
import 'package:temp_noti/src/widgets/detail/temp_info.dart';
import 'package:temp_noti/src/widgets/utils/appbar.dart';
import 'package:temp_noti/src/configs/route.dart' as custom_route;

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;
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
                arguments['name'],
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    custom_route.Route.setting,
                    arguments: {'id': arguments['id']},
                  );
                },
                icon: const Icon(
                  Icons.settings,
                  size: 30.0,
                  color: Colors.white60,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        decoration: ConstColor.bgColor,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TempInfo(devSerial: arguments['serial']),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Loc : ${arguments['loc']}',
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 5),
                        Text('TempMin : ${arguments['tempMin']}'),
                        const SizedBox(height: 5),
                        Text('TempMax : ${arguments['tempMax']}'),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Status : ${arguments['status'] ? "อุณหภูมิเกิน" : "ปกติ"}',
                      ),
                      const SizedBox(height: 5),
                      Text('HumiMin : ${arguments['humMin']}'),
                      const SizedBox(height: 5),
                      Text('HumiMax : ${arguments['humMax']}'),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(child: DetailInfo(serial: arguments['serial'])),
            ],
          ),
        ),
      ),
    );
  }
}
