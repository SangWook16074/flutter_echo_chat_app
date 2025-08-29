import 'package:flutter/widgets.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  const ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),

      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [.5, .9],
          colors: [Color(0xff9708CC), Color(0xff7367F0)],
        ),
      ),

      child: Text(
        message,
        style: TextStyle(
          fontSize: 16,
          color: Color(0xffffffff),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
