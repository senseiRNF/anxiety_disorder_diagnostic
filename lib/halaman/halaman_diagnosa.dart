import 'package:anxiety_disorder_diagnostic/fungsi/fungsi_global.dart';
import 'package:anxiety_disorder_diagnostic/fungsi/fungsi_spesifik/fungsi_halaman_diagnosa.dart';
import 'package:anxiety_disorder_diagnostic/widget/widget_global.dart';
import 'package:anxiety_disorder_diagnostic/widget/widget_spesifik/widget_halaman_diagnosa.dart';
import 'package:flutter/material.dart';

class HalamanDiagnosa extends StatefulWidget {
  @override
  _HalamanDiagnosaState createState() => _HalamanDiagnosaState();
}

class _HalamanDiagnosaState extends State<HalamanDiagnosa> {
  String surel;

  int jenisGangguan;

  double hasil;

  bool memuat = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 0), () =>  muatHalamanDiagnosa().then((hasil) {
      if(hasil != null) {
        setState(() {
          surel = hasil;
        });
      }

      memuat = false;
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Theme.of(context).primaryColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              !memuat ?
              hasil == null ?
              Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Material(
                      color: Colors.transparent,
                      child: IconButton(
                        onPressed: () {
                          dialogOpsi(context, 'Keluar halaman, data yang Anda masukan tidak akan tersimpan, Anda yakin?', () {
                            tutupHalaman(context, null);
                            tutupHalaman(context, null);
                          }, () {
                            tutupHalaman(context, null);
                          });
                        },
                        icon: Icon(
                          Icons.close,
                        ),
                        iconSize: 24.0,
                      ),
                    ),
                  ],
                ),
              ) :
              Material() :
              Material(),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0,),
                  child: !memuat ?
                  hasil == null ?
                  FormDiagnosa(
                    fungsiSimpan: (double bobot, int gangguan) {
                      setState(() {
                        hasil = bobot;
                        jenisGangguan = gangguan;
                      });
                    },
                  ) :
                  TampilanHasil(
                    surel: surel,
                    jenisGangguan: jenisGangguan,
                    bobotCFCombined: hasil,
                  ) :
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: Center(
                          child: TeksGlobal(
                            isi: 'Sedang memuat...',
                            ukuran: 16.0,
                            tebal: true,
                            posisi: TextAlign.center,
                          ),
                        ),
                      ),
                      IndikatorProgressGlobal(),
                    ],
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