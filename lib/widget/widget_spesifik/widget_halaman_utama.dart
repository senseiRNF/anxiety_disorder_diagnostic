import 'package:anxiety_disorder_diagnostic/fungsi/fungsi_global.dart';
import 'package:anxiety_disorder_diagnostic/halaman/halaman_diagnosa.dart';
import 'package:anxiety_disorder_diagnostic/halaman/halaman_pembuka.dart';
import 'package:anxiety_disorder_diagnostic/halaman/halaman_riwayat.dart';
import 'package:anxiety_disorder_diagnostic/layanan/preferensi_global.dart';
import 'package:anxiety_disorder_diagnostic/widget/widget_global.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Koleksi widget yang dapat digunakan di halaman utama (main screen widgets)
///
/// Widget tanpa keadaan (stateless widget)

class MenuUtama extends StatelessWidget {
  final String judul;
  final Function fungsiTekan;

  MenuUtama({
    @required this.judul,
    @required this.fungsiTekan,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          fungsiTekan();
        },
        title: TeksGlobal(
          isi: judul,
        ),
      ),
    );
  }
}

class WidgetHalamanBeranda extends StatelessWidget {
  final String nama;
  final String gender;
  final String email;

  WidgetHalamanBeranda({
    @required this.nama,
    @required this.gender,
    @required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
            ),
            color: Theme.of(context).primaryColor,
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0, bottom: 30.0,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TeksGlobal(isi: 'Nama User: $nama',),
                TeksGlobal(isi: 'Gender: $gender',),
                TeksGlobal(isi: 'Email: $email',),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 40.0,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0,),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                color: Theme.of(context).primaryColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'aset/gambar/gambar_halaman_utama.png',
                          fit: BoxFit.fitWidth,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0,),
                    child: TeksGlobal(
                      isi: 'Mulai Pemeriksaan',
                      ukuran: 18.0,
                      tebal: true,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0,),
                    child: TeksGlobal(
                      isi: 'Kami akan memberikan sejumlah pertanyaan yang perlu Anda jawab sesuai dengan kondisi Anda saat ini agar diagnosis bisa menghasilkan jawaban akurat.',
                      ukuran: 14.0,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0,),
                    child: TombolGlobal(
                      judul: 'Mulai',
                      warnaTombol: Colors.black,
                      fungsiTekan: () {
                        pindahKeHalaman(context, HalamanDiagnosa(), (panggilKembali) {

                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class WidgetHalamanPengaturan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0,),
            child: TeksGlobal(
              isi: 'Pengaturan',
              ukuran: 18.0,
              tebal: true,
            ),
          ),
          ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0,),
                child: Material(
                  color: Colors.transparent,
                  child: ListTile(
                    onTap: () {

                    },
                    leading: Container(
                      padding: EdgeInsets.all(5.0,),
                      child: Image.asset(
                        'aset/gambar/ikon_bantuan_dan_saran.png',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    title: TeksGlobal(
                      isi: 'Bantuan dan Saran',
                      ukuran: 16.0,
                      tebal: true,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0,),
                child: Material(
                  color: Colors.transparent,
                  child: ListTile(
                    onTap: () {
                      dialogOpsi(context, 'Keluar dari sesi saat ini, Anda yakin?', () async {
                        await aturPerkenalan(false).then((value) {
                          tutupHalaman(context, null);
                          timpaDenganHalaman(context, HalamanPembuka());
                        });
                      }, () {
                        tutupHalaman(context, null);
                      });
                    },
                    leading: Container(
                      padding: EdgeInsets.all(5.0,),
                      child: Image.asset(
                        'aset/gambar/ikon_keluar.png',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    title: TeksGlobal(
                      isi: 'Keluar Sesi',
                      ukuran: 16.0,
                      tebal: true,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Image.asset(
                    'aset/gambar/gambar_pembuka.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0,),
                  child: TeksGlobal(
                    isi: 'Diberdayakan oleh Diah Septiana Anggraeni - UNIS (2021)',
                    ukuran: 10.0,
                    tebal: true,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

/// Widget dengan keadaan (stateful Widget)

class WidgetHalamanRiwayat extends StatefulWidget {
  @override
  _WidgetHalamanRiwayatState createState() => _WidgetHalamanRiwayatState();
}

class _WidgetHalamanRiwayatState extends State<WidgetHalamanRiwayat> {
  List dummyData = [
    ['Riwayat 001', DateTime(2021, 6, 1)],
    ['Riwayat 002', DateTime(2021, 6, 3)],
    ['Riwayat 003', DateTime(2021, 6, 7)],
    ['Riwayat 004', DateTime(2021, 6, 15)],
    ['Riwayat 005', DateTime(2021, 6, 26)],
    ['Riwayat 006', DateTime(2021, 6, 30)],
    ['Riwayat 007', DateTime(2021, 7, 3)],
    ['Riwayat 008', DateTime(2021, 7, 5)],
    ['Riwayat 009', DateTime(2021, 7, 7)],
    ['Riwayat 010', DateTime(2021, 7, 10)],
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          color: Theme.of(context).primaryColor,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0,),
            child: TeksGlobal(
              isi: 'Riwayat Pemeriksaan',
              ukuran: 18.0,
              tebal: true,
            ),
          ),
        ),
        Expanded(
          child: RefreshIndicator(
            onRefresh: () async {

            },
            child: ListView.builder(
              itemCount: dummyData.length,
              itemBuilder: (BuildContext konteksRiwayat, int indeks) {
                return Padding(
                  padding: indeks == 0 ? EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 5.0,) :
                  indeks == (dummyData.length - 1) ? EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 10.0) :
                  EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0,),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20.0,),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(20.0,),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0,),
                                bottomLeft: Radius.circular(20.0,),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                TeksGlobal(
                                  isi: dummyData[indeks][0],
                                  ukuran: 20.0,
                                  tebal: true,
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                TeksGlobal(
                                  isi: DateFormat('dd MMMM yyyy').format(dummyData[indeks][1]),
                                  ukuran: 16.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0,),
                          child: Material(
                            color: Colors.transparent,
                            child: IconButton(
                              onPressed: () {
                                pindahKeHalaman(context, HalamanRiwayat(noRiwayat: indeks+1), (panggilKembali) {

                                });
                              },
                              icon: Icon(
                                Icons.arrow_forward,
                              ),
                              color: Colors.white,
                              iconSize: 30.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}