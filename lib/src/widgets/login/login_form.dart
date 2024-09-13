import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:temp_noti/src/bloc/user/users_bloc.dart';
import 'package:temp_noti/src/configs/route.dart' as custom_route;
import 'package:temp_noti/src/services/api.dart';
import 'package:temp_noti/src/widgets/utils/toast.dart';
import 'package:temp_noti/src/widgets/login/input.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController usernameController;
  late TextEditingController passwordController;

  @override
  void initState() {
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        _buildForm(),
        _buildSubmitBtn(),
      ],
    );
  }

  Card _buildForm() => Card(
        margin: const EdgeInsets.only(bottom: 22, left: 15, right: 15),
        elevation: 5.0,
        color: Colors.white70,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: SizedBox(
          width: 450,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 15, right: 20, bottom: 50),
            child: InputForm(
              usernameController: usernameController,
              passwordController: passwordController,
            ),
          ),
        ),
      );

  BoxShadow boxShadowItem(Color color) => BoxShadow(
        color: color,
        offset: const Offset(1.0, 6.0),
        blurRadius: 20.0,
      );

  Container _buildSubmitBtn() {
    const gradientStart = Color.fromARGB(255, 39, 101, 188);
    const gradientEnd = Color.fromARGB(255, 25, 175, 244);
    void submitLogin() {
      usernameController.clear();
      passwordController.clear();
      Navigator.pushNamedAndRemoveUntil(
        context,
        custom_route.Route.home,
        (route) => false,
      );
    }

    return Container(
      width: 140,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        boxShadow: [
          boxShadowItem(gradientStart),
          boxShadowItem(gradientEnd),
        ],
        gradient: const LinearGradient(
          colors: [
            gradientStart,
            gradientEnd,
          ],
          begin: FractionalOffset(0.0, 0.0),
          end: FractionalOffset(1.0, 1.0),
          stops: [0.0, 1.0],
        ),
      ),
      child: TextButton.icon(
        onPressed: () async {
          await Api.checkLogin(usernameController.text, passwordController.text).then((value) {
            context.read<UsersBloc>().add(SetUser(value.data!.displayName, value.data!.userPic));
            submitLogin();
          }).catchError((err) {
            Toast.showAlertBar(
              context,
              'Login Fail!!',
              'ไม่สามารถ Login ได้',
            );
          });
          setState(() {});
        },
        icon: const FaIcon(
          FontAwesomeIcons.userCheck,
          size: 28.0,
          color: Colors.white60,
        ),
        label: const Text(
          'LOGIN',
          style: TextStyle(
            color: Colors.white70,
            fontSize: 22.0,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
