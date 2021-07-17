import 'package:anxiety_disorder_diagnostic/layanan/preferensi_global.dart';

Future<String> muatHalamanRiwayat() async {
  String hasil;

  await tampilkanSurel().then((surel) {
    hasil = surel;
  });

  return hasil;
}