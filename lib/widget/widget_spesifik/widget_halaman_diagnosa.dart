import 'package:anxiety_disorder_diagnostic/fungsi/fungsi_global.dart';
import 'package:anxiety_disorder_diagnostic/fungsi/fungsi_spesifik/fungsi_halaman_diagnosa.dart';
import 'package:anxiety_disorder_diagnostic/layanan/layanan_firestore.dart';
import 'package:anxiety_disorder_diagnostic/widget/widget_global.dart';
import 'package:flutter/material.dart';

/// Koleksi widget yang dapat digunakan di halaman diagnosis (diagnosis screen widgets)
///
/// Widget tanpa keadaan (stateless widget)

class TampilanFormBertumpuk extends StatelessWidget {
  final Widget isiForm;

  TampilanFormBertumpuk({
    @required this.isiForm,
  });

  @override
  Widget build(BuildContext context) {
    return  Column(
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
                    isiForm,
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
    );
  }
}

class PetakRadioOpsi extends StatelessWidget {
  final dynamic nilaiRadio;
  final dynamic nilaiGrupRadio;
  final Function fungsiPerubahan;
  final String teksRadio;

  PetakRadioOpsi({
    @required this.nilaiRadio,
    @required this.nilaiGrupRadio,
    @required this.fungsiPerubahan,
    @required this.teksRadio,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: RadioListTile(
        value: nilaiRadio,
        dense: true,
        groupValue: nilaiGrupRadio,
        onChanged: (hasil) {
          fungsiPerubahan(hasil);
        },
        title: TeksGlobal(
          isi: teksRadio,
          ukuran: 16.0,
        ),
      ),
    );
  }
}

class TombolSaranSelanjutnya extends StatelessWidget {
  final Function tekanTombol;

  TombolSaranSelanjutnya({
    @required this.tekanTombol,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100.0,),
      ),
      elevation: 10.0,
      child: InkWell(
        onTap: () {
          tekanTombol();
        },
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0,),
        ),
        child: Icon(
          Icons.navigate_next,
          color: Colors.black54,
          size: 40.0,
        ),
      ),
    );
  }
}

class TombolSaranSebelumnya extends StatelessWidget {
  final Function tekanTombol;

