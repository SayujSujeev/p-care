import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:palitive_care/constants/constants.dart';
import 'package:palitive_care/data/category_data.dart';
import 'package:palitive_care/data/today_doctor_data.dart';
import 'package:palitive_care/data/top_doctors_data.dart';
import 'package:palitive_care/screens/activities/activities_screen.dart';
import 'package:palitive_care/screens/login/login_screen.dart';
import 'package:palitive_care/screens/med_bank/med_bank_screen.dart';
import 'package:palitive_care/screens/messages/message_screen.dart';
import 'package:palitive_care/screens/payment/payment_screen.dart';
import 'package:palitive_care/screens/services/services_screen.dart';
import 'package:palitive_care/services/database_services.dart';
import 'package:palitive_care/services/shared_preferance.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Stream? topDoctorList;
  getDoctorList() async {
    await DatabaseServices().getDoctorList().then((value) {
      setState(() {
        topDoctorList = value;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDoctorList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        title: const Text(
          'P Care',
          style: TextStyle(
            color: black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => const LoginScreen(),
                ),
              );
              SharedPreferanceClass.saveUserLoggedInSharedPreference(false);
            },
            icon: const Icon(
              Icons.person,
              color: black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 120,
              child: ListView.builder(
                itemCount: categoryList.length,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                      padding:
                          const EdgeInsets.only(left: 20, top: 20, bottom: 20),
                      child: Column(
                        children: [
                          Container(
                            child: IconButton(
                              onPressed: () {
                                if (index == 0) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const ServicesScreen(),
                                    ),
                                  );
                                }

                                if (index == 1) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const MessagesScreen(),
                                    ),
                                  );
                                }

                                if (index == 2) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const PaymentScreen(),
                                    ),
                                  );
                                }

                                if (index == 3) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const MedBankScreen(),
                                    ),
                                  );
                                }

                                if (index == 4) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const ActivitiesScreen(),
                                    ),
                                  );
                                }
                              },
                              icon: Icon(
                                categoryList[index].icon,
                                size: 30,
                              ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(150),
                                color: white,
                                border: Border.all(color: black, width: 2)),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(categoryList[index].name)
                        ],
                      ));
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: appPadding),
              child: Text(
                'Doctors Avilable Today',
                style: TextStyle(
                  color: black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 175,
              child: ListView.builder(
                itemCount: todayDoctorList.length,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(appPadding),
                    child: Container(
                      width: 300,
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: black.withOpacity(0.3),
                              offset: const Offset(5, 5),
                              blurRadius: 8,
                            )
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(appPadding / 2),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                ClipRRect(
                                  child: Image.asset(
                                    todayDoctorList[index].image,
                                    height: 45,
                                    width: 45,
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      todayDoctorList[index].name,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      todayDoctorList[index].spec,
                                      style: const TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: black.withOpacity(0.25),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: appPadding / 2,
                                  horizontal: appPadding),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.calendar_today,
                                        color: white,
                                        size: 15,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        todayDoctorList[index].date,
                                        style: const TextStyle(
                                          color: white,
                                          fontSize: 12,
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.access_time,
                                        color: white,
                                        size: 15,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        todayDoctorList[index].date,
                                        style: const TextStyle(
                                          color: white,
                                          fontSize: 12,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: appPadding),
              child: Text(
                'Top Doctors',
                style: TextStyle(
                  color: black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(appPadding),
                child: StreamBuilder(
                    stream: topDoctorList,
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemCount: snapshot.data.docs.length,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.only(bottom: appPadding),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            String doctorName=snapshot.data.docs[index].get("name");
                            String doctorImage=snapshot.data.docs[index].get("image");
                            String doctorSpecializedFields=snapshot.data.docs[index].get("specialized");
                            String doctorRating=snapshot.data.docs[index].get("rating");
                            String doctorReviews=snapshot.data.docs[index].get("reviews");
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: appPadding / 2),
                              child: Container(
                                height: 80,
                                decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                        color: black.withOpacity(0.3),
                                        offset: const Offset(5, 5),
                                        blurRadius: 10)
                                  ],
                                ),
                                padding: const EdgeInsets.all(appPadding / 2),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      child:Image.network(doctorImage),


                                      // Image.asset(
                                      //   topDoctorsList[index].image,
                                      //   height: 80,
                                      //   width: 60,
                                      //   fit: BoxFit.cover,
                                      // ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                      "Dr $doctorName",
                                          style: const TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          doctorSpecializedFields,
                                          style: const TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.star_rounded,
                                              color: Colors.yellow,
                                              size: 15,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                             doctorRating,
                                              style: const TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w800,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "$doctorReviews Reviews",
                                              style: const TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w800,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        return Center(child: const CircularProgressIndicator());
                      }
                    }))
          ],
        ),
      ),
    );
  }
}
