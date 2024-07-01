import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:peaceful_pulse_admin/admin/admin_login.dart';

import '../constants/custom_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  loadSelection(){
    Future.delayed(Duration(seconds: 5), () {
      Navigator.push(context, MaterialPageRoute(builder: (_) => const AdminLogin()));
    });
  }

  @override
  void initState() {
    loadSelection();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(FontAwesomeIcons.syringe, color: Colors.white,size: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("PEACEFUL PULSE", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),),
            ],
          ),
        ],
      ),
    );
  }
}
