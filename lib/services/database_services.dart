import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class DatabaseServices{
  final _firestore=FirebaseFirestore.instance;
  
  Future getDoctorList()async{
    return await _firestore.collection("doctors").snapshots();
  }

  Future getAvailableServices()async{
    return await _firestore.collection("services").snapshots();
  }

  Future getChats()async{
    return await _firestore.collection("chats").orderBy("time",descending: true).snapshots();
  }

  Future sendMessage({required String message})async{
      Map<String,dynamic>data={
        "message":message,
        "sendBy":"patient",
        "time":DateTime.now().millisecondsSinceEpoch
      };
    return await _firestore.collection('chats').add(data);
  }
  
  Future getAvailableMedicines()async{
    return await _firestore.collection("medicine").snapshots();
  }

  Future getAvailableMedicalAccesories()async{
    return await _firestore.collection("accessories").snapshots();
  }
}