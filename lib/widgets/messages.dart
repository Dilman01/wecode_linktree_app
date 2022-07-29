import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wecode_linktree_app/widgets/message_container.dart';

class Messages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('chat')
            .orderBy(
              'date',
              descending: true,
            )
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final chatDocs = snapshot.data!.docs;

          return ListView.builder(
            reverse: true,
            shrinkWrap: true,
            itemCount: chatDocs.length,
            itemBuilder: (context, index) => MessagesContainer(
              name: chatDocs[index].data()['username'],
              message: chatDocs[index].data()['message'],
              isMe: chatDocs[index].data()['userId'] ==
                  FirebaseAuth.instance.currentUser!.uid,
            ),
          );
        },
      ),
    );
  }
}
