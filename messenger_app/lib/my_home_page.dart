import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:messenger_app/chat_message.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<AnimatedListState> _animlistkey = GlobalKey<AnimatedListState>();

  TextEditingController _textEditingController = TextEditingController();
  List<ChatMessage> _chats = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("chat app"),
      ),
      body: Column(
        children: [
          Expanded(
            child: AnimatedList(
              key: _animlistkey,
              reverse: true,
              itemBuilder:
                  (BuildContext context, int index, Animation animation) {
                return _chats[index];
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 12.0, right: 12.0, bottom: 20),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      hintText: "Type a messege",
                      hintStyle: TextStyle(fontSize: 20),
                    ),
                    onSubmitted: (String text) {
                      sendMessege(text);
                    },
                  ),
                ),
                SizedBox(
                  width: 8.0,
                ),
                FlatButton(
                  onPressed: () {
                    sendMessege(_textEditingController.text);
                  },
                  child: Text("Send"),
                  color: Colors.amberAccent,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void sendMessege(String text) {
    Logger().d("submitted: $text");
    _textEditingController.clear();
    ChatMessage newchat = ChatMessage(text);
    setState(() {
      _chats.insert(0, newchat);
    });
  }
}
