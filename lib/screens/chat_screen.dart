// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:wecode_linktree_app/widgets/messages.dart';

import '../widgets/send_message.dart';

class MessagesScreen extends StatelessWidget {
  static const routeName = '/messages-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: Column(
        children: [
          Messages(),
          SendMessage(),
        ],
      ),
    );
  }
}
