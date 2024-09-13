import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temp_noti/src/bloc/device/devices_bloc.dart';
import 'package:temp_noti/src/configs/route.dart' as custom_route;
import 'package:temp_noti/src/constants/color.dart';
import 'package:temp_noti/src/constants/url.dart';
import 'package:temp_noti/src/widgets/home/subtitle_list.dart';
import 'package:temp_noti/src/widgets/utils/toast.dart';

class MachineList extends StatelessWidget {
  const MachineList({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> refreshData() async {
      context.read<DevicesBloc>().add(GetAllDevices());
      await Future.delayed(const Duration(seconds: 1));
    }

    return Container(
      decoration: ConstColor.bgColor,
      child: RefreshIndicator(
        onRefresh: refreshData,
        child: BlocBuilder<DevicesBloc, DevicesState>(builder: (context, state) {
          if (state.devices.isEmpty) {
            return const Center(child: Text("No Device"));
          }
          return ListView.separated(
            itemCount: state.devices.length,
            separatorBuilder: (BuildContext context, int index) => const Divider(
              color: Colors.white38,
              height: 1,
              indent: 15,
              endIndent: 15,
            ),
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(
                  state.devices[index].devDetail ?? "ไม่มีชื่อ",
                  style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
                ),
                tileColor: const Color.fromARGB(255, 165, 190, 202),
                subtitle: SubtitleList(deviceInfo: state.devices[index]),
                trailing: ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: 44,
                    minHeight: 44,
                    maxWidth: 65,
                    maxHeight: 64,
                  ),
                  child: Image.network(
                    "${URL.BASE_URL}${state.devices[index].locPic ?? "/img/default-pic.png"}",
                    fit: BoxFit.cover,
                    width: 55,
                    height: 200,
                    scale: 0.9,
                  ),
                ),
                onTap: (() {
                  try {
                    Navigator.pushNamed(
                      context,
                      custom_route.Route.detail,
                      arguments: {
                        'id': state.devices[index].devId!,
                        'serial': state.devices[index].devSerial!,
                        'name': state.devices[index].devDetail ?? "ไม่มีชื่อ",
                        'loc': state.devices[index].locInstall ?? "-",
                        'status': state.devices[index].alarm ?? false,
                        'humMin': state.devices[index].probe![0].humMin ?? 0,
                        'humMax': state.devices[index].probe![0].humMax ?? 0,
                        'tempMin': state.devices[index].probe![0].tempMin ?? 0,
                        'tempMax': state.devices[index].probe![0].tempMax ?? 0,
                      },
                    );
                  } catch (err) {
                    Toast.showAlertBar(
                      context,
                      'Fail!!',
                      "อุปกรณ์นี้ตั้งค่าไม่สำเร็จ",
                    );
                  }
                }),
              );
            },
          );
        }),
      ),
    );
  }
}
