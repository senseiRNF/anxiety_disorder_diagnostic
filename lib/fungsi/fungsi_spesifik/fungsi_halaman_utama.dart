import 'dart:math';

import 'package:anxiety_disorder_diagnostic/layanan/preferensi_global.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

List<String> daftarSapaan = [
  'Semoga harimu menyenangkan',
  'Semoga sehat selalu',
  'Semoga hari ini jadi hari yang sangat baik',
  'Sudah cek kondisi mentalmu hari ini?',
  'Apa kabarmu hari ini?',
  'Jaga kesehatan mentalmu ya',
  'Sudah melakukan hal baik hari ini?',
];

void muatHalamanUtama(Function fungsiMuat) async {
  String nama = await tampilkanNama();
  String surel = await tampilkanSurel();

  Random random = new Random();
  int angkaAcak = random.nextInt(6);

  fungsiMuat(nama, surel, angkaAcak);
}

void muatRiwayat(Function fungsiMuat) async {
  String surel = await tampilkanSurel();

  fungsiMuat(surel);
}

void kirimSurelBantuan(String penerima, String isiPesan) async {
  Email surel = Email(
    recipients: [penerima],
    subject: 'Bantuan dan Saran Aplikasi',
    body: isiPesan,
  );

  await FlutterEmailSender.send(surel);
}