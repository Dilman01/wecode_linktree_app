import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wecode_linktree_app/screens/chat_screen.dart';
import 'package:wecode_linktree_app/widgets/profile_links.dart';

class HomeScreen extends StatelessWidget {
  final List linksList = [
    {
      'name': 'LinkedIn Profile',
      'icon': const FaIcon(FontAwesomeIcons.linkedinIn, color: Colors.black),
      'color': const Color.fromRGBO(243, 242, 255, 1),
      'url': Uri.parse('https://www.linkedin.com/in/dilman-arif-948465240/'),
    },
    {
      'name': 'Facebook Profile',
      'icon': const FaIcon(FontAwesomeIcons.facebookF, color: Colors.black),
      'color': const Color.fromRGBO(199, 228, 255, 1),
      'url': Uri.parse('https://www.facebook.com/dilman.arif/'),
    },
    {
      'name': 'Instagram Profile',
      'icon': const FaIcon(
        FontAwesomeIcons.instagram,
        color: Colors.black,
      ),
      'color': const Color.fromRGBO(255, 242, 242, 1),
      'url': Uri.parse('https://www.instagram.com/dilman.01/'),
    },
    {
      'name': 'Github Profile',
      'icon': const FaIcon(
        FontAwesomeIcons.github,
        color: Colors.black,
      ),
      'color': const Color.fromRGBO(255, 251, 242, 1),
      'url': Uri.parse('https://github.com/Dilman01'),
    },
  ];

  Widget iconButtons(FaIcon icon, Color color, Function function) {
    return Container(
      width: 57,
      height: 57,
      child: CircleAvatar(
        backgroundColor: color,
        child: IconButton(
          padding: const EdgeInsets.all(4),
          icon: icon,
          onPressed: () => function(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
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
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('users')
                        .doc(user!.uid)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: Text('Loading...'),
                        );
                      }
                      if (snapshot.hasError) {
                        print(snapshot.error);
                        return const Center(
                          child: Text('Something went wrong!'),
                        );
                      }

                      return Text(
                        snapshot.data!.data()!['username'],
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Avenir',
                        ),
                        textAlign: TextAlign.center,
                      );
                    }),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                width: 257,
                height: 100,
                child: const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitat.',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(114, 114, 114, 1),
                  ),
                  textAlign: TextAlign.center,
                  textScaleFactor: 1,
                ),
              ),
              Container(
                width: 299,
                height: 300,
                child: ListView.builder(
                  itemCount: linksList.length,
                  itemBuilder: (context, index) => ProfileLinks(
                    linksList[index]['icon'],
                    linksList[index]['name'],
                    linksList[index]['color'],
                    linksList[index]['url'],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 150,
                    height: 50,
                    child: ElevatedButton.icon(
                      icon: const Icon(
                        Icons.logout,
                        size: 30,
                      ),
                      label: const Text(
                        'Logout',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      onPressed: () => FirebaseAuth.instance.signOut(),
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 50,
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.chat, size: 30),
                      label: const Text(
                        "Chat",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(MessagesScreen.routeName);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
