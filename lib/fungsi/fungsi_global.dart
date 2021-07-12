import 'package:anxiety_disorder_diagnostic/widget/widget_global.dart';
import 'package:flutter/material.dart';

/// Koleksi fungsi yang dapat digunakan di semua halaman (global functions)

void pindahKeHalaman(BuildContext context, Widget sasaran, Function panggilKembali) {
  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext targetContext) => sasaran)).then((value) {
    panggilKembali(value);
  });
}

void timpaDenganHalaman(BuildContext context, Widget sasaran) {
  Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (BuildContext targetContext) => sasaran));
}

void tutupHalaman(BuildContext context, var hasil) {
  Navigator.of(context).pop(hasil);
}

void dialogOK(BuildContext context, String pesan, Function tekanOK, Function tutupDialog) {
  showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0,),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0,),
          ),
          padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 30.0, bottom: 20.0,),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TeksGlobal(isi: pesan, warna: Colors.black, posisi: TextAlign.center),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TombolGlobal(judul: 'OK', warnaTombol: Colors.white, warnaJudul: Colors.black54, fungsiTekan: () {
                    tekanOK();
                  })
                ],
              ),
            ],
          ),
        ),
      );
    },
  ).then((value) {
    tutupDialog();
  });
}

void dialogOpsi(BuildContext context, String pesan, Function tekanYa, Function tekanTidak) {
  showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0,),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0,),
          ),
          padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 30.0, bottom: 20.0,),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TeksGlobal(isi: pesan, warna: Colors.black, posisi: TextAlign.center),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: TombolGlobal(judul: 'Tidak', warnaTombol: Colors.white, warnaJudul: Colors.red, fungsiTekan: () {
                      tekanTidak();
                    }),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: TombolGlobal(judul: 'Ya', warnaTombol: Colors.white, warnaJudul: Colors.black54, fungsiTekan: () {
                      tekanYa();
                    }),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}