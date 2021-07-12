import 'package:anxiety_disorder_diagnostic/fungsi/fungsi_global.dart';
import 'package:anxiety_disorder_diagnostic/fungsi/fungsi_spesifik/fungsi_halaman_diagnosa.dart';
import 'package:anxiety_disorder_diagnostic/widget/widget_global.dart';
import 'package:flutter/material.dart';

/// Koleksi widget yang dapat digunakan di halaman diagnosis (diagnosis screen widgets)
///
/// Widget tanpa keadaan (stateless widget)

class TampilanHasil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10.0,),
                  margin: EdgeInsets.only(top: 20.0,),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0,),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10.0,),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: 120.0,
                          child: Image.asset(
                            'aset/gambar/gambar_halaman_hasil.png',
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        TeksGlobal(
                          isi: 'Kena Mental (Epic)',
                          ukuran: 20.0,
                          tebal: true,
                          posisi: TextAlign.center,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TeksGlobal(
                          isi: 'Anda mengalami gangguan mental akibat lose streak di tier Epic, segera cari joki ML untuk mengatasi masalah tersebut.',
                          ukuran: 14.0,
                          posisi: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TombolGlobal(
                judul: 'Selesai',
                warnaTombol: Colors.black,
                fungsiTekan: () {
                  tutupHalaman(context, null);
                },
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Widget dengan keadaan (stateful Widget)

class FormDiagnosa extends StatefulWidget {
  final Function fungsiSimpan;

  FormDiagnosa({
    @required this.fungsiSimpan,
  });

  @override
  _FormDiagnosaState createState() => _FormDiagnosaState();
}

class _FormDiagnosaState extends State<FormDiagnosa> {
  int noPertanyaan = 0;
  int noGangguan;

  List daftarDiagnosa = [
    [1, false,],
  ];

  @override
  void initState() {
    super.initState();
  }

  Future<bool> keluarHalaman() {
    if(noPertanyaan != 0) {
      setState(() {
        noPertanyaan = noPertanyaan - 1;
      });
    } else {
      dialogOpsi(context, 'Keluar halaman, data yang Anda masukan tidak akan tersimpan, Anda yakin?', () {
        tutupHalaman(context, null);
        tutupHalaman(context, null);
      }, () {
        tutupHalaman(context, null);
      });
    }

    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: keluarHalaman,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10.0,),
                        margin: EdgeInsets.only(top: 20.0,),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0,),
                          color: Colors.white,
                        ),
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'aset/gambar/gambar_halaman_diagnosa.png',
                                fit: BoxFit.fitWidth,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(right: 10.0, top: 30.0,),
                                  child: TeksGlobal(
                                    isi: 'Pilih jawaban sesuai dengan kondisi yang Anda alami saat ini.',
                                    tebal: true,
                                    posisi: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(10.0,),
                              child: Container(
                                padding: EdgeInsets.all(10.0,),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    TeksGlobal(
                                      isi: daftarGejala[daftarDiagnosa[noPertanyaan][0]],
                                      ukuran: 18.0,
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Material(
                                      color: Colors.transparent,
                                      child: RadioListTile(
                                        value: true,
                                        groupValue: daftarDiagnosa[noPertanyaan][1],
                                        onChanged: (hasil) {
                                          setState(() {
                                            daftarDiagnosa[noPertanyaan][1] = hasil;
                                          });
                                        },
                                        title: TeksGlobal(
                                          isi: 'Ya',
                                          ukuran: 16.0,
                                        ),
                                      ),
                                    ),
                                    Material(
                                      color: Colors.transparent,
                                      child: RadioListTile(
                                        value: false,
                                        groupValue: daftarDiagnosa[noPertanyaan][1],
                                        onChanged: (hasil) {
                                          setState(() {
                                            daftarDiagnosa[noPertanyaan][1] = hasil;
                                          });
                                        },
                                        title: TeksGlobal(
                                          isi: 'Tidak',
                                          ukuran: 16.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              noPertanyaan == 0 ?
                              Material() :
                              Expanded(
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        daftarDiagnosa.removeAt(noPertanyaan);

                                        noPertanyaan = noPertanyaan - 1;
                                      });
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(15.0,),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20.0,),
                                        ),
                                      ),
                                      child: TeksGlobal(
                                        isi: 'Batal',
                                        ukuran: 16.0,
                                        tebal: true,
                                        posisi: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(20.0,),
                                      bottomLeft: noPertanyaan == 0 ? Radius.circular(20.0,) : Radius.zero,
                                    ),
                                    color: Colors.black,
                                  ),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () {
                                        pertanyaanPindaiGangguan(daftarDiagnosa[noPertanyaan][0], daftarDiagnosa[noPertanyaan][1], (int noGejala, int hasil) {
                                          if(hasil == null) {
                                            setState(() {
                                              daftarDiagnosa.add([noGejala, false]);

                                              noPertanyaan = noPertanyaan + 1;
                                            });
                                          } else {
                                            setState(() {
                                              noGangguan = hasil;
                                            });

                                            print(daftarGangguan[noGangguan]);
                                          }
                                        });
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.all(15.0,),
                                        child: TeksGlobal(
                                          isi: 'Selanjutnya',
                                          ukuran: 16.0,
                                          warna: Colors.white,
                                          tebal: true,
                                          posisi: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.0,),
                      bottomRight: Radius.circular(10.0,),
                    ),
                    color: Colors.white54,
                  ),
                  child: SizedBox(
                    height: 20.0,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 40.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.0,),
                      bottomRight: Radius.circular(10.0,),
                    ),
                    color: Colors.white38,
                  ),
                  child: SizedBox(
                    height: 20.0,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}