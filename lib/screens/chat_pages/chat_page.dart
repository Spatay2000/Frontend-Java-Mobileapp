import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.all(13),
              margin: EdgeInsets.only(left: 15, right: 50),
              decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20))),
              child: Text(
                'Hello! \we provide support through popular messengers',
                style: TextStyle(color: Colors.white),
              )),
          Spacer(),
          Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 31),
              child: Text(
                  'Please choose the most convenient application for you and write a message!')),
          FlatButton(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 60),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13), color: Colors.green),
              child: Row(
                children: [
                  Icon(
                    Icons.whatshot,
                    color: Colors.white,
                  ),
                  Text(
                    ' Write in WhatsApp',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            onPressed: () {
              launch('https://wa.me/77082473700');
            },
          ),
          FlatButton(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 60),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: Colors.lightBlueAccent),
              child: Row(
                children: [
                  Icon(
                    Icons.message,
                    color: Colors.white,
                  ),
                  Text(
                    ' Write in Telegram',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            onPressed: () {
              launch("https://t.me/Spatay7  ");
            },
          ),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
