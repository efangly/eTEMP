import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 450,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(
            FontAwesomeIcons.facebook,
            size: 40.0,
            color: Colors.white60,
          ),
          SizedBox(width: 22),
          FaIcon(
            FontAwesomeIcons.line,
            size: 40.0,
            color: Colors.white60,
          ),
          SizedBox(width: 22),
          Icon(Icons.email, size: 48.0, color: Colors.white60),
          SizedBox(width: 22),
          Icon(Icons.call, size: 40.0, color: Colors.white60),
        ],
      ),
    );
  }
}
