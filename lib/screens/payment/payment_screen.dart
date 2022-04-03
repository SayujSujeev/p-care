import 'package:flutter/material.dart';
import 'package:palitive_care/constants/constants.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        title: const Text(
          'Payment',
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
        child:  Container(
          padding: const EdgeInsets.symmetric(
              horizontal: appPadding,
              vertical: appPadding / 2),
          decoration: BoxDecoration(
            color: black,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Text(
            'Google Pay',
            style: TextStyle(
              color: white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        )
      ),
    );
  }
}
