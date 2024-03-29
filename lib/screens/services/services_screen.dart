import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:palitive_care/constants/constants.dart';
import 'package:palitive_care/data/services_data.dart';

import '../../services/database_services.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({Key? key}) : super(key: key);

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  Stream? availableServiceList;
  getServiceList() async {
    await DatabaseServices().getAvailableServices().then((value) {
      setState(() {
        availableServiceList = value;
      });
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getServiceList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        title: const Text(
          'Services',
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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(appPadding),
            child: Column(
              children: [
                StreamBuilder(
                    stream: availableServiceList,
                    builder: (context, AsyncSnapshot snapshot){
                  if(snapshot.hasData){
                    return ListView.builder(
                      itemCount: snapshot.data.docs.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        String serviceName=snapshot.data.docs[index].get("serviceName");
                        int availableSlot=snapshot.data.docs[index].get("available");
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: appPadding),
                          child: Container(
                            height: 80,
                            decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: black.withOpacity(0.25),
                                    offset: const Offset(5, 5),
                                    blurRadius: 8,
                                  )
                                ]),
                            padding: const EdgeInsets.all(appPadding / 2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      serviceName,
                                      style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                     availableSlot.toString(),
                                      style: const TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                // Container(
                                //   padding: const EdgeInsets.symmetric(
                                //       horizontal: appPadding,
                                //       vertical: appPadding / 2),
                                //   decoration: BoxDecoration(
                                //     color: black,
                                //     borderRadius: BorderRadius.circular(10),
                                //   ),
                                //   child: const Text(
                                //     'Book Now',
                                //     style: TextStyle(
                                //       color: white,
                                //       fontSize: 15,
                                //       fontWeight: FontWeight.w500,
                                //     ),
                                //   ),
                                // )
                              ],
                            ),
                          ),
                        );
                      },
                    );

                  }else{
                    return const Center(child: CircularProgressIndicator());
                  }
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
