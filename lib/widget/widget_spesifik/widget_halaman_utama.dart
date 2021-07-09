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

class WidgetInformasiAkun extends StatelessWidget {
  final String nama;
  final String gender;
  final String email;

  WidgetInformasiAkun({
    @required this.nama,
    @required this.gender,
    @required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

class WidgetInformasiHalaman extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        color: Theme.of(context).primaryColor,
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0, bottom: 30.0,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.blue,
              child: Image.asset(
                'aset/gambar/gambar_halaman_utama.png',
                fit: BoxFit.fitWidth,
              ),
            ),
            TeksGlobal(
              isi: 'Mulai Pemeriksaan',
              ukuran: 18.0,
              tebal: true,
            ),
            Expanded(
              child: TombolGlobal(
                judul: 'Mulai',
                fungsiTekan: () {

                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}