import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/custom_colors.dart';
import '../database.dart';

class CentersView extends StatefulWidget {
  const CentersView({super.key});

  @override
  State<CentersView> createState() => _CentersViewState();
}

class _CentersViewState extends State<CentersView> {

  int _rateValue = 5;

  Stream? centerStream;

  getOnTheLoad() async{
    centerStream = await DataBaseMethods().getCenterDetails();
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
                  stream: centerStream,
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
                                        Text(ds["Email"],
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
                                              await DataBaseMethods().removeCenter(ds["id"]);
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
