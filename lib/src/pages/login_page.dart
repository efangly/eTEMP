import 'package:flutter/material.dart';
import 'package:temp_noti/src/widgets/login/contact_us.dart';
import 'package:temp_noti/src/widgets/login/header.dart';
import 'package:temp_noti/src/widgets/login/login_form.dart';
import 'package:temp_noti/src/widgets/login/signup_btn.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 0, 77, 192),
                  Color.fromARGB(255, 165, 190, 202),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: [0.0, 1.0],
              ),
            ),
          ),
          const SingleChildScrollView(
            child: Column(
              children: [
                Header(),
                LoginForm(),
                SizedBox(height: 15),
                Text(
                  "Contact Us",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white60,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(
                  height: 20,
                  width: 450,
                  child: Divider(
                    height: 22,
                    thickness: 2,
                    indent: 20,
                    endIndent: 20,
                    color: Colors.white70,
                  ),
                ),
                ContactUs(),
                SizedBox(height: 15),
                SignupButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
