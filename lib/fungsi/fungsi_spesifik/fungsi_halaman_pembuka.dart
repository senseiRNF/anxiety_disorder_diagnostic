import 'package:anxiety_disorder_diagnostic/fungsi/fungsi_global.dart';
import 'package:anxiety_disorder_diagnostic/halaman/halaman_perkenalan.dart';
import 'package:anxiety_disorder_diagnostic/halaman/halaman_masuk.dart';
import 'package:anxiety_disorder_diagnostic/halaman/halaman_utama.dart';
import 'package:anxiety_disorder_diagnostic/layanan/preferensi_global.dart';
import 'package:flutter/material.dart';

void muatHalamanPembuka(BuildContext context) async {
  await tampilkanSurel().then((value) async {
    if(value != null) {
      timpaDenganHalaman(context, HalamanUtama());
    } else {
      bool perkenalan = await tampilkanPerkenalan();

      perkenalan != null && perkenalan ?
      timpaDenganHalaman(context, HalamanMasuk()) :
      timpaDenganHalaman(context, HalamanPerkenalan());
    }
  });
}