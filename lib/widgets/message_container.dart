import 'package:flutter/material.dart';

class MessagesContainer extends StatelessWidget {
  MessagesContainer(
      {required this.name, required this.message, required this.isMe});

  final String name;
  final String message;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 322,
      height: 100,
      margin: const EdgeInsets.only(top: 30, right: 30, left: 30),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(246, 246, 246, 1),
        border: Border.all(
          color: isMe ? Colors.red : const Color.fromRGBO(18, 191, 66, 1),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 90,
            height: 25,
            padding: const EdgeInsets.only(left: 30),
            alignment: Alignment.bottomLeft,
            child: Text(
              isMe ? 'Me:' : '$name:',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const Divider(
            color: Colors.black,
          ),
          Container(
            width: 283,
            height: 43,
            padding: const EdgeInsets.only(left: 30),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Text(
                '$message ',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(119, 119, 119, 1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
