import 'package:anxiety_disorder_diagnostic/fungsi/fungsi_spesifik/fungsi_halaman_pembuka.dart';
import 'package:anxiety_disorder_diagnostic/widget/widget_global.dart';
import 'package:flutter/material.dart';

class HalamanPembuka extends StatefulWidget {
  @override
  _HalamanPembukaState createState() => _HalamanPembukaState();
}

class _HalamanPembukaState extends State<HalamanPembuka> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
      Duration(seconds: 3), () {
        muatAwal(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset(
                'aset/gambar/gambar_pembuka.png',
                fit: BoxFit.fitWidth,
              ),
            ),
            IndikatorProgressGlobal(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}