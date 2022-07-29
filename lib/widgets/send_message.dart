// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class SendMessage extends StatefulWidget {
  const SendMessage({
    Key? key,
  }) : super(key: key);

  @override
  State<SendMessage> createState() => _SendMessageState();
}

class _SendMessageState extends State<SendMessage> {
  var _enteredName = '';
  var _enteredMessage = '';
  final _nameController = TextEditingController();
  final _messageController = TextEditingController();

  void _sendMessage() async {
    FirebaseFirestore.instance.collection('chat').add({
      'name': _enteredName,
      'message': _enteredMessage,
    });
    _nameController.clear();
    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Divider(),
          Container(
            width: 257,
            height: 30,
            child: Text(
              'SEND ME A MESSAGE',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            width: 340,
            height: 100,
            decoration: BoxDecoration(
              color: Color.fromRGBO(246, 246, 246, 1),
              border: Border.all(color: Color.fromRGBO(233, 233, 233, 1)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              controller: _messageController,
              maxLines: null,
              maxLength: null,
              expands: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Write a message...',
              ),
              onChanged: (value) {
                setState(() {
                  _enteredMessage = value;
                });
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 280,
                height: 58,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(246, 246, 246, 1),
                  border: Border.all(color: Color.fromRGBO(233, 233, 233, 1)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: _nameController,
                  maxLines: null,
                  maxLength: null,
                  expands: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Name',
                  ),
                  onChanged: (value) {
                    setState(() {
                      _enteredName = value;
                    });
                  },
                ),
              ),
              SizedBox(
                width: 15,
              ),
              IconButton(
                padding: EdgeInsets.only(bottom: 10),
                icon: Icon(
                  Icons.send,
                  size: 45,
                  color: Color.fromRGBO(0, 255, 133, 1),
                ),
                onPressed: _sendMessage,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
