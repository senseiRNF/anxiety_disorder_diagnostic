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