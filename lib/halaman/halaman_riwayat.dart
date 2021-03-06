import 'package:anxiety_disorder_diagnostic/fungsi/fungsi_global.dart';
import 'package:anxiety_disorder_diagnostic/fungsi/fungsi_spesifik/fungsi_halaman_diagnosa.dart';
import 'package:anxiety_disorder_diagnostic/layanan/layanan_firestore.dart';
import 'package:anxiety_disorder_diagnostic/widget/widget_global.dart';
import 'package:anxiety_disorder_diagnostic/widget/widget_spesifik/widget_halaman_diagnosa.dart';
import 'package:flutter/material.dart';

class HalamanRiwayat extends StatefulWidget {
  final String surel;
  final String idDokumen;
  final int jenisGangguan;
  final double bobotCFCombined;

  HalamanRiwayat({
    @required this.surel,
    @required this.idDokumen,
    @required this.jenisGangguan,
    @required this.bobotCFCombined,
  });

  @override
  _HalamanRiwayatState createState() => _HalamanRiwayatState();
}

class _HalamanRiwayatState extends State<HalamanRiwayat> {
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
      tutupHalaman(context, null);
    }

    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: keluarHalaman,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                color: Theme.of(context).primaryColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0,),
                      child: TeksGlobal(
                        isi: 'Riwayat Pemeriksaan',
                        ukuran: 18.0,
                        tebal: true,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0,),
                      child: Material(
                        color: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0,),
                        ),
                        child: InkWell(
                          onTap: () {
                            dialogOpsi(context, 'Hapus riwayat pemeriksaan, apakah Anda yakin?', () async {
                              tutupHalaman(context, null);

                              setState(() {
                                memuat = true;
                              });

                              await hapusData(widget.surel, widget.idDokumen, () {
                                dialogOK(context, 'Sukses menghapus data', () {
                                  tutupHalaman(context, null);
                                }, () {
                                  tutupHalaman(context, null);
                                });
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
                            });
                          },
                          borderRadius: BorderRadius.circular(100.0,),
                          child: Padding(
                            padding: EdgeInsets.all(15.0,),
                            child: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: !memuat ?
                Padding(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0,),
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
                ) :
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Center(
                        child: TeksGlobal(
                          isi: 'Silahkan tunggu...',
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