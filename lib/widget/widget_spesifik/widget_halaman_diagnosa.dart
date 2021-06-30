import 'package:anxiety_disorder_diagnostic/fungsi/fungsi_global.dart';
import 'package:anxiety_disorder_diagnostic/widget/widget_global.dart';
import 'package:flutter/material.dart';

/// Koleksi widget yang dapat digunakan di halaman utama (main screen widgets)
///
/// Widget dengan keadaan (stateful Widget)

class FormDataPengguna extends StatefulWidget {
  final Function fungsiSimpan;

  FormDataPengguna({
    @required this.fungsiSimpan,
  });

  @override
  _FormDataPenggunaState createState() => _FormDataPenggunaState();
}

class _FormDataPenggunaState extends State<FormDataPengguna> {
  TextEditingController controllerNama = new TextEditingController();
  TextEditingController controllerUsia = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0,),
                child: TeksGlobal(
                  isi: 'Informasi Data Pengguna',
                  ukuran: 22.0,
                  tebal: true,
                ),
              ),
            ),
          ],
        ),
        Divider(
          thickness: 2.0,
          color: Colors.black54,
        ),
        InputTeksGlobal(
          label: 'Nama',
          controller: controllerNama,
        ),
        SizedBox(
          height: 10.0,
        ),
        InputAngkaGlobal(
          label: 'Usia',
          controller: controllerUsia,
        ),
        SizedBox(
          height: 10.0,
        ),
        TombolGlobal(
          judul: 'Lanjutkan',
          fungsiTekan: () {
            widget.fungsiSimpan();
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

//---------------------------------------------------------------------------

class FormDiagnosa extends StatefulWidget {
  final Function fungsiSimpan;

  FormDiagnosa({
    @required this.fungsiSimpan,
  });

  @override
  _FormDiagnosaState createState() => _FormDiagnosaState();
}

class _FormDiagnosaState extends State<FormDiagnosa> {
  int noPertanyaan = 1;

  bool jawaban = false;

  List<String> daftarPertanyaan = [
    'Ini Pertanyaan A',
    'Ini Pertanyaan B',
    'Ini Pertanyaan C',
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: TeksGlobal(
                isi: 'Pertanyaan ke-$noPertanyaan',
                ukuran: 22.0,
                tebal: true,
              ),
            ),
          ],
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TeksGlobal(
                isi: daftarPertanyaan[noPertanyaan-1],
                ukuran: 18.0,
              ),
              SizedBox(
                height: 80.0,
              ),
              RadioListTile(
                value: true,
                groupValue: jawaban,
                onChanged: (hasil) {
                  setState(() {
                    jawaban = hasil;
                  });
                },
                title: TeksGlobal(
                  isi: 'Ya',
                  ukuran: 20.0,
                ),
              ),
              RadioListTile(
                value: false,
                groupValue: jawaban,
                onChanged: (hasil) {
                  setState(() {
                    jawaban = hasil;
                  });
                },
                title: TeksGlobal(
                  isi: 'Tidak',
                  ukuran: 20.0,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              TombolGlobal(
                judul: 'Lanjutkan',
                fungsiTekan: () {
                  if(noPertanyaan < 3) {
                    setState(() {
                      noPertanyaan = noPertanyaan + 1;
                    });
                  } else {
                    tutupHalaman(context, null);
                  }
                },
              ),
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