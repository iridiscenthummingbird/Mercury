import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mercury/models/message.dart';
import 'package:mercury/resourses/app_color.dart';

import 'triangle_clippers.dart';

class MessageWidget extends StatelessWidget {
  MessageWidget({
    Key? key,
    required this.message,
  }) : super(key: key);

  Message message;
  final DateFormat formatterTime = DateFormat('kk:mm');
  TextMessage? textMessage;

  @override
  Widget build(BuildContext context) {
    if (message is TextMessage) {
      textMessage = message as TextMessage;
      return Container(
        width: 350,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (message.isMine)
              ClipPath(
                clipper: ReversedTriangleClipper(),
                child: Container(
                  height: 10,
                  width: 10,
                  color: AppColors.userMessage,
                ),
              ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(25),
                    topRight: const Radius.circular(25),
                    bottomLeft: !message.isMine
                        ? const Radius.circular(25)
                        : Radius.zero,
                    bottomRight: message.isMine
                        ? const Radius.circular(25)
                        : Radius.zero,
                  ),
                  color: message.isMine
                      ? AppColors.userMessage
                      : AppColors.otherMessage,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        textMessage!.text,
                        style: TextStyle(
                          color: message.isMine
                              ? AppColors.userText
                              : AppColors.otherText,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            formatterTime.format(message.createTime),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (!message.isMine)
              ClipPath(
                clipper: TriangleClipper(),
                child: Container(
                  height: 10,
                  width: 10,
                  color: AppColors.otherMessage,
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
