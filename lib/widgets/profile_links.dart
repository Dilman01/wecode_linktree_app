import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileLinks extends StatelessWidget {
  final FaIcon icon;
  final String name;
  final Color color;
  final Uri url;

  ProfileLinks(this.icon, this.name, this.color, this.url);

  void _launchUrl(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _launchUrl(url),
      child: Card(
        elevation: 5,
        child: Container(
          width: 299,
          height: 50,
          padding: EdgeInsets.zero,
          color: color,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              icon,
              Container(
                width: 165,
                height: 32,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.zero,
                child: Text(
                  name,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