  TombolSaranSebelumnya({
    @required this.tekanTombol,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100.0,),
      ),
      elevation: 10.0,
      child: InkWell(
        onTap: () {
          tekanTombol();
        },
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0,),
        ),
        child: Icon(
          Icons.navigate_before,
          color: Colors.black54,
          size: 40.0,
        ),
      ),
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
  int noPertanyaanDasar = 0;
  int noPertanyaanLanjutan = 0;
  int jenisGangguan;

  List daftarDiagnosa = [
    [1, false,],
  ];

  List daftarCertaintyFactor = [];

  @override
  void initState() {
    super.initState();
  }

  Future<bool> keluarHalaman() {
    if(jenisGangguan == null) {
      if(noPertanyaanDasar != 0) {
        setState(() {
          daftarDiagnosa.removeAt(noPertanyaanDasar);

          noPertanyaanDasar = noPertanyaanDasar - 1;
        });
      } else {
        dialogOpsi(context, 'Keluar halaman, data yang Anda masukan tidak akan tersimpan, Anda yakin?', () {
          tutupHalaman(context, null);
          tutupHalaman(context, null);
        }, () {
          tutupHalaman(context, null);
        });
      }
    } else {
      if(noPertanyaanLanjutan != 0) {
        setState(() {
          noPertanyaanLanjutan = noPertanyaanLanjutan - 1;
        });
      } else {
        setState(() {
          jenisGangguan = null;
        });
      }
    }

    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: keluarHalaman,
      child: TampilanFormBertumpuk(
        isiForm: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0,),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TeksGlobal(
                      isi: jenisGangguan == null ?
                      daftarGejala[daftarDiagnosa[noPertanyaanDasar][0]][0] :
                      daftarGejala[daftarCertaintyFactor[noPertanyaanLanjutan][0]][1],
                      ukuran: 16.0,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    jenisGangguan == null ?
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        PetakRadioOpsi(
                          nilaiRadio: true,
                          nilaiGrupRadio: daftarDiagnosa[noPertanyaanDasar][1],
                          fungsiPerubahan: (hasil) {
                            setState(() {
                              daftarDiagnosa[noPertanyaanDasar][1] = hasil;
                            });
                          },
                          teksRadio: 'Ya',
                        ),
                        PetakRadioOpsi(
                          nilaiRadio: false,
                          nilaiGrupRadio: daftarDiagnosa[noPertanyaanDasar][1],
                          fungsiPerubahan: (hasil) {
                            setState(() {
                              daftarDiagnosa[noPertanyaanDasar][1] = hasil;
                            });
                          },
                          teksRadio: 'Tidak',
                        ),
                      ],
                    ) :
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        PetakRadioOpsi(
                          nilaiRadio: 1.0,
                          nilaiGrupRadio: daftarCertaintyFactor[noPertanyaanLanjutan][1],
                          fungsiPerubahan: (hasil) {
                            setState(() {
                              daftarCertaintyFactor[noPertanyaanLanjutan][1] = hasil;
                            });
                          },
                          teksRadio: 'Sangat Yakin',
                        ),
                        PetakRadioOpsi(
                          nilaiRadio: 0.8,
                          nilaiGrupRadio: daftarCertaintyFactor[noPertanyaanLanjutan][1],
                          fungsiPerubahan: (hasil) {
                            setState(() {
                              daftarCertaintyFactor[noPertanyaanLanjutan][1] = hasil;
                            });
                          },
                          teksRadio: 'Yakin',
                        ),
                        PetakRadioOpsi(
                          nilaiRadio: 0.6,
                          nilaiGrupRadio: daftarCertaintyFactor[noPertanyaanLanjutan][1],
                          fungsiPerubahan: (hasil) {
                            setState(() {
                              daftarCertaintyFactor[noPertanyaanLanjutan][1] = hasil;
                            });
                          },
                          teksRadio: 'Cukup Yakin',
                        ),
                        PetakRadioOpsi(
                          nilaiRadio: 0.4,
                          nilaiGrupRadio: daftarCertaintyFactor[noPertanyaanLanjutan][1],
                          fungsiPerubahan: (hasil) {
                            setState(() {
                              daftarCertaintyFactor[noPertanyaanLanjutan][1] = hasil;
                            });
                          },
                          teksRadio: 'Sedikit Yakin',
                        ),
                        PetakRadioOpsi(
                          nilaiRadio: 0.2,
                          nilaiGrupRadio: daftarCertaintyFactor[noPertanyaanLanjutan][1],
                          fungsiPerubahan: (hasil) {
                            setState(() {
                              daftarCertaintyFactor[noPertanyaanLanjutan][1] = hasil;
                            });
                          },
                          teksRadio: 'Tidak Tahu',
                        ),
                        PetakRadioOpsi(
                          nilaiRadio: 0.0,
                          nilaiGrupRadio: daftarCertaintyFactor[noPertanyaanLanjutan][1],
                          fungsiPerubahan: (hasil) {
                            setState(() {
                              daftarCertaintyFactor[noPertanyaanLanjutan][1] = hasil;
                            });
                          },
                          teksRadio: 'Tidak',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            jenisGangguan == null ?
            Row(
              children: [
                noPertanyaanDasar == 0 ?
                Material() :
                Expanded(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          daftarDiagnosa.removeAt(noPertanyaanDasar);

                          noPertanyaanDasar = noPertanyaanDasar - 1;
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
                        bottomLeft: noPertanyaanDasar == 0 ? Radius.circular(20.0,) : Radius.zero,
                      ),
                      color: Colors.black,
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          pertanyaanPindaiGangguan(daftarDiagnosa[noPertanyaanDasar][0], daftarDiagnosa[noPertanyaanDasar][1], (int noGejala, int hasil, List certaintyFactor) {
                            if(hasil == null) {
                              setState(() {
                                daftarDiagnosa.add([noGejala, false]);

                                noPertanyaanDasar = noPertanyaanDasar + 1;
                              });
                            } else {
                              setState(() {
                                jenisGangguan = hasil;
                                daftarCertaintyFactor = certaintyFactor;
                              });
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
            ) :
            Row(
              children: [
                Expanded(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        if(noPertanyaanLanjutan != 0) {
                          setState(() {
                            noPertanyaanLanjutan = noPertanyaanLanjutan - 1;
                          });
                        } else {
                          setState(() {
                            jenisGangguan = null;
                          });
                        }
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
                      ),
                      color: Colors.black,
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          if(noPertanyaanLanjutan < daftarCertaintyFactor.length - 1) {
                            setState(() {
                              noPertanyaanLanjutan = noPertanyaanLanjutan + 1;
                            });
                          } else {
                            pertanyaanCertaintyFactor(jenisGangguan, daftarCertaintyFactor,).then((bobot) {
                              widget.fungsiSimpan(bobot, jenisGangguan);
                            });
                          }
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
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class TampilanHasil extends StatefulWidget {
  final String surel;
  final int jenisGangguan;
  final double bobotCFCombined;

  TampilanHasil({
    @required this.surel,
    @required this.jenisGangguan,
    @required this.bobotCFCombined,
  });

  @override
  _TampilanHasilState createState() => _TampilanHasilState();
}

class _TampilanHasilState extends State<TampilanHasil> {
  int posisiSaran = 0;

  bool memuat = false;

  @override
  void initState() {
    super.initState();
  }

  String hitungPresentase(double presentase) {
    String hasil;

    double hasilDiPecahan = presentase * 100;

    hasil = hasilDiPecahan.floor().toString();

    return hasil;
  }

  Future<bool> keluarHalaman() {
    if(!memuat) {
      dialogOpsi(context, 'Apakah Anda ingin menyimpan hasil diagnosa saat ini?', () async {
        setState(() {
          memuat = true;
        });

        tutupHalaman(context, null);

        await simpanData(widget.surel, widget.bobotCFCombined, widget.jenisGangguan, () {
          tutupHalaman(context, null);
        }, () {
          setState(() {
            memuat = false;
          });

          dialogOK(context, 'Terjadi kesalahan, silahkan coba lagi', () {
            tutupHalaman(context, null);
          }, () {

          });
        });
      }, () {
        tutupHalaman(context, null);
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
                            isi: daftarGangguan[widget.jenisGangguan],
                            ukuran: 20.0,
                            tebal: true,
                            posisi: TextAlign.center,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          TeksGlobal(
                            isi: '${hitungPresentase(widget.bobotCFCombined)}%',
                            ukuran: 20.0,
                            posisi: TextAlign.center,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          TeksGlobal(
                            isi: 'Anda mengalami ${daftarGangguan[widget.jenisGangguan]}, Berikut solusi yang bisa ditawarkan:',
                            ukuran: 14.0,
                            posisi: TextAlign.start,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                TeksGlobal(
                                  isi: daftarSaran[widget.jenisGangguan][posisiSaran],
                                  ukuran: 14.0,
                                  tebal: true,
                                  posisi: TextAlign.start,
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                daftarSaran[widget.jenisGangguan].length > 1 ?
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TombolSaranSebelumnya(tekanTombol: () {
                                      if(posisiSaran != 0) {
                                        setState(() {
                                          posisiSaran = posisiSaran - 1;
                                        });
                                      }
                                    }),
                                    SizedBox(
                                      width: 20.0,
                                    ),
                                    TeksGlobal(
                                      isi: '${posisiSaran + 1} / 7',
                                      ukuran: 16.0,
                                      tebal: true,
                                      posisi: TextAlign.center,
                                    ),
                                    SizedBox(
                                      width: 20.0,
                                    ),
                                    TombolSaranSelanjutnya(tekanTombol: () {
                                      if(posisiSaran < daftarSaran[widget.jenisGangguan].length - 1) {
                                        setState(() {
                                          posisiSaran = posisiSaran + 1;
                                        });
                                      }
                                    }),
                                  ],
                                ) :
                                Material(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                !memuat ?
                TombolGlobal(
                  judul: 'Selesai',
                  warnaTombol: Colors.black,
                  fungsiTekan: () {
                    keluarHalaman();
                  },
                ) :
                IndikatorProgressGlobal(),
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