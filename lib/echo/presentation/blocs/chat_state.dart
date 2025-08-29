part of 'chat_bloc.dart';

enum ChatConnectStatus { loading, connect, disconnect }

class ChatState extends Equatable {
  final List<Chat> chattings;
  final ChatConnectStatus status;
  const ChatState({
    this.chattings = const [],
    this.status = ChatConnectStatus.disconnect,
  });

  ChatState copyWith({List<Chat>? chattings, ChatConnectStatus? status}) {
    return ChatState(
      chattings: chattings ?? this.chattings,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [chattings];
}
