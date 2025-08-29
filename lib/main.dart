import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_websocket_echo_application/echo/presentation/pages/chat_page.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: false,
        scaffoldBackgroundColor: Color(0xffffffff),
        appBarTheme: AppBarTheme(
          elevation: 0.0,
          backgroundColor: Color(0xffffffff),
          foregroundColor: Color(0xff000000),
        ),
      ),
      home: ChatPage(),
    );
  }
}
