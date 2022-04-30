import 'package:flutter/material.dart';
import 'package:palitive_care/constants/constants.dart';
import 'package:palitive_care/screens/med_bank/components/available_medicines.dart';
import 'package:palitive_care/services/database_services.dart';

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
            InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> AvailableMedicines(
                  title: 'Available Medicines',
                  function: DatabaseServices().getAvailableMedicines(),
                )));
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
                    'Medicine',
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
                Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> AvailableMedicines(
                  title: 'Available Accesories',
                  function: DatabaseServices().getAvailableMedicalAccesories(),
                )));
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
                    'Accessories',
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
