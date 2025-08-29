import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_websocket_echo_application/echo/presentation/blocs/chat_bloc.dart';
import 'package:flutter_websocket_echo_application/echo/presentation/widgets/chat_bubble.dart';
import 'package:flutter_websocket_echo_application/echo/presentation/widgets/input_text_field.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ChatBloc>();

    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: AppBar(title: const Text("Echo Client")),
        body: Column(
          children: [
            Expanded(
              child: BlocBuilder<ChatBloc, ChatState>(
                builder: (context, state) {
                  return SizedBox(
                    width: double.infinity,
                    child: SingleChildScrollView(
                      reverse: true,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: state.chattings
                            .map((chat) => ChatBubble(message: chat.message))
                            .toList(),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.symmetric(
                  horizontal: BorderSide(width: 0.5, color: Color(0xffafafaf)),
                ),
              ),
              child: SafeArea(
                bottom: true,
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InputTextField(controller: _controller),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: () {
                        if (_controller.text.isNotEmpty) {
                          bloc.add(ChatSend(message: _controller.text));
                          _controller.clear();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
