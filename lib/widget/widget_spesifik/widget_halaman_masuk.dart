import 'package:anxiety_disorder_diagnostic/widget/widget_global.dart';
import 'package:flutter/material.dart';

/// Koleksi widget yang dapat digunakan di halaman diagnosis (diagnosis screen widgets)
///
/// Widget tanpa keadaan (stateless widget)

class TombolLoginGoogle extends StatelessWidget {
  final String judul;
  final Function fungsiTekan;
  final double ukuranJudul;

  TombolLoginGoogle({
    @required this.judul,
    @required this.fungsiTekan,
    this.ukuranJudul,
  });

  double _periksaUkuranJudul() {
    double result;

    ukuranJudul != null ? result = ukuranJudul : result = 14.0;

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        fungsiTekan();
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10.0,
        ),
        child: ListTile(
          leading: SizedBox(
            height: 30.0,
            child: Image.asset(
              'aset/gambar/google.png',
              fit: BoxFit.fitHeight,
            ),
          ),
          title: TeksGlobal(
            isi: judul,
            ukuran: _periksaUkuranJudul(),
            posisi: TextAlign.center,
          ),
        ),
      ),
    );
  }
}