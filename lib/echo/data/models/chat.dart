class Chat {
  final String message;

  const Chat({required this.message});

  Map<String, dynamic> toJson() => {"message": message};
}
