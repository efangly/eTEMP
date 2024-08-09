import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temp_noti/src/bloc/devices_bloc/devices_bloc.dart';
import 'package:temp_noti/src/bloc/notifications_bloc/notifications_bloc.dart';
import 'package:temp_noti/src/widgets/home/menu.dart';
import 'package:temp_noti/src/widgets/utils/appbar.dart';
import 'package:temp_noti/src/widgets/home/machine_list.dart';
import 'package:temp_noti/src/widgets/home/title.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<NotificationsBloc>().add(GetAllNotifications());
    context.read<DevicesBloc>().add(GetAllDevices());
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: CustomAppbar(
          titleInfo: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [TitleName(), ManuBar()],
          ),
        ),
      ),
      body: MachineList(),
    );
  }
}
