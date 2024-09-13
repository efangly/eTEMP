import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temp_noti/src/bloc/notification/notifications_bloc.dart';
import 'package:temp_noti/src/widgets/utils/convert.dart';

class DetailInfo extends StatelessWidget {
  const DetailInfo({super.key, required this.serial});
  final String serial;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsBloc, NotificationsState>(builder: (context, state) {
      final notiSerial = state.notifications.where((i) => i.devSerial == serial).toList();
      if (state.notifications.isEmpty) {
        return const Center(child: Text("No Notification"));
      }
      return ListView.separated(
        itemCount: notiSerial.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(color: Colors.white54, height: 1),
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(ConvertMessage.setNotiMsg(notiSerial[index].notiDetail ?? "-/-")),
            tileColor: const Color.fromARGB(255, 165, 190, 202),
            subtitle: Text(
                "${notiSerial[index].createAt.toString().substring(0, 10)} | ${notiSerial[index].createAt.toString().substring(11, 16)}"),
            trailing: ConvertMessage.showIcon(notiSerial[index].notiDetail ?? "-/-"),
          );
        },
      );
    });
  }
}
