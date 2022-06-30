import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  final List linksList = [
    {
      'name': 'LinkedIn Profile',
      'icon': const FaIcon(FontAwesomeIcons.linkedinIn, color: Colors.black),
      'color': const Color.fromRGBO(243, 242, 255, 1),
    },
    {
      'name': 'Facebook Profile',
      'icon': const FaIcon(
        FontAwesomeIcons.facebookF,
        color: Colors.black,
      ),
      'color': const Color.fromRGBO(199, 228, 255, 1),
    },
    {
      'name': 'Instagram Profile',
      'icon': const FaIcon(
        FontAwesomeIcons.instagram,
        color: Colors.black,
      ),
      'color': const Color.fromRGBO(255, 242, 242, 1),
    },
    {
      'name': 'Github Profile',
      'icon': const FaIcon(
        FontAwesomeIcons.github,
        color: Colors.black,
      ),
      'color': const Color.fromRGBO(255, 251, 242, 1),
    },
  ];

  Widget linksBox(FaIcon icon, String name, Color color) {
    return InkWell(
      onTap: () {},
      child: Card(
        elevation: 5,
        child: Container(
          width: 299,
          height: 50,
          color: color,
          child: ListTile(
            leading: icon,
            title: Container(
              margin: const EdgeInsets.only(right: 50),
              width: 158,
              height: 32,
              padding: const EdgeInsets.all(4),
              child: Text(
                name,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget iconButtons(FaIcon icon, Color color) {
    return Container(
      width: 57,
      height: 57,
      child: CircleAvatar(
        backgroundColor: color,
        child: IconButton(
          padding: const EdgeInsets.all(4),
          icon: icon,
          onPressed: () {},
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                width: 159,
                height: 159,
                margin: const EdgeInsets.only(
                  top: 64,
                ),
                child: CircleAvatar(
                  backgroundColor: const Color.fromRGBO(189, 255, 215, 0.49),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipOval(
                      child: Image.network(
                        'https://hdwallpaperim.com/wp-content/uploads/2017/08/26/172773-Johnny_Depp.jpg',
                        fit: BoxFit.cover,
                        width: 159,
                        height: 159,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 36,
              ),
              Container(
                width: 257,
                height: 33,
                child: const Text(
                  'FULL NAME',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Avenir',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                width: 257,
                height: 101,
                child: const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitat.',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(114, 114, 114, 1)),
                ),
              ),
              Container(
                width: 299,
                height: 255,
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) => linksBox(
                    linksList[index]['icon'],
                    linksList[index]['name'],
                    linksList[index]['color'],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  iconButtons(
                      const FaIcon(
                        FontAwesomeIcons.whatsappSquare,
                        size: 30,
                        color: Colors.green,
                      ),
                      const Color.fromARGB(255, 212, 251, 237)),
                  iconButtons(
                      const FaIcon(
                        FontAwesomeIcons.solidEnvelope,
                        size: 30,
                        color: Colors.grey,
                      ),
                      const Color.fromRGBO(199, 228, 255, 1)),
                  iconButtons(
                      const FaIcon(
                        FontAwesomeIcons.solidMessage,
                        size: 30,
                        color: Colors.greenAccent,
                      ),
                      const Color.fromARGB(255, 252, 238, 238)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
