import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mercury/models/message.dart';

import 'triangle_clippers.dart';

class MessageWidget extends StatelessWidget {
  MessageWidget({
    Key? key,
    required this.message,
  }) : super(key: key);

  final Message message;
  final DateFormat formatterTime = DateFormat('kk:mm');

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
            Container(
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
    } else {
      return const SizedBox();
    }
  }
}
