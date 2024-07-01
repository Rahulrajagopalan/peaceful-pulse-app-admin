import 'dart:html';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:peaceful_pulse_admin/admin/add_camp.dart';
import 'package:peaceful_pulse_admin/admin/add_centers.dart';
import 'package:peaceful_pulse_admin/admin/add_medicine.dart';
import 'package:peaceful_pulse_admin/admin/admin_add_officials.dart';
import 'package:peaceful_pulse_admin/admin/admin_officials_view.dart';
import 'package:peaceful_pulse_admin/admin/centers_view.dart';
import 'package:peaceful_pulse_admin/constants/custom_colors.dart';
import 'package:peaceful_pulse_admin/constants/custom_icon_button.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  int _selectedIndex = 0;
  int _selectedAddIndex = 0;

  List<Widget>addPages=[
    AdminAddOfficials(),
    AddMedicines(),
    AddCamp(),
    AddCenters(),
  ];

  List<Widget>viewPages=[
    AdminOfficialsView(),
    Text("Medicine view"),
    Text("Camp view"),
    CentersView(),
    Text("Notifications view"),
  ];

  List<IconData>iconList=[
    FontAwesomeIcons.userDoctor,
    FontAwesomeIcons.capsules,
    FontAwesomeIcons.list,
    Icons.medical_services,
    Icons.notifications_none,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: CustomColors.primaryColor,
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: NavigationRail(
                  groupAlignment: 0,
                  selectedIndex: _selectedIndex,
                  onDestinationSelected: (int index) {
                    setState(() {
                      _selectedIndex = index;
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>viewPages[_selectedIndex]));
                    });
                  },
                  selectedIconTheme: const IconThemeData(color: Colors.grey),
                  unselectedIconTheme: const IconThemeData(color: Colors.white),
                  labelType: NavigationRailLabelType.none,
                  backgroundColor: CustomColors.adminPrimary,
                  useIndicator: false,
                  destinations: [
                    NavigationRailDestination(
                        icon: Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.0),
                          child: Icon(iconList[0]),
                        ),
                        label: Text("")),
                    NavigationRailDestination(
                        icon: Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.0),
                          child: Icon(iconList[1]),
                        ),
                        label: Text("")),
                    NavigationRailDestination(
                        icon: Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.0),
                          child: Icon(iconList[2]),
                        ),
                        label: Text("")),
                    NavigationRailDestination(
                        icon: Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.0),
                          child: Icon(iconList[3]),
                        ),
                        label: Text("")),
                    NavigationRailDestination(
                        icon: Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.0),
                          child: Icon(iconList[4]),
                        ),
                        label: Text("")),
                  ],
                ),
              ),
            ),
            Container(
              // decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/home_image.png'))),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: NavigationRail(
                  groupAlignment: 0,
                  selectedIndex: _selectedAddIndex,
                  onDestinationSelected: (int index) {
                    setState(() {
                      _selectedAddIndex = index;
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>addPages[_selectedAddIndex]));
                    });
                  },
                  selectedIconTheme: const IconThemeData(color: Colors.grey),
                  unselectedIconTheme: const IconThemeData(color: Colors.white),
                  labelType: NavigationRailLabelType.none,
                  backgroundColor: CustomColors.adminPrimary,
                  useIndicator: false,
                  destinations: const [
                    NavigationRailDestination(
                        icon: Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(FontAwesomeIcons.userDoctor),
                              Icon(
                                FontAwesomeIcons.plus,
                                size: 10,
                              )
                            ],
                          ),
                        ),
                        label: Text("")),
                    NavigationRailDestination(
                        icon: Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(FontAwesomeIcons.capsules),
                              Icon(
                                FontAwesomeIcons.plus,
                                size: 10,
                              )
                            ],
                          ),
                        ),
                        label: Text("")),
                    NavigationRailDestination(
                        icon: Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(FontAwesomeIcons.list),
                              Icon(
                                FontAwesomeIcons.plus,
                                size: 10,
                              )
                            ],
                          ),
                        ),
                        label: Text("")),
                    NavigationRailDestination(
                        icon: Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(FontAwesomeIcons.briefcaseMedical),
                              Icon(
                                FontAwesomeIcons.plus,
                                size: 10,
                              )
                            ],
                          ),
                        ),
                        label: Text("")),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
