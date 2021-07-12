List<String> daftarGangguan = [
  'Gangguan Panik',
  'Gangguan Cemas Menyeluruh',
  'Gangguan Obsesif Kompulsif',
  'Gangguan Fobia Spesifik',
  'Gangguan Fobia Sosial',
  'Gangguan Agoraphobia',
  'Gangguan Stress Akut',
  'Gangguan Stress Pasca Trauma',
  'Bukan Gangguan Kecemasan',
];

List<String> daftarGejala = [
  'Apakah jantung terasa berdetak lebih cepat',
  'Mulut kering',
  'Berkeringat',
  'Gemetaran',
  'Sensasi tercekik',
  'Sensasi sesak nafas',
  'Perasaan tersedak',
  'Merasa tidak nyaman',
  'Terasa nyeri dada',
  'Sakit perut',
  'Mual',
  'Perasaan pusing atau pingsan',
  'Menggigil atau sensasi panas',
  'Sensasi geli',
  'Perasaan tidak sadar',
  'Takut kehilangan kontrol (menjadi gila)',
  'Takut mati',
  'Merasa tegang, was-was, atau khawatir',
  'Mudah lelah, gemetar, dan pusing',
  'Pikiran selalu kosong',
  'Mempunyai kesulitan konsentrasi',
  'Nyeri kepala',
  'Nyeri otot',
  'Adanya gangguan tidur',
  'Mempunyai obsesi berlebihan',
  'Mempunyai pikiran berulang-ulang dan berlebihan',
  'Mempunyai ketakutan atau kecemasan terhadap suatu objek atau situasi tertentu',
  'Takut sendirian atau selalu merasa kesepian',
  'Takut keramaian',
  'Mempunyai ketakutan atau kecemasan terhadap satu atau lebih situasi sosial atau individu terlihat oleh pengamatan orang lain',
  'Mudah marah karena hal sepele',
  'Mudah memberikan respon yang berlebihan atau mengejutkan',
  'Mengalami kecemasan hanya sekali atau jarang',
  'Mengalami kecemasan berulang-ulang selama 3 hari atau lebih',
  'Sering mengingat peristiwa traumatis',
  'Mempunyai kecenderungan untuk mengelak',
  'Mempunyai pemikiran dan perasaan negatif',
  'Perubahan perilaku dan emosi yang sangat drastis',
  'Memiliki masalah terkait kebersihan',
  'Memiliki masalah jika berada ditempat luas atau sempit',
];

void pertanyaanPindaiGangguan(int pertanyaan, bool jawaban, Function fungsiTekan) {
  if(pertanyaan == 1 && jawaban == true) {
    fungsiTekan(4, null, null);
  } else if(pertanyaan == 4 && jawaban == true) {
    fungsiTekan(16, null, null);
  } else if(pertanyaan == 16 && jawaban == true) {
    fungsiTekan(null, 0, [
      [0, 0.0], [1, 0.0], [2, 0.0], [3, 0.0], [4, 0.0], [5, 0.0], [6, 0.0], [7, 0.0], [8, 0.0], [9, 0.0],
      [10, 0.0], [11, 0.0], [12, 0.0], [13, 0.0], [14, 0.0], [15, 0.0], [16, 0.0],
    ]);
  } else if(pertanyaan == 16 && jawaban == false) {
    fungsiTekan(null, 1, [
      [0, 0.0], [1, 0.0], [2, 0.0], [3, 0.0], [4, 0.0], [5, 0.0], [6, 0.0], [7, 0.0], [8, 0.0], [9, 0.0],
      [10, 0.0], [11, 0.0], [12, 0.0], [13, 0.0], [14, 0.0], [15, 0.0], [16, 0.0], [17, 0.0], [18, 0.0], [19, 0.0],
      [20, 0.0],
    ]);
  } else if(pertanyaan == 4 && jawaban == false) {
    fungsiTekan(null, 6, [
      [0, 0.0], [1, 0.0], [2, 0.0], [3, 0.0], [4, 0.0], [5, 0.0], [6, 0.0], [7, 0.0], [8, 0.0], [9, 0.0],
      [10, 0.0], [11, 0.0], [12, 0.0], [15, 0.0], [16, 0.0], [17, 0.0], [18, 0.0], [25, 0.0], [27, 0.0], [30, 0.0],
      [34, 0.0],
    ]);
  } else if(pertanyaan == 1 && jawaban == false) {
    fungsiTekan(3, null, null);
  } else if(pertanyaan == 3 && jawaban == true) {
    fungsiTekan(24, null, null);
  } else if(pertanyaan == 24 && jawaban == true) {
    fungsiTekan(null, 2, [
      [0, 0.0], [2, 0.0], [3, 0.0], [24, 0.0], [25, 0.0], [26, 0.0], [35, 0.0], [37, 0.0], [38, 0.0], [39, 0.0],
    ]);
  } else if(pertanyaan == 24 && jawaban == false) {
    fungsiTekan(25, null, null);
  } else if(pertanyaan == 25 && jawaban == true) {
    fungsiTekan(null, 3, [
      [0, 0.0], [2, 0.0], [3, 0.0], [25, 0.0], [26, 0.0], [27, 0.0], [28, 0.0], [29, 0.0], [30, 0.0], [31, 0.0],
      [32, 0.0], [33, 0.0], [34, 0.0], [35, 0.0], [36, 0.0], [37, 0.0], [38, 0.0], [39, 0.0],
    ]);
  } else if(pertanyaan == 25 && jawaban == false) {
    fungsiTekan(null, 7, [
      [0, 0.0], [2, 0.0], [3, 0.0], [4, 0.0], [5, 0.0], [6, 0.0], [7, 0.0], [8, 0.0], [9, 0.0], [10, 0.0],
      [11, 0.0],  [12, 0.0], [13, 0.0], [14, 0.0], [25, 0.0], [33, 0.0],
    ]);
  } else if(pertanyaan == 3 && jawaban == false) {
    fungsiTekan(29, null, null);
  } else if(pertanyaan == 29 && jawaban == true) {
    fungsiTekan(null, 4, [
      [0, 0.0], [2, 0.0], [29, 0.0], [30, 0.0],
    ]);
  } else if(pertanyaan == 29 && jawaban == false) {
    fungsiTekan(21, null, null);
  } else if(pertanyaan == 21 && jawaban == true) {
    fungsiTekan(null, 5, [
      [0, 0.0], [2, 0.0], [21, 0.0], [22, 0.0], [23, 0.0], [38, 0.0], [39, 0.0],
    ]);
  } else if(pertanyaan == 21 && jawaban == false) {
    fungsiTekan(null, 8, [
      [0, 0.0], [2, 0.0], [10, 0.0], [17, 0.0], [20, 0.0],
    ]);
  }
}

void pertanyaanCertaintyFactor(int jenisGangguan, List jawaban, Function fungsiTekan) {

}