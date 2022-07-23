import 'package:mercury/utils/enums.dart';

class Chat {
  final String id;
  final ChatType chatType;
  final List<String> participants;
  final DateTime updateTime;

  Chat({
    required this.id,
    required this.chatType,
    required this.participants,
    required this.updateTime,
  });
}
