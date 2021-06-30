import 'package:anxiety_disorder_diagnostic/fungsi/fungsi_global.dart';
import 'package:anxiety_disorder_diagnostic/widget/widget_spesifik/widget_halaman_diagnosa.dart';
import 'package:flutter/material.dart';

class HalamanDiagnosa extends StatefulWidget {
  @override
  _HalamanDiagnosaState createState() => _HalamanDiagnosaState();
}

class _HalamanDiagnosaState extends State<HalamanDiagnosa> {
  bool inputDataPengguna = false;

  @override
  void initState() {
    super.initState();
  }

  Future<bool> keluarHalaman() {
    dialogOpsi(context, 'Keluar halaman, data yang Anda masukan tidak akan tersimpan, Anda yakin?', () {
      tutupHalaman(context, null);
      tutupHalaman(context, null);
    }, () {
      tutupHalaman(context, null);
    });

    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: keluarHalaman,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(10.0,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: !inputDataPengguna ?
                  FormDataPengguna(
                    fungsiSimpan: () {
                      setState(() {
                        inputDataPengguna = true;
                      });
                    },
                  ) : FormDiagnosa(
                    fungsiSimpan: () {
                      setState(() {
                        inputDataPengguna = false;
                      });
                    },
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