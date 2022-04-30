import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:palitive_care/constants/constants.dart';
import 'package:palitive_care/screens/home/home_screen.dart';
import 'package:palitive_care/services/shared_preferance.dart';
import 'package:get/get.dart';
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              'P Care',
              style: TextStyle(
                color: black,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: appPadding,
              vertical: appPadding * 1.5,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                TextField(
                  controller:_emailController ,
                  decoration: const InputDecoration(hintText: 'Email'),
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(hintText: 'Password'),
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
              ],
            ),
          ),

          Center(
            child: InkWell(
              onTap: ()async{
                try{
                  await _auth.signInWithEmailAndPassword(email:_emailController.text , password: _passwordController.text);
                  SharedPreferanceClass.saveUserLoggedInSharedPreference(true);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomeScreen(),),);
                }
                catch(e){
                  Get.snackbar("Invalid User", "User entered is not valid",
                    backgroundColor: Colors.red,
                    messageText: const Text("User entered is not valid",style: TextStyle(color: white),),
                    titleText: const Text("Invalid User",style: TextStyle(color: white,fontWeight: FontWeight.w500),),
                  );
                }


              }

              ,
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: appPadding * 2, vertical: appPadding / 2),
                  decoration: BoxDecoration(
                    color: black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text('Login',style: TextStyle(
                    fontSize: 18,
                    color: white,
                    fontWeight: FontWeight.w800,
                  ),)
              ),
            ),
          ),

        ],
      ),
    );
  }
}

