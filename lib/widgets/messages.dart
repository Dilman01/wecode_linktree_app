// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wecode_linktree_app/widgets/message_container.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('chat').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final chatDocs = snapshot.data!.docs;

          return ListView.builder(
            shrinkWrap: true,
            itemCount: chatDocs.length,
            itemBuilder: (context, index) => MessagesContainer(
              name: chatDocs[index].data()['name'],
              message: chatDocs[index].data()['message'],
            ),
          );
        },
      ),
    );
  }
}
