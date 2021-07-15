import 'package:anxiety_disorder_diagnostic/fungsi/fungsi_global.dart';
import 'package:anxiety_disorder_diagnostic/halaman/halaman_masuk.dart';
import 'package:anxiety_disorder_diagnostic/layanan/preferensi_global.dart';
import 'package:anxiety_disorder_diagnostic/widget/widget_global.dart';
import 'package:flutter/material.dart';

/// Koleksi widget yang dapat digunakan di halaman perkenalan (introduction screen widgets)
///
/// Widget tanpa keadaan (stateless widget)

class TeksPerkenalan extends StatelessWidget {
  final String teksAtas;
  final String teksBawah;

  TeksPerkenalan({
    @required this.teksAtas,
    @required this.teksBawah,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 60.0,
        ),
        TeksGlobal(
          isi: teksAtas,
          ukuran: 20.0,
          posisi: TextAlign.end,
        ),
        SizedBox(
          height: 60.0,
        ),
        TeksGlobal(
          isi: teksBawah,
          ukuran: 20.0,
          posisi: TextAlign.end,
        ),
      ],
    );
  }
}

class TombolPerkenalanSelanjutnya extends StatelessWidget {
  final Function tekanTombol;

  TombolPerkenalanSelanjutnya({
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
          size: 80.0,
        ),
      ),
    );
  }
}

class TombolPerkenalanMasuk extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0,),
      ),
      elevation: 10.0,
      child: InkWell(
        onTap: () {
          aturPerkenalan(true);

          timpaDenganHalaman(context, HalamanMasuk());
        },
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0,),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.0,),
          child: TeksGlobal(
            isi: 'Ayo Mulai!',
            ukuran: 28.0,
            tebal: true,
          ),
        ),
      ),
    );
  }
}

/// Widget dengan keadaan (stateful Widget)

class WidgetPerkenalan extends StatefulWidget {
  @override
  _WidgetPerkenalanState createState() => _WidgetPerkenalanState();
}

class _WidgetPerkenalanState extends State<WidgetPerkenalan> {
  int indeks = 0;

  double opasitas = 1.0;

  bool jeda = false;

  List daftarAset = [
    'aset/gambar/latar_belakang_pria.png',
    'aset/gambar/latar_belakang_wanita.png',
    'aset/gambar/latar_belakang_gabung.png',
  ];

  List daftarTeks = [
    ['Selamat Datang', 'Apakah Anda mengalami gangguan kecemasan?'],
    ['Anda ragu apakah sedang mengalaminya atau tidak?', 'Tidak tau cara menanganinya?'],
    ['Tenang, kami punya solusi', 'Solusi terbaik untuk kesehatan mental Anda'],
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 500),
      opacity: opasitas,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    daftarAset[indeks],
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(10.0,),
            child: TeksPerkenalan(
              teksAtas: daftarTeks[indeks][0],
              teksBawah: daftarTeks[indeks][1],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0,),
            child: Align(
              alignment: Alignment.bottomRight,
              child: indeks < 2 ?
              TombolPerkenalanSelanjutnya(
                tekanTombol: !jeda ? () {
                  setState(() {
                    opasitas = 0;
                    jeda = true;
                  });

                  Future.delayed(Duration(milliseconds: 500), () {
                    setState(() {
                      indeks = indeks + 1;
                      opasitas = 1.0;
                      jeda = false;
                    });
                  });
                } : () {

                },
              ) :
              TombolPerkenalanMasuk(),
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