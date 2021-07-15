import 'package:anxiety_disorder_diagnostic/fungsi/fungsi_spesifik/fungsi_halaman_utama.dart';
import 'package:anxiety_disorder_diagnostic/widget/widget_global.dart';
import 'package:anxiety_disorder_diagnostic/widget/widget_spesifik/widget_halaman_utama.dart';
import 'package:flutter/material.dart';

class HalamanUtama extends StatefulWidget {
  @override
  _HalamanUtamaState createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  DateTime waktuTekanKembali;

  int indeksNavigasi = 0;
  int noSapaan;

  String nama;
  String surel;

  List<BottomNavigationBarItem> navigationItem = [
    BottomNavigationBarItem(
      icon: Image.asset(
        'aset/gambar/ikon_beranda.png',
      ),
      label: 'Beranda',
    ),
    BottomNavigationBarItem(
      icon: Image.asset(
        'aset/gambar/ikon_riwayat.png',
      ),
      label: 'Riwayat',
    ),
    BottomNavigationBarItem(
      icon: Image.asset(
        'aset/gambar/ikon_pengaturan.png',
      ),
      label: 'Pengaturan',
    ),
  ];

  List<Widget> daftarWidget = [
    WidgetHalamanBeranda(),
    WidgetHalamanRiwayat(),
    WidgetHalamanPengaturan(),
  ];

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 0), () => muatHalamanUtama((hasilNama, hasilSurel, hasilAngka) {
      setState(() {
        nama = hasilNama;
        surel = hasilSurel;
        noSapaan = hasilAngka;
      });
    }));
  }

  Future<bool> keluarAplikasi() {
    DateTime sekarang = DateTime.now();

    if(waktuTekanKembali == null || sekarang.difference(waktuTekanKembali) > Duration(seconds: 2)) {
      waktuTekanKembali = sekarang;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(seconds: 2),
          content: TeksGlobal(
            isi: 'Tekan sekali lagi untuk keluar',
            warna: Colors.white,
          ),
        ),
      );

      return Future.value(false);
    } else {
      waktuTekanKembali = null;

      return Future.value(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: keluarAplikasi,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              indeksNavigasi == 0 ?
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
                      TeksGlobal(
                        isi: 'Hi! $nama',
                        ukuran: 16.0,
                        tebal: true,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TeksGlobal(
                        isi: noSapaan != null ? daftarSapaan[noSapaan] : '',
                        ukuran: 16.0,
                        tebal: true,
                      ),
                    ],
                  ),
                ),
              ) :
              Material(),
              Expanded(
                child: daftarWidget[indeksNavigasi],
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: navigationItem,
          onTap: (int terpilih) {
            setState(() {
              indeksNavigasi = terpilih;
            });
          },
          currentIndex: indeksNavigasi,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}