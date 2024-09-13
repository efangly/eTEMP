import 'package:flutter/material.dart';
import 'package:temp_noti/src/constants/color.dart';
import 'package:temp_noti/src/widgets/setting/noti_setting.dart';
import 'package:temp_noti/src/widgets/setting/schedule_setting.dart';
import 'package:temp_noti/src/widgets/utils/appbar.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final firstController = TextEditingController();
  final repeatController = TextEditingController();
  bool firstMsg = false;
  bool normalMsg = false;
  bool repeatMsg = false;
  bool notificationMsg = false;

  @override
  void initState() {
    super.initState();
    firstController.text = "0";
    repeatController.text = "0";
  }

  @override
  void dispose() {
    super.dispose();
    firstController.dispose();
    repeatController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final arguments = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;
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
                "Setting",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.save,
                  size: 30,
                  color: Colors.white60,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(decoration: ConstColor.bgColor),
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 15, right: 15, bottom: 8),
            child: Column(
              children: [
                NotiSetting(
                  onFirstMsg: (bool msg) => setState(() => firstMsg = msg),
                  onNormalMsg: (bool msg) => setState(() => normalMsg = msg),
                  onRepeatMsg: (bool msg) => setState(() => repeatMsg = msg),
                  onNotificationMsg: (bool msg) => setState(() => notificationMsg = msg),
                  firstMsg: firstMsg,
                  normalMsg: normalMsg,
                  repeatMsg: repeatMsg,
                  notificationMsg: notificationMsg,
                  firstController: firstController,
                  repeatController: repeatController,
                ),
                const ScheduleSetting(),
              ],
            ),
          ),
          // Text(arguments['id']),
        ],
      ),
    );
  }
}
