import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputForm extends StatefulWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;

  const InputForm({
    super.key,
    required this.usernameController,
    required this.passwordController,
  });

  @override
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  final _color = Colors.black54;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildUsername(),
        const Divider(
          height: 22,
          thickness: 1,
          indent: 10,
          endIndent: 10,
        ),
        _buildPassword(),
      ],
    );
  }

  TextField _buildUsername() => TextField(
        controller: widget.usernameController,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: 'Username',
          labelStyle: _textStyle(),
          icon: FaIcon(
            FontAwesomeIcons.userLock,
            size: 25.0,
            color: _color,
          ),
        ),
        style: TextStyle(color: _color),
      );

  TextField _buildPassword() => TextField(
        controller: widget.passwordController,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: 'Password',
          labelStyle: _textStyle(),
          icon: FaIcon(
            FontAwesomeIcons.lock,
            size: 25.0,
            color: _color,
          ),
        ),
        style: TextStyle(color: _color),
        obscureText: true,
      );

  TextStyle _textStyle() => TextStyle(
        fontWeight: FontWeight.w500,
        color: _color,
      );
}
