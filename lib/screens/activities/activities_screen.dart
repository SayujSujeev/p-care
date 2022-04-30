import 'package:flutter/material.dart';
import 'package:palitive_care/constants/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class ActivitiesScreen extends StatefulWidget {
  const ActivitiesScreen({Key? key}) : super(key: key);

  @override
  State<ActivitiesScreen> createState() => _ActivitiesScreenState();
}

class _ActivitiesScreenState extends State<ActivitiesScreen> {
  void _launchURL(String destination) async {
    if (!await launch(destination)) throw 'Could not launch $destination';
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        title: const Text(
          'Activities',
          style: TextStyle(
            color: black,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){
                _launchURL("https://www.youtube.com/user/SingaporeHealth");
              },
              child: Container(
                width: 150,
                padding: const EdgeInsets.symmetric(
                    horizontal: appPadding,
                    vertical: appPadding / 2),
                decoration: BoxDecoration(
                  color: black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    'Exercise',
                    style: TextStyle(
                      color: white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30,),
            InkWell(
              onTap: (){
                _launchURL("https://www.youtube.com/user/SingaporeHealth");
              },
              child: Container(
                width: 150,
                padding: const EdgeInsets.symmetric(
                    horizontal: appPadding,
                    vertical: appPadding / 2),
                decoration: BoxDecoration(
                  color: black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    'Therapies',
                    style: TextStyle(
                      color: white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
