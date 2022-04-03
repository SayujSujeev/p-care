import 'package:flutter/material.dart';
import 'package:palitive_care/constants/constants.dart';

class MedBankScreen extends StatefulWidget {
  const MedBankScreen({Key? key}) : super(key: key);

  @override
  State<MedBankScreen> createState() => _MedBankScreenState();
}

class _MedBankScreenState extends State<MedBankScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        title: const Text(
          'Med Bank',
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
            Container(
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
                  'Medicine',
                  style: TextStyle(
                    color: white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30,),
            Container(
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
                  'Accessories',
                  style: TextStyle(
                    color: white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
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
