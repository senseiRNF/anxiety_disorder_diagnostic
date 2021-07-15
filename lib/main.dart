import 'package:anxiety_disorder_diagnostic/halaman/halaman_pembuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

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
