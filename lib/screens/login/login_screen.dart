import 'package:flutter/material.dart';
import 'package:palitive_care/constants/constants.dart';
import 'package:palitive_care/screens/home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                const TextField(
                  decoration: InputDecoration(hintText: 'Email'),
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                const TextField(
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
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomeScreen(),),);
              },
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

