import 'package:anxiety_disorder_diagnostic/fungsi/fungsi_global.dart';
import 'package:anxiety_disorder_diagnostic/halaman/halaman_diagnosa.dart';
import 'package:anxiety_disorder_diagnostic/widget/widget_global.dart';
import 'package:anxiety_disorder_diagnostic/widget/widget_spesifik/widget_halaman_utama.dart';
import 'package:flutter/material.dart';

class HalamanUtama extends StatefulWidget {
  @override
  _HalamanUtamaState createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
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
          child: Padding(
            padding: EdgeInsets.all(10.0,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0,),
                        child: TeksGlobal(
                          isi: 'Diagnosa Gangguan Kecemasan',
                          ukuran: 22.0,
                          tebal: true,
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(
                  thickness: 2.0,
                  color: Colors.black54,
                ),
                Expanded(
                  child: ListView(
                    children: [
                      MenuUtama(judul: 'Input Diagnosa Baru', fungsiTekan: () {
                        pindahKeHalaman(context, HalamanDiagnosa(), (panggilKembali) {

                        });
                      }),
                      MenuUtama(judul: 'Lihat Hasil Tersimpan', fungsiTekan: () {

                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}