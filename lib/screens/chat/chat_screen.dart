import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mercury/managers/shared_preference_manager_impl.dart';
import 'package:mercury/models/chat.dart';
import 'package:mercury/models/message.dart';
import 'package:mercury/screens/chat/cubit/chat_cubit.dart';
import 'package:mercury/utils/enums.dart';
import 'package:mercury/widgets/message_widget.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key, required this.chatScreenSettings}) : super(key: key);

  static const String routeName = '/chat';

  final ChatScreenSettings chatScreenSettings;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late final ChatCubit _cubit;

  @override
  void initState() {
    _cubit = ChatCubit(
      chatRepository: context.read(),
      messageRepository: context.read(),
    );
    if (widget.chatScreenSettings.openChatType == OpenChatType.chatScreen) {
      _cubit.loadChat(widget.chatScreenSettings.chatId!);
    } else {
      _cubit.createChat(widget.chatScreenSettings.companionId!);
    }
    super.initState();
  }

  final TextEditingController controller = TextEditingController();

  List<Message> getMessages(AsyncSnapshot<QuerySnapshot> snapshot) {
    return (snapshot.data?.docs ?? []).map(
      (DocumentSnapshot document) {
        final Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
        final MessageType messageType = messageTypeMapper.toEnum(data['messageType'] as String);
        final String myId = context.read<SharedPreferenceManager>().getUid();
        final String userId = data['userId'] as String;
        switch (messageType) {
          case MessageType.text:
            return TextMessage(
              text: data['text'] as String,
              id: document.id,
              chatId: data['chatId'] as String,
              createTime: (data['createTime'] as Timestamp).toDate(),
              userId: userId,
              isMine: myId == userId,
              messageType: messageType,
            );
          case MessageType.image:
            return TextMessage(
              //TODO: change
              text: data['text'] as String,
              id: document.id,
              chatId: data['chatId'] as String,
              createTime: (data['createTime'] as Timestamp).toDate(),
              userId: userId,
              isMine: myId == userId,
              messageType: messageType,
            );
          case MessageType.video:
            return TextMessage(
              //TODO: change
              text: data['text'] as String,
              id: document.id,
              chatId: data['chatId'] as String,
              createTime: (data['createTime'] as Timestamp).toDate(),
              userId: userId,
              isMine: myId == userId,
              messageType: messageType,
            );
        }
      },
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener(
        bloc: _cubit,
        listener: (context, state) {
          if (state is ChatCreatedState) {
            _cubit.loadChat(state.chatId);
          }
        },
        child: BlocBuilder(
          bloc: _cubit,
          builder: (context, state) {
            if (state is ChatLoadedState) {
              final Chat chat = state.chat;

              return Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: Text(chat.name),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  foregroundColor: Theme.of(context).iconTheme.color,
                ),
                body: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: StreamBuilder(
                        stream: state.messagesStream,
                        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          final List<Message> messages = getMessages(snapshot).reversed.toList();
                          return ListView.builder(
                            physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                            reverse: true,
                            itemCount: messages.length,
                            itemBuilder: (context, index) {
                              return MessageWidget(
                                message: messages[index],
                                delete: () async {
                                  await _cubit.deleteMessage(messages[index].id);
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.attach_file,
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: 260,
                              child: TextFormField(
                                controller: controller,
                              ),
                            ),
                            IconButton(
                              onPressed: () async {
                                if (controller.text.trim().isNotEmpty) {
                                  await _cubit.sendTextMessage(controller.text.trim(), chat.id);
                                  controller.clear();
                                }
                              },
                              icon: const Icon(
                                Icons.send,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class ChatScreenSettings {
  String? chatId;
  String? companionId;
  final OpenChatType openChatType;

  ChatScreenSettings({
    required this.openChatType,
    this.chatId,
    this.companionId,
  });
}
