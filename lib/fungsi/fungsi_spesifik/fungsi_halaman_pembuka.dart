import 'package:anxiety_disorder_diagnostic/fungsi/fungsi_global.dart';
import 'package:anxiety_disorder_diagnostic/halaman/halaman_perkenalan.dart';
import 'package:anxiety_disorder_diagnostic/halaman/halaman_masuk.dart';
import 'package:anxiety_disorder_diagnostic/halaman/halaman_utama.dart';
import 'package:anxiety_disorder_diagnostic/layanan/preferensi_global.dart';
import 'package:flutter/material.dart';

void muatAwal(BuildContext context) async {
  bool perkenalan = await tampilkanPerkenalan();
  String token = await tampilkanToken();

  perkenalan != null && perkenalan ?
  token != null ?
  timpaDenganHalaman(context, HalamanUtama()) :
  timpaDenganHalaman(context, HalamanMasuk()) :
  timpaDenganHalaman(context, HalamanPerkenalan());
}