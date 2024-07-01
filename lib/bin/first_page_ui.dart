import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:peaceful_pulse_admin/admin/admin_officials_view.dart';

import '../constants/custom_colors.dart';
import '../constants/custom_icon_button.dart';

class FirstTestPage extends StatefulWidget {
  const FirstTestPage({super.key});

  @override
  State<FirstTestPage> createState() => _FirstTestPageState();
}

class _FirstTestPageState extends State<FirstTestPage> {
  int _selectedIndex = 0;

  List<Widget>pages=[
    AdminOfficialsView(),
    Text("Officials view"),
    Text("Palliative list view"),
    Text("Palliative details view"),
    Text("Notifications view"),
    Text("Add officials"),
    Text("Add medicines"),
    Text("Add camps"),
    Text("Add centers")
  ];

  _onPressed(int currentIndex){
    setState(() {
      _selectedIndex =currentIndex;
      print(_selectedIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: pages[_selectedIndex],
          ),
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            width: 70,
            child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
                child: Container(
                  width: 70,
                  decoration: BoxDecoration(color: CustomColors.adminPrimary,borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomIconButton(icon: FontAwesomeIcons.userDoctor, currentIndex: 0, onPressed: _onPressed,),
                      CustomIconButton(icon: FontAwesomeIcons.capsules, currentIndex: 1, onPressed: _onPressed,),
                      CustomIconButton(icon: FontAwesomeIcons.list, currentIndex: 2, onPressed: _onPressed,),
                      CustomIconButton(icon: Icons.medical_services, currentIndex: 3, onPressed: _onPressed,),
                      CustomIconButton(icon: Icons.notifications_none, currentIndex: 4, onPressed: _onPressed,)
                    ],
                  ),
                )
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            width: 70,
            child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
                child: Container(
                  width: 70,
                  decoration: BoxDecoration(color: CustomColors.adminPrimary,borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomIconButton(icon: FontAwesomeIcons.userDoctor, currentIndex: 0, onPressed: _onPressed,),
                      CustomIconButton(icon: FontAwesomeIcons.capsules, currentIndex: 1, onPressed: _onPressed,),
                      CustomIconButton(icon: FontAwesomeIcons.list, currentIndex: 2, onPressed: _onPressed,),
                      CustomIconButton(icon: Icons.medical_services, currentIndex: 3, onPressed: _onPressed,),
                      CustomIconButton(icon: Icons.notifications_none, currentIndex: 4, onPressed: _onPressed,)
                    ],
                  ),
                )
            ),
          ),
        ],
      ),
    );
  }
}


