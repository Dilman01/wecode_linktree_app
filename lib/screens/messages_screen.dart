// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MessagesScreen extends StatelessWidget {
  static const routeName = '/messages-screen';

  Widget messages() {
    return Container(
      width: 322,
      height: 100,
      margin: EdgeInsets.only(top: 30),
      decoration: BoxDecoration(
        color: Color.fromRGBO(246, 246, 246, 1),
        border: Border.all(
          color: Color.fromRGBO(18, 191, 66, 1),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            width: 90,
            height: 20,
            margin: EdgeInsets.only(right: 250, top: 15),
            child: Text(
              'NAME',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            width: 283,
            height: 43,
            margin: EdgeInsets.all(10),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(119, 119, 119, 1),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Container(
              width: 257,
              height: 33,
              margin: EdgeInsets.only(top: 70),
              child: Text(
                'MESSAGES',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            messages(),
            messages(),
            messages(),
            SizedBox(
              height: 20,
            ),
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
              padding: EdgeInsets.only(right: 250, top: 15),
              decoration: BoxDecoration(
                color: Color.fromRGBO(246, 246, 246, 1),
                border: Border.all(color: Color.fromRGBO(233, 233, 233, 1)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Message',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              children: [
                Container(
                  width: 290,
                  height: 48,
                  margin: EdgeInsets.only(left: 29, top: 10),
                  padding: EdgeInsets.only(right: 220, top: 15),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(246, 246, 246, 1),
                    border: Border.all(color: Color.fromRGBO(233, 233, 233, 1)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'NAME',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.send,
                  size: 50,
                  color: Color.fromRGBO(0, 255, 133, 1),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
