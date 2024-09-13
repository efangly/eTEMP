import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temp_noti/src/bloc/device/devices_bloc.dart';
import 'package:temp_noti/src/bloc/notification/notifications_bloc.dart';
import 'package:temp_noti/src/widgets/home/filter.dart';
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
        preferredSize: Size.fromHeight(155),
        child: CustomAppbar(
          titleInfo: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [TitleName(), ManuBar()],
              ),
              SizedBox(height: 5),
              FilterBox(),
            ],
          ),
        ),
      ),
      body: MachineList(),
    );
  }
}
