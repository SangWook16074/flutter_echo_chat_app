import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_websocket_echo_application/echo/data/datasources/websocket_service.dart';
import 'package:flutter_websocket_echo_application/echo/presentation/blocs/chat_bloc.dart';
import 'package:flutter_websocket_echo_application/echo/presentation/views/chat_view.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        RepositoryProvider(
          create: (context) => WebSocketService("wss://echo.websocket.events"),
          dispose: (value) => value.dispose(),
        ),
        BlocProvider(
          create: (context) =>
              ChatBloc(webSocketService: context.read<WebSocketService>()),
        ),
      ],
      child: ChatView(),
    );
  }
}
