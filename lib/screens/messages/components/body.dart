import 'package:flutter/material.dart';
import 'package:palitive_care/constants/constants.dart';
import 'package:palitive_care/data/ChatMessage.dart';
import 'package:palitive_care/services/database_services.dart';

import 'chat_input_field.dart';
import 'message.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController _chatController=TextEditingController();
  Stream? messageStream;
  getMessages()async{
   await DatabaseServices().getChats().then((value){
     setState(() {
       messageStream=value;
     });
   });
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMessages();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding:  const EdgeInsets.symmetric(horizontal: appPadding),
            child:

            StreamBuilder(
            stream: messageStream,
            builder: (context,AsyncSnapshot snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                  reverse: true,
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index){
                    String message=snapshot.data.docs[index].get("message");
                    bool isSender=snapshot.data.docs[index].get("sendBy")=="patient";
                    return Message(message: message,
                      isSender: isSender,);
                  }

                );
              }else{
                return Center(child: const CircularProgressIndicator());
              }

    }
            )


          ),
        ),
        ChatInputField(controller: _chatController,),
      ],
    );
  }
}
