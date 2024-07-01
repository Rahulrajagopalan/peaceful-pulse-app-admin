import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:peaceful_pulse_admin/admin/admin_add_officials.dart';
import 'package:peaceful_pulse_admin/admin/admin_ambulance_view.dart';
import 'package:peaceful_pulse_admin/admin/admin_home.dart';
import 'package:peaceful_pulse_admin/admin/admin_login.dart';
import 'package:peaceful_pulse_admin/admin/admin_officials_view.dart';
import 'package:peaceful_pulse_admin/admin/admin_medicines_view.dart';
import 'package:peaceful_pulse_admin/admin/splash_screen.dart';
import 'package:peaceful_pulse_admin/bin/first_page_ui.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peaceful Pulse Admin',
      home: SplashScreen(),
    );
  }
}


