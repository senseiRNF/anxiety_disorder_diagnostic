import 'package:anxiety_disorder_diagnostic/fungsi/fungsi_global.dart';
import 'package:anxiety_disorder_diagnostic/halaman/halaman_masuk.dart';
import 'package:anxiety_disorder_diagnostic/halaman/halaman_perkenalan.dart';
import 'package:anxiety_disorder_diagnostic/halaman/halaman_utama.dart';
import 'package:anxiety_disorder_diagnostic/layanan/preferensi_global.dart';
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
      Duration(seconds: 3), () => initLoad(),
    );
  }

  void initLoad() async {
    bool perkenalan = await tampilkanPerkenalan();
    String token = await tampilkanToken();

    perkenalan != null && perkenalan ?
    token != null ?
    timpaDenganHalaman(context, HalamanUtama()) :
    timpaDenganHalaman(context, HalamanMasuk()) :
    timpaDenganHalaman(context, HalamanPerkenalan());
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
              child: Padding(
                padding: EdgeInsets.all(10.0,),
                child: Center(
                  child: Image.asset(
                    'aset/gambar/gambar_pembuka.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
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