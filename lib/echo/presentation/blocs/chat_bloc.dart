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
