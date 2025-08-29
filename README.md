# A&I 3기 Flutter과정 실전 웹소켓 통신 앱

Flutter로 제작한 웹소켓 통신 에코 클라이언트 예제입니다.

## Getting Started

![10](https://github.com/user-attachments/assets/c4132d17-49bd-413f-bb03-b0604d6b79bd)

```
git clone https://github.com/SangWook16074/flutter_echo_chat_app.git
flutter clean
flutter pub get
flutter run
```

## 엔드포인트 설명

아래 엔드포인트에서 웹소켓 연결, 종료, 전송을 수행합니다.

```dart
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

```

bloc에서는 소켓 통신과 관련된 채팅 이벤트 핸들링을 수행합니다.

```dart
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_websocket_echo_application/echo/data/datasources/websocket_service.dart';
import 'package:flutter_websocket_echo_application/echo/data/models/chat.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final WebSocketService _webSocketService;

  ChatBloc({required WebSocketService webSocketService})
    : _webSocketService = webSocketService,
      super(ChatState()) {
    on<ChatConnect>(_onConnect);
    on<ChatSend>(_onSend);
    on<ChatReceived>(_onReceived);
  }

  FutureOr<void> _onConnect(ChatConnect event, Emitter<ChatState> emit) async {
    _webSocketService.messages.listen((chat) {
      add(ChatReceived(message: chat.message));
    });
  }

  FutureOr<void> _onSend(ChatSend event, Emitter<ChatState> emit) {
    _webSocketService.send(Chat(message: event.message));
    final updated = List<Chat>.from(state.chattings)
      ..add(Chat(message: event.message));
    emit(state.copyWith(chattings: updated));
  }

  FutureOr<void> _onReceived(ChatReceived event, Emitter<ChatState> emit) {
    final updated = List<Chat>.from(state.chattings)
      ..add(Chat(message: event.message));
    emit(state.copyWith(chattings: updated));
  }
}

```
