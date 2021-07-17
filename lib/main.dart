import 'package:anxiety_disorder_diagnostic/halaman/halaman_pembuka.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sistem Pakar Diagnosis Gangguan Kecemasan',
      theme: ThemeData(
        primaryColor: Color(0xFFFFB900),
        fontFamily: 'Montserrat',
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HalamanPembuka(),
      },
    );
  }
}
