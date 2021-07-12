import 'package:anxiety_disorder_diagnostic/fungsi/fungsi_global.dart';
import 'package:anxiety_disorder_diagnostic/halaman/halaman_utama.dart';
import 'package:anxiety_disorder_diagnostic/widget/widget_global.dart';
import 'package:anxiety_disorder_diagnostic/widget/widget_spesifik/widget_halaman_masuk.dart';
import 'package:flutter/material.dart';

class HalamanMasuk extends StatefulWidget {
  @override
  _HalamanMasukState createState() => _HalamanMasukState();
}

class _HalamanMasukState extends State<HalamanMasuk> {
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
          child: Column(
            children: [
              Expanded(
                child: Image.asset(
                  'aset/gambar/gambar_pembuka.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0, bottom: 10.0,),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TeksGlobal(
                          isi: 'Selamat Datang',
                          ukuran: 28.0,
                          tebal: true,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        TeksGlobal(
                          isi: 'Aplikasi Sistem Pakar Diagnosis Gangguan Kecemasan siap membantu untuk menemukan solusi terbaik dari gangguan kecemasan yang Anda alami.',
                          ukuran: 16.0,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: TombolLoginGoogle(
                                  judul: 'Masuk dengan akun Google',
                                  fungsiTekan: () {
                                    timpaDenganHalaman(context, HalamanUtama());
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
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