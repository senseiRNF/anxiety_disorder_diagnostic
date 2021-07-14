import 'package:anxiety_disorder_diagnostic/fungsi/fungsi_global.dart';
import 'package:anxiety_disorder_diagnostic/fungsi/fungsi_spesifik/fungsi_halaman_diagnosa.dart';
import 'package:anxiety_disorder_diagnostic/widget/widget_spesifik/widget_halaman_diagnosa.dart';
import 'package:flutter/material.dart';

class HalamanDiagnosa extends StatefulWidget {
  @override
  _HalamanDiagnosaState createState() => _HalamanDiagnosaState();
}

class _HalamanDiagnosaState extends State<HalamanDiagnosa> {
  int jenisGangguan;

  double hasil;

  @override
  void initState() {
    super.initState();
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
              ) : Material(),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0,),
                  child: hasil == null ?
                  FormDiagnosa(
                    fungsiSimpan: (double bobot, int gangguan) {
                      setState(() {
                        hasil = bobot;
                        jenisGangguan = gangguan;
                      });
                    },
                  ) :
                  TampilanHasil(
                    jenisGangguan: jenisGangguan,
                    bobotCFCombined: hasil,
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