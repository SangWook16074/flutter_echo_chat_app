import 'package:flutter_websocket_echo_application/echo/data/models/chat.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketService {
  final WebSocketChannel _channel;

  WebSocketService(String url)
    : _channel = WebSocketChannel.connect(Uri.parse(url));

  Stream<Chat> get messages =>
      _channel.stream.map((event) => Chat(message: event.toString()));

  void send(Chat chat) {
    _channel.sink.add(chat.message);
  }

  void dispose() {
    _channel.sink.close();
  }
}
