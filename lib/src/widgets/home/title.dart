import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:temp_noti/src/constants/url.dart';

class TitleName extends StatefulWidget {
  const TitleName({super.key});

  @override
  State<TitleName> createState() => _TitleNameState();
}

class _TitleNameState extends State<TitleName> {
  Future<Map<String, String>> getDisplayname() async {
    Map<String, String> data = <String, String>{"display": "", "pic": ""};
    SharedPreferences prefs = await SharedPreferences.getInstance();
    data["display"] = prefs.getString('display') ?? "-";
    data["pic"] = prefs.getString('userpic') ?? "/img/default-pic.png";
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, String>>(
        future: getDisplayname(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Text("-");
          }
          return Row(
            children: [
              Container(
                padding: const EdgeInsets.all(2),
                margin: const EdgeInsets.only(right: 8), // Border width
                decoration: BoxDecoration(
                  color: Colors.white60,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox.fromSize(
                    size: const Size.fromRadius(20),
                    child: Image.network(
                      "${URL.BASE_URL}${snapshot.data?["pic"] == null ? URL.DEFAULT_PIC : snapshot.data!["pic"]}",
                      fit: BoxFit.cover,
                      height: 50,
                      scale: 0.7,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  snapshot.data!["display"]!,
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 24,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          );
        });
  }
}
