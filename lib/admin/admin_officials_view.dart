import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peaceful_pulse_admin/constants/custom_colors.dart';
import 'package:peaceful_pulse_admin/database.dart';

class AdminOfficialsView extends StatefulWidget {
  const AdminOfficialsView({super.key});


  @override
  State<AdminOfficialsView> createState() => _AdminOfficialsViewState();
}

class _AdminOfficialsViewState extends State<AdminOfficialsView> {
  int _rateValue = 5;

  Stream? selectedStream;
  List<String> list = <String>['Doctor', 'Volunteer', 'Ambulance'];

  getOnTheLoad() async{
    Stream doctorStream = await DataBaseMethods().getDoctorDetails();
    Stream volunteerStream = await DataBaseMethods().getVolunteerDetails();
    Stream ambulanceStream = await DataBaseMethods().getAmbulanceDetails();
    selectedStream = doctorStream;
    setState(() {});
  }


  @override
  void initState() {
    getOnTheLoad();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: CustomColors.primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: SizedBox(
              width: 300,
              child: StreamBuilder(
                stream: selectedStream,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return snapshot.hasData? ListView.builder(
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot ds = snapshot.data.docs[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            color: CustomColors.adminSecondary,
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black,
                                                blurRadius: 3.0,
                                              )
                                            ],
                                        ),
                                        width: 90,
                                        height: 60,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "$_rateValue",
                                            style: TextStyle(color: Colors.white),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.white,
                                            size: 15,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.white,
                                            size: 15,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.white,
                                            size: 15,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.white,
                                            size: 15,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.white,
                                            size: 15,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(ds["Name"],
                                          style: TextStyle(
                                              color: Colors.white,
                                              decoration: TextDecoration.none,
                                              fontSize: 15,fontWeight: FontWeight.bold)),
                                      Text(ds["Designation"],
                                          style: const TextStyle(
                                              color: Colors.black,
                                              decoration: TextDecoration.none,
                                              fontSize: 15)),
                                      TextButton(
                                          style: TextButton.styleFrom(
                                              backgroundColor: Colors.black,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5))),
                                          onPressed: () async{
                                            await DataBaseMethods().removeDoctor(ds["id"]);
                                          },
                                          child: const Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10.0),
                                            child: Text(
                                              "Remove",
                                              style: TextStyle(color: Colors.white, fontSize: 10),
                                            ),
                                          ))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }):
                      Container();
                }
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width / 2,
            child: ColoredBox(color: Colors.grey,),
          )
        ],
      ),
    );
  }
}
