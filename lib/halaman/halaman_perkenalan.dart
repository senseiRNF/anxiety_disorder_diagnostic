import 'package:anxiety_disorder_diagnostic/widget/widget_global.dart';
import 'package:anxiety_disorder_diagnostic/widget/widget_spesifik/widget_halaman_perkenalan.dart';
import 'package:flutter/material.dart';

class HalamanPerkenalan extends StatefulWidget {
  @override
  _HalamanPerkenalanState createState() => _HalamanPerkenalanState();
}

class _HalamanPerkenalanState extends State<HalamanPerkenalan> {
  DateTime waktuTekanKembali;

  @override
  void initState() {
    super.initState();
  }

  Future<bool> keluarAplikasi() {
    DateTime sekarang = DateTime.now();

    if(waktuTekanKembali == null || sekarang.difference(waktuTekanKembali) > Duration(seconds: 2)) {
      waktuTekanKembali = sekarang;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(seconds: 2),
          content: TeksGlobal(
            isi: 'Tekan sekali lagi untuk keluar',
            warna: Colors.white,
          ),
        ),
      );

      return Future.value(false);
    } else {
      waktuTekanKembali = null;

      return Future.value(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: keluarAplikasi,
      child: Scaffold(
        body: SafeArea(
          child: WidgetPerkenalan(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}