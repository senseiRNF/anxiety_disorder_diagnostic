import 'package:anxiety_disorder_diagnostic/halaman/halaman_pembuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  /// Pengaturan untuk mengunci orientasi layar
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
      title: 'Diagnosa Gangguan Kecemasan',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        fontFamily: 'Montserrat',
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HalamanPembuka(),
      },
    );
  }
}
