import 'package:mercury/utils/enums.dart';

class Message {
  final String id;
  final String chatId;
  final DateTime createTime;
  final String userId;
  final bool isMine;
  final MessageType messageType;

  Message({
    required this.id,
    required this.chatId,
    required this.createTime,
    required this.userId,
    required this.isMine,
    required this.messageType,
  });
}

class TextMessage extends Message {
  TextMessage({
    required this.text,
    required super.id,
    required super.chatId,
    required super.createTime,
    required super.userId,
    required super.isMine,
    required super.messageType,
  });

  final String text;
}
