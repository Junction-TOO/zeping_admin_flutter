import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ZepButton extends StatelessWidget {
  final String url;
  const ZepButton(this.url, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final Uri _url = Uri.parse(url);
        launchUrl(_url);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          color: const Color(0xFF2F7CFA),
          child: const Text(
            'zep',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
