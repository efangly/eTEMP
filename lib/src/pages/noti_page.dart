import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temp_noti/src/bloc/notification/notifications_bloc.dart';
import 'package:temp_noti/src/constants/color.dart';
import 'package:temp_noti/src/widgets/utils/appbar.dart';
import 'package:temp_noti/src/widgets/utils/convert.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

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
                icon: const Icon(Icons.arrow_back, size: 30.0, color: Colors.white60),
              ),
              const Text(
                "Notification",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications,
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
        child: BlocBuilder<NotificationsBloc, NotificationsState>(builder: (context, state) {
          if (state.notifications.isEmpty) {
            return const Center(child: Text("No Notification"));
          }
          return ListView.separated(
            itemCount: state.notifications.length,
            separatorBuilder: (BuildContext context, int index) => const Divider(color: Colors.white54, height: 1),
            itemBuilder: (BuildContext context, int index) {
              String detail = state.notifications[index].notiDetail ?? "-/-";
              return ListTile(
                title: Text(state.notifications[index].device!.devDetail ?? "-"),
                tileColor: const Color.fromARGB(255, 165, 190, 202),
                subtitle: Text(ConvertMessage.setNotiMsg(detail)),
                trailing: Text(
                    "${state.notifications[index].createAt.toString().substring(0, 10)} | ${state.notifications[index].createAt.toString().substring(11, 16)}"),
                onTap: () {},
              );
            },
          );
        }),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
