// import 'package:firestore/bots/intentbased/Messages.dart';
// import 'package:flutter/material.dart';
// import 'package:dialog_flowtter/dialog_flowtter.dart';
// class intent extends StatefulWidget {
//   const intent({Key? key}) : super(key: key);
//
//   @override
//   State<intent> createState() => _intentState();
// }
//
// class _intentState extends State<intent> {
//   late DialogFlowtter dialogFlowtter;
//   final TextEditingController _controller=TextEditingController();
//
//   List<Map<String,dynamic>> messages =  [];
//   @override
//   void initState(){
//     DialogFlowtter.fromFile().then((instance)=> dialogFlowtter=instance);
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       appBar: AppBar(title: Text("LegalBandhu"),),
//       body: Container(
//         child: Column(
//           children: [
//             Expanded(child: MessagesScreen(messages:messages)),
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 14,vertical: 8),
//               color: Colors.deepPurple,
//               child: Row(
//                 children: [
//                   Expanded(child: TextField(
//                     controller: _controller,
//                     style: TextStyle(color: Colors.black),
//                   )),
//                   IconButton(onPressed: (){
//                     sendMessage(_controller.text);
//                     _controller.clear();
//                   }, icon: Icon(Icons.send))
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//   sendMessage(String text )async{
//     if(text.isEmpty){
//       print('message is empty');
//
//     }
//     else{
//       setState(() {
//       addMessage(Message(
//         text: DialogText(text: [text,]),
//       ),true);
//       });
//       DetectIntentResponse response = await dialogFlowtter.detectIntent(queryInput: QueryInput(text: TextInput(text: text)));
//  if(response.message==null) return;
//  setState(() {
//    addMessage(response.message!);
//  });
//     }
//   }
//   addMessage(Message message,[bool isUserMessage =false]){
//     messages.add({
//       'message': message,
//       'isUserMessage': isUserMessage
//     });
//   }
// }

import 'package:bandhu/user/intentbased/Messages.dart';
import 'package:flutter/material.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';

class intent extends StatefulWidget {
  const intent({Key? key}) : super(key: key);

  @override
  State<intent> createState() => _intentState();
}

class _intentState extends State<intent> {
  late DialogFlowtter dialogFlowtter;
  final TextEditingController _controller = TextEditingController();

  List<Map<String, dynamic>> messages = [];

  @override
  void initState() {
    DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("HelpBandhu")),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: MessagesScreen(
                messages: messages,
                currentUserColor: Colors.white, // Set the color for your messages
                botColor: Colors.blue, // Set the color for bot messages
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              color: Colors.purple,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      sendMessage(_controller.text);
                      _controller.clear();
                    },
                    icon: Icon(Icons.send),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  sendMessage(String text) async {
    if (text.isEmpty) {
      print('message is empty');
    } else {
      setState(() {
        addMessage(Message(
          text: DialogText(text: [text]),
        ), true);
      });
      DetectIntentResponse response = await dialogFlowtter.detectIntent(
          queryInput: QueryInput(text: TextInput(text: text)));
      if (response.message == null) return;
      setState(() {
        addMessage(response.message!);
      });
    }
  }

  addMessage(Message message, [bool isUserMessage = false]) {
    messages.add({
      'message': message,
      'isUserMessage': isUserMessage
    });
  }
}
