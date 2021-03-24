import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String txt;

  const ChatMessage(this.txt, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 8,
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.amberAccent,
            child: Text("A"),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "NAME",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  txt,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
