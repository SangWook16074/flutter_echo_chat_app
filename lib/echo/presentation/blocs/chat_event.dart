part of 'chat_bloc.dart';

sealed class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object?> get props => [];
}

final class ChatConnect extends ChatEvent {}

final class ChatSend extends ChatEvent {
  final String message;

  const ChatSend({required this.message});

  @override
  List<Object?> get props => [message];
}

final class ChatReceived extends ChatEvent {
  final String message;

  const ChatReceived({required this.message});

  @override
  List<Object?> get props => [message];
}

final class ChatDisconnect extends ChatEvent {}
