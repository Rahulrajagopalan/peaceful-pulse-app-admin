import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/custom_colors.dart';

class AdminMedicinesView extends StatefulWidget {
  const AdminMedicinesView({super.key});

  @override
  State<AdminMedicinesView> createState() => _AdminMedicinesViewState();
}

class _AdminMedicinesViewState extends State<AdminMedicinesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: CustomColors.primaryColor,
        child: Row(
          children: [
             Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width/2,
                child: Column(
                  children: [
                    Text("Medicines", style: TextStyle(color: Colors.white, decoration: TextDecoration.none, fontSize: 25),),
                    SizedBox(height: 20,),
                    Text("Categories", style: TextStyle(color: Colors.black, decoration: TextDecoration.none, fontSize: 20),),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
                            child: Text("Fever", style: TextStyle(color: Colors.black, fontSize: 15, decoration: TextDecoration.none),),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
                            child: Text("Sugar", style: TextStyle(color: Colors.black, fontSize: 15, decoration: TextDecoration.none),),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
                            child: Text("Pressure", style: TextStyle(color: Colors.black, fontSize: 15, decoration: TextDecoration.none),),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
                            child: Text("PainKiller", style: TextStyle(color: Colors.black, fontSize: 15, decoration: TextDecoration.none),),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 15,),
                    SizedBox(
                        height: MediaQuery.of(context).size.height / 1.5,
                        child: GridView.count(
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 5,
                          padding: EdgeInsets.all(10),
                          crossAxisCount: 3,
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 80,
                                  padding: const EdgeInsets.all(8),
                                  color: Colors.grey,
                                  child: Center(child: const Text("Paracetamol",style: TextStyle(color: Colors.black, fontSize: 20, decoration: TextDecoration.none),))
                                ),
                                const SizedBox(height: 5,),
                                TextButton(
                                    style: TextButton.styleFrom(
                                        backgroundColor: Colors.black,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(10))),
                                    onPressed: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15.0),
                                      child: const Text(
                                        "Remove",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    )
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                    height: 80,
                                    padding: const EdgeInsets.all(8),
                                    color: Colors.grey,
                                    child: Center(child: const Text("Paracetamol",style: TextStyle(color: Colors.black, fontSize: 20, decoration: TextDecoration.none),))
                                ),
                                const SizedBox(height: 5,),
                                TextButton(
                                    style: TextButton.styleFrom(
                                        backgroundColor: Colors.black,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(10))),
                                    onPressed: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15.0),
                                      child: const Text(
                                        "Remove",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    )
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                    height: 80,
                                    padding: const EdgeInsets.all(8),
                                    color: Colors.grey,
                                    child: Center(child: const Text("Paracetamol",style: TextStyle(color: Colors.black, fontSize: 20, decoration: TextDecoration.none),))
                                ),
                                const SizedBox(height: 5,),
                                TextButton(
                                    style: TextButton.styleFrom(
                                        backgroundColor: Colors.black,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(10))),
                                    onPressed: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15.0),
                                      child: const Text(
                                        "Remove",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    )
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                    height: 80,
                                    padding: const EdgeInsets.all(8),
                                    color: Colors.grey,
                                    child: Center(child: const Text("Paracetamol",style: TextStyle(color: Colors.black, fontSize: 20, decoration: TextDecoration.none),))
                                ),
                                const SizedBox(height: 5,),
                                TextButton(
                                    style: TextButton.styleFrom(
                                        backgroundColor: Colors.black,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(10))),
                                    onPressed: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15.0),
                                      child: const Text(
                                        "Remove",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    )
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                    height: 80,
                                    padding: const EdgeInsets.all(8),
                                    color: Colors.grey,
                                    child: Center(child: const Text("Paracetamol",style: TextStyle(color: Colors.black, fontSize: 20, decoration: TextDecoration.none),))
                                ),
                                const SizedBox(height: 5,),
                                TextButton(
                                    style: TextButton.styleFrom(
                                        backgroundColor: Colors.black,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(10))),
                                    onPressed: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15.0),
                                      child: const Text(
                                        "Remove",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    )
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                    height: 80,
                                    padding: const EdgeInsets.all(8),
                                    color: Colors.grey,
                                    child: Center(child: const Text("Paracetamol",style: TextStyle(color: Colors.black, fontSize: 20, decoration: TextDecoration.none),))
                                ),
                                const SizedBox(height: 5,),
                                TextButton(
                                    style: TextButton.styleFrom(
                                        backgroundColor: Colors.black,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(10))),
                                    onPressed: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15.0),
                                      child: const Text(
                                        "Remove",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    )
                                )
                              ],
                            ),
                          ],
                        ))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width / 3,
              child: Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://s3-alpha-sig.figma.com/img/8bb0/89b6/20ffaa28be67620d72171908ea6de34e?Expires=1714953600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=FqQ06tecj85LtIiO3pxtbVntPJo9Dw64ejt~WXf28vaxYKJ~LVnv2uYdh-Zg2F9pGpjJ8RbbtdXnk1B3pR6T-bm~yiGWTekGYozTIY4qND6ux9QfX8eTpDZ-sZ5ekZtfW33MRJwvJgDP~je6Rno50Qt3bCpYgUvDHmfwlIkEnfyTibnMCyJV~QvEuyxdwiynKULSL2xVcXI4pLfCGBF3EoJR6n-NxzhNEtriqaqFSSug0v~Pxv4cTgKM~sZfUnkncVaaUZKueWLYNdktuL~CXYBfYgbGeLkflr7aTOjXEtqsAbN6Tz6uBVuam66yJccapHD8DznDPw0k~PIyvCcJBA__')),
            )
          ],
        ),
      ),
    );
  }
}
