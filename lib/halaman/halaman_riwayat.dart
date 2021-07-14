import 'package:anxiety_disorder_diagnostic/widget/widget_global.dart';
import 'package:anxiety_disorder_diagnostic/widget/widget_spesifik/widget_halaman_diagnosa.dart';
import 'package:flutter/material.dart';

class HalamanRiwayat extends StatefulWidget {
  final int noRiwayat;

  HalamanRiwayat({
    @required this.noRiwayat,
  });

  @override
  _HalamanRiwayatState createState() => _HalamanRiwayatState();
}

class _HalamanRiwayatState extends State<HalamanRiwayat> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Theme.of(context).primaryColor,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0,),
                child: TeksGlobal(
                  isi: 'Riwayat ${widget.noRiwayat}',
                  ukuran: 18.0,
                  tebal: true,
                ),
              ),
            ),
            Expanded(
              child: TampilanHasil(
                jenisGangguan: 0,
                bobotCFCombined: 0.87,
              ),
            ),
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