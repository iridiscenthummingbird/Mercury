import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mercury/models/message.dart';

import 'triangle_clippers.dart';

enum Menu { delete }

class MessageWidget extends StatelessWidget {
  MessageWidget({
    Key? key,
    required this.message,
    required this.delete,
  }) : super(key: key);

  final Message message;
  final DateFormat formatterTime = DateFormat('kk:mm');
  final Function() delete;

  @override
  Widget build(BuildContext context) {
    if (message is TextMessage) {
      final TextMessage textMessage = message as TextMessage;
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: message.isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (!message.isMine)
              ClipPath(
                clipper: ReversedTriangleClipper(),
                child: Container(
                  height: 10,
                  width: 10,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            PopupMenuButton(
              onSelected: (Menu item) async {
                if (item == Menu.delete) {
                  await delete();
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
                const PopupMenuItem<Menu>(
                  value: Menu.delete,
                  child: Text('Delete'),
                ),
              ],
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(25),
                    topRight: const Radius.circular(25),
                    bottomLeft: message.isMine ? const Radius.circular(25) : Radius.zero,
                    bottomRight: !message.isMine ? const Radius.circular(25) : Radius.zero,
                  ),
                  color: !message.isMine ? Theme.of(context).primaryColor : Theme.of(context).cardColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Text(
                          textMessage.text,
                          style: TextStyle(
                            color: Theme.of(context).primaryColorDark,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Text(
                        formatterTime.format(message.createTime),
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColorDark,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (message.isMine)
              ClipPath(
                clipper: TriangleClipper(),
                child: Container(
                  height: 10,
                  width: 10,
                  color: Theme.of(context).cardColor,
                ),
              ),
          ],
        ),
      );
    } else if (message is ImageMessage) {
      final ImageMessage imageMessage = message as ImageMessage;
      final storageRef = FirebaseStorage.instance.ref(imageMessage.path);
      final Future<String> url = storageRef.getDownloadURL();
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: message.isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 250,
              ),
              child: FutureBuilder(
                future: url,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return PopupMenuButton(
                      onSelected: (Menu item) async {
                        if (item == Menu.delete) {
                          await storageRef.delete();
                          await delete();
                        }
                      },
                      itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
                        const PopupMenuItem<Menu>(
                          value: Menu.delete,
                          child: Text('Delete'),
                        ),
                      ],
                      child: CachedNetworkImage(
                        imageUrl: snapshot.data as String,
                        fit: BoxFit.scaleDown,
                      ),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ],
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
