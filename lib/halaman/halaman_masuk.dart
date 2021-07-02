import 'package:anxiety_disorder_diagnostic/fungsi/fungsi_global.dart';
import 'package:anxiety_disorder_diagnostic/halaman/halaman_daftar.dart';
import 'package:anxiety_disorder_diagnostic/halaman/halaman_utama.dart';
import 'package:anxiety_disorder_diagnostic/widget/widget_global.dart';
import 'package:anxiety_disorder_diagnostic/widget/widget_spesifik/widget_halaman_masuk.dart';
import 'package:flutter/material.dart';

class HalamanMasuk extends StatefulWidget {
  @override
  _HalamanMasukState createState() => _HalamanMasukState();
}

class _HalamanMasukState extends State<HalamanMasuk> {
  TextEditingController controllerSurel = new TextEditingController();
  TextEditingController controllerKataSandi = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.0,),
          child: Center(
            child: Row(
              children: [
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      TeksGlobal(
                        isi: 'Masukan Logo disini',
                        ukuran: 24.0,
                        posisi: TextAlign.center,
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      InputTeksGlobal(
                        label: 'Surel (E-mail)',
                        controller: controllerSurel,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      InputTeksGlobal(
                        label: 'Kata Sandi',
                        controller: controllerKataSandi,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TombolGlobal(
                        judul: 'MASUK',
                        fungsiTekan: () {
                          timpaDenganHalaman(context, HalamanUtama());
                        },
                      ),
                      TombolTeksGlobal(
                        judul: 'Belum punya akun?, Daftar disini...',
                        warnaJudul: Colors.blue,
                        fungsiTekan: () {
                          pindahKeHalaman(context, HalamanDaftar(), (panggilKembali) {

                          });
                        },
                      ),
                      Divider(
                        thickness: 2.0,
                        color: Colors.black54,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TeksGlobal(
                        isi: 'atau bisa',
                        posisi: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TombolLoginGoogle(judul: 'MASUK DENGAN GOOGLE', fungsiTekan: () {

                      }),
                    ],
                  ),
                )
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