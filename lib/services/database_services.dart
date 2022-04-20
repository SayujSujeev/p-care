import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class DatabaseServices{
  final _firestore=FirebaseFirestore.instance;
  
  Future getDoctorList()async{
    return await _firestore.collection("doctors").snapshots();
  }
  
}