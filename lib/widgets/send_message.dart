import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class SendMessage extends StatelessWidget {
  final _messageController = TextEditingController();

  void _sendMessage(BuildContext context) async {
    FocusScope.of(context).unfocus();

    final user = await FirebaseAuth.instance.currentUser;

    final userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get();

    FirebaseFirestore.instance.collection('chat').add({
      'username': userData['username'],
      'message': _messageController.text,
      'userId': user.uid,
      'date': Timestamp.now(),
    });

    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 300,
                height: 65,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(246, 246, 246, 1),
                  border:
                      Border.all(color: const Color.fromRGBO(233, 233, 233, 1)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: _messageController,
                  maxLines: null,
                  maxLength: null,
                  expands: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Write your message here...',
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              IconButton(
                icon: const Icon(
                  Icons.send,
                  size: 45,
                  color: Color.fromRGBO(0, 255, 133, 1),
                ),
                onPressed: () => _messageController.text.isEmpty
                    ? null
                    : _sendMessage(context),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
