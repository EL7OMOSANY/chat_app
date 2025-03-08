// import 'package:chat_app/widgets/bobup_chat.dart';
// import 'package:chat_app/widgets/chat_app_bar.dart';
// import 'package:chat_app/widgets/message_text_field.dart';
// import 'package:flutter/material.dart';

// class ChatScreen extends StatelessWidget {
//   const ChatScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: ChatAppBar(),
//       body: Column(
//         children: [
//           SizedBox(height: 8),
//           Expanded(
//             child: ListView.builder(
//               itemBuilder: (context, index) => BobupChat(),
//             ),
//           ),
//           MessageTextField(),
//         ],
//       ),
//     );
//   }
// }

import 'package:chat_app/widgets/chat_app_bar.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:uuid/uuid.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChatAppBar(),
      body: Chat(
        theme: DefaultChatTheme(
          primaryColor: Colors.teal,
          secondaryColor: Colors.white,
          backgroundColor: const Color(0xFFCDE7E0),
          inputBackgroundColor: Colors.teal,
          inputTextColor: Colors.white,
          inputTextCursorColor: Colors.white,
        ),
        messages: _messages,
        onSendPressed: _handleSendPressed,
        user: _user,
      ),
    );
  }

  final _uuid = const Uuid();

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: _uuid.v4(),
      text: message.text,
    );

    _addMessage(textMessage);
  }

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  List<types.Message> _messages = [];
  final _user = const types.User(id: '82091008-a484-4a89-ae75-a22bf8d6f3ac');
}
