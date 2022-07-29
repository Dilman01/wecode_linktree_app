// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MessagesContainer extends StatelessWidget {
  MessagesContainer({required this.name, required this.message});

  final String name;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 322,
      height: 100,
      margin: EdgeInsets.only(top: 30, right: 30, left: 30),
      decoration: BoxDecoration(
        color: Color.fromRGBO(246, 246, 246, 1),
        border: Border.all(
          color: Color.fromRGBO(18, 191, 66, 1),
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
            padding: EdgeInsets.only(left: 30),
            alignment: Alignment.bottomLeft,
            // margin: EdgeInsets.only(right: 250, top: 15),
            child: Text(
              '$name:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          // SizedBox(
          //   height: 5,
          // ),
          Divider(
            color: Colors.black,
          ),
          Container(
            width: 283,
            height: 43,
            padding: EdgeInsets.only(left: 30),

            // margin: EdgeInsets.all(10),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Text(
                '$message ',
                style: TextStyle(
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
