// import 'package:flutter/material.dart';
//
// class MessagesScreen extends StatefulWidget {
//   final List messages;
//   const MessagesScreen({Key? key, required this.messages}) : super(key: key);
//
//   @override
//   _MessagesScreenState createState() => _MessagesScreenState();
// }
//
// class _MessagesScreenState extends State<MessagesScreen> {
//   @override
//   Widget build(BuildContext context) {
//     var w = MediaQuery.of(context).size.width;
//     return ListView.separated(
//         itemBuilder: (context, index) {
//           return Container(
//             margin: EdgeInsets.all(10),
//             child: Row(
//               mainAxisAlignment: widget.messages[index]['isUserMessage']
//                   ? MainAxisAlignment.end
//                   : MainAxisAlignment.start,
//               children: [
//                 Container(
//                     padding: EdgeInsets.symmetric(vertical: 14, horizontal: 14),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.only(
//                           bottomLeft: Radius.circular(
//                             20,
//                           ),
//                           topRight: Radius.circular(20),
//                           bottomRight: Radius.circular(
//                               widget.messages[index]['isUserMessage'] ? 0 : 20),
//                           topLeft: Radius.circular(
//                               widget.messages[index]['isUserMessage'] ? 20 : 0),
//                         ),
//                         color: widget.messages[index]['isUserMessage']
//                             ? Colors.grey.shade800
//                             : Colors.grey.shade900.withOpacity(0.8)),
//                     constraints: BoxConstraints(maxWidth: w * 2 / 3),
//                     child:
//                     Text(widget.messages[index]['message'].text.text[0])),
//               ],
//             ),
//           );
//         },
//         separatorBuilder: (_, i) => Padding(padding: EdgeInsets.only(top: 10)),
//         itemCount: widget.messages.length);
//   }
// }
import 'package:flutter/material.dart';

class MessagesScreen extends StatefulWidget {
  final List messages;
  final Color currentUserColor;
  final Color botColor;

  const MessagesScreen({
    Key? key,
    required this.messages,
    required this.currentUserColor,
    required this.botColor,
  }) : super(key: key);

  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return ListView.separated(
      itemBuilder: (context, index) {
        final isUserMessage = widget.messages[index]['isUserMessage'];
        final messageColor =
        isUserMessage ? widget.currentUserColor : widget.botColor;

        return Container(
          margin: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: isUserMessage
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 14, horizontal: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(isUserMessage ? 20 : 0),
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(isUserMessage ? 0 : 20),
                    topLeft: Radius.circular(isUserMessage ? 20 : 0),
                  ),
                  color: messageColor, // Set the message bubble color
                ),
                constraints: BoxConstraints(maxWidth: w * 2 / 3),
                child: Text(widget.messages[index]['message'].text.text[0]),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (_, i) => Padding(padding: EdgeInsets.only(top: 10)),
      itemCount: widget.messages.length,
    );
  }
}
