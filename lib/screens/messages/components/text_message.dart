import 'package:flutter/material.dart';
import 'package:palitive_care/constants/constants.dart';
import 'package:palitive_care/data/ChatMessage.dart';


class TextMessage extends StatelessWidget {
  final bool isSender;
  const TextMessage({
    Key? key,
    this.message,
    required this.isSender
  }) : super(key: key);

  final ChatMessage? message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: appPadding * 0.75,
        vertical: appPadding / 2,
      ),
      decoration: BoxDecoration(
        color: green.withOpacity(message!.isSender ? 1 : 0.1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        message!.text.toString(),
        style: TextStyle(
          color: message!.isSender
              ? Colors.white
              : Theme.of(context).textTheme.bodyText1!.color,
        ),
      ),
    );
  }
}
