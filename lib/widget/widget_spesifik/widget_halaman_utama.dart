import 'package:anxiety_disorder_diagnostic/fungsi/fungsi_global.dart';
import 'package:anxiety_disorder_diagnostic/fungsi/fungsi_spesifik/fungsi_halaman_utama.dart';
import 'package:anxiety_disorder_diagnostic/halaman/halaman_diagnosa.dart';
import 'package:anxiety_disorder_diagnostic/halaman/halaman_pembuka.dart';
import 'package:anxiety_disorder_diagnostic/layanan/layanan_firestore.dart';
import 'package:anxiety_disorder_diagnostic/layanan/layanan_google_sign_in.dart';
import 'package:anxiety_disorder_diagnostic/layanan/preferensi_global.dart';
import 'package:anxiety_disorder_diagnostic/widget/widget_global.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
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
                      kirimSurelBantuan(
                        'sistempakar71@gmail.com',
                        '',
                      );
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
                        await googleSignIn.disconnect().then((keluar) async {
                          await hapusPreferensi().then((hasil) {
                            if(hasil) {
                              tutupHalaman(context, null);
                              timpaDenganHalaman(context, HalamanPembuka());
                            }
                          });
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
  String surel;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 0), () => muatRiwayat((hasilSurel) {
      setState(() {
        surel = hasilSurel;
      });
    }));
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
          child: surel != null ?
          LihatData(
            surel: surel,
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
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}