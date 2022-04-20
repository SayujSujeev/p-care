import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:palitive_care/screens/home/home_screen.dart';
import 'package:palitive_care/screens/login/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:palitive_care/services/shared_preferance.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  bool isCheckedIn = false;
  @override
  void initState() {
    print("hii");
    getLoggedIn();
    // TODO: implement initState
    super.initState();
  }
  getLoggedIn() async {
    await SharedPreferanceClass.getUserLoggedInPreferance().then((value) {
      setState(() {

        isCheckedIn = value==null?false:value==false?false:true;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: isCheckedIn == false
          ? const LoginScreen()
          : const HomeScreen()
    );
  }
}

