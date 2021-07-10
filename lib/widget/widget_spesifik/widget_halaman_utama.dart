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
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0,),
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

                    },
                  ),
                ),
              ],
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
    return Container();
  }
}

/// Widget dengan keadaan (stateful Widget)

class WidgetHalamanRiwayat extends StatefulWidget {
  @override
  _WidgetHalamanRiwayatState createState() => _WidgetHalamanRiwayatState();
}

class _WidgetHalamanRiwayatState extends State<WidgetHalamanRiwayat> {
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
            padding: EdgeInsets.all(10.0,),
            child: TeksGlobal(
              isi: 'Riwayat Pemeriksaan',
              ukuran: 18.0,
              tebal: true,
            ),
          ),
        ),
        Expanded(
          child: ListView(
            children: [

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