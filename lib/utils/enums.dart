import 'package:mercury/utils/enum_mapper.dart';

enum OrderType { ascending, descending }

enum NotesSelection { all, favorite }

enum ChatType { private, group }

enum MessageType { text, image, video }

final chatTypeMapper = EnumMapper<ChatType, String>(
  ChatType.values,
  (type) {
    switch (type) {
      case ChatType.private:
        return 'private';
      case ChatType.group:
        return 'group';
      default:
        throw UnimplementedError('tripCharterTypeMapper error');
    }
  },
);
