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
  'Mempunyai ketakukan atau kecemasan terhadap satu atau lebih situasi sosial atau individu terlihat oleh pengamatan orang lain',
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
    fungsiTekan(4, null);
  } else if(pertanyaan == 4 && jawaban == true) {
    fungsiTekan(16, null);
  } else if(pertanyaan == 16 && jawaban == true) {
    fungsiTekan(null, 0);
  } else if(pertanyaan == 16 && jawaban == false) {
    fungsiTekan(null, 1);
  } else if(pertanyaan == 4 && jawaban == false) {
    fungsiTekan(null, 6);
  } else if(pertanyaan == 1 && jawaban == false) {
    fungsiTekan(3, null);
  } else if(pertanyaan == 3 && jawaban == true) {
    fungsiTekan(24, null);
  } else if(pertanyaan == 24 && jawaban == true) {
    fungsiTekan(null, 2);
  } else if(pertanyaan == 24 && jawaban == false) {
    fungsiTekan(25, null);
  } else if(pertanyaan == 25 && jawaban == true) {
    fungsiTekan(null, 3);
  } else if(pertanyaan == 25 && jawaban == false) {
    fungsiTekan(null, 7);
  } else if(pertanyaan == 3 && jawaban == false) {
    fungsiTekan(29, null);
  } else if(pertanyaan == 29 && jawaban == true) {
    fungsiTekan(null, 4);
  } else if(pertanyaan == 29 && jawaban == false) {
    fungsiTekan(21, null);
  } else if(pertanyaan == 21 && jawaban == true) {
    fungsiTekan(null, 5);
  } else if(pertanyaan == 21 && jawaban == false) {
    fungsiTekan(null, 8);
  }
}