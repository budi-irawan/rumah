class DataRumah {
  String nama;
  String lokasi;
  String deskripsi;
  String harga;
  String gambarProfil;
  List<String> galeriGambar;

  DataRumah({
    required this.nama,
    required this.lokasi,
    required this.deskripsi,
    required this.harga,
    required this.gambarProfil,
    required this.galeriGambar,
  });
}

var listDataRumah = [
  DataRumah(
    nama: 'Tipe 36', 
    lokasi: 'Jl.Soekarno-Hatta no.56', 
    deskripsi: 'Rumah tipe 36 dengan 2 kamar tidur dan 1 kamar mandi', 
    harga: 'Rp. 150.000.000,-', 
    gambarProfil: 'assets/rumah/36.jpg', 
    galeriGambar: [
      'assets/rumah/36_kamar_tidur.jpg',
      'assets/rumah/36_ruang_tamu.jpg',
      'assets/rumah/36_dapur.jpg',
    ]
  ),
  DataRumah(
    nama: 'Tipe 45', 
    lokasi: 'Jl.Perjuangan no.100', 
    deskripsi: 'Rumah tipe 45 dengan 2 kamar tidur dan 1 kamar mandi', 
    harga: 'Rp. 200.000.000,-', 
    gambarProfil: 'assets/rumah/45.jpg', 
    galeriGambar: [
      'assets/rumah/45_kamar_tidur.jpg',
      'assets/rumah/45_ruang_tamu.jpg',
      'assets/rumah/45_dapur.jpg',
    ]
  ),
  DataRumah(
    nama: 'Tipe 54', 
    lokasi: 'Jl.Rajawali Muda no.43', 
    deskripsi: 'Rumah tipe 54 dengan 2 kamar tidur dan 1 kamar mandi', 
    harga: 'Rp. 275.000.000,-', 
    gambarProfil: 'assets/rumah/54.jpg', 
    galeriGambar: [
      'assets/rumah/54_kamar_tidur.jpg',
      'assets/rumah/54_ruang_tamu.jpg',
      'assets/rumah/54_dapur.jpg',
    ]
  ),
  DataRumah(
    nama: 'Tipe 60', 
    lokasi: 'Jl.Majapahit no.9', 
    deskripsi: 'Rumah tipe 60 dengan 2 kamar tidur dan 1 kamar mandi', 
    harga: 'Rp. 400.000.000,-', 
    gambarProfil: 'assets/rumah/60.jpg', 
    galeriGambar: [
      'assets/rumah/60_kamar_tidur.jpg',
      'assets/rumah/60_ruang_tamu.jpg',
      'assets/rumah/60_dapur.jpg',
    ]
  ),
  DataRumah(
    nama: 'Tipe 70', 
    lokasi: 'Jl.Mulawarman no.89', 
    deskripsi: 'Rumah tipe 70 dengan 2 kamar tidur dan 1 kamar mandi', 
    harga: 'Rp. 600.000.000,-', 
    gambarProfil: 'assets/rumah/70.jpg', 
    galeriGambar: [
      'assets/rumah/70_kamar_tidur.jpg',
      'assets/rumah/70_ruang_tamu.jpg',
      'assets/rumah/70_dapur.jpg',
    ]
  ),
  DataRumah(
    nama: 'Tipe 120', 
    lokasi: 'Jl.Mahesa Anabrang no.7', 
    deskripsi: 'Rumah tipe 120 dengan 2 kamar tidur dan 1 kamar mandi', 
    harga: 'Rp. 900.000.000,-', 
    gambarProfil: 'assets/rumah/120.jpg', 
    galeriGambar: [
      'assets/rumah/120_kamar_tidur.jpg',
      'assets/rumah/120_ruang_tamu.jpg',
      'assets/rumah/120_dapur.jpg',
    ]
  )
];

var listTopRated = [
  DataRumah(
    nama: 'Tipe 36', 
    lokasi: 'Jl.Soekarno-Hatta no.56', 
    deskripsi: 'Rumah tipe 36 dengan 2 kamar tidur dan 1 kamar mandi', 
    harga: 'Rp. 150.000.000,-', 
    gambarProfil: 'assets/rumah/36.jpg', 
    galeriGambar: [
      'assets/rumah/36_kamar_tidur.jpg',
      'assets/rumah/36_ruang_tamu.jpg',
      'assets/rumah/36_dapur.jpg',
    ]
  ),
  DataRumah(
    nama: 'Tipe 45', 
    lokasi: 'Jl.Perjuangan no.100', 
    deskripsi: 'Rumah tipe 45 dengan 2 kamar tidur dan 1 kamar mandi', 
    harga: 'Rp. 200.000.000,-', 
    gambarProfil: 'assets/rumah/45.jpg', 
    galeriGambar: [
      'assets/rumah/45_kamar_tidur.jpg',
      'assets/rumah/45_ruang_tamu.jpg',
      'assets/rumah/45_dapur.jpg',
    ]
  ),
];

var listNewModel = [
  DataRumah(
    nama: 'Tipe 54', 
    lokasi: 'Jl.Rajawali Muda no.43', 
    deskripsi: 'Rumah tipe 54 dengan 2 kamar tidur dan 1 kamar mandi', 
    harga: 'Rp. 275.000.000,-', 
    gambarProfil: 'assets/rumah/54.jpg', 
    galeriGambar: [
      'assets/rumah/54_kamar_tidur.jpg',
      'assets/rumah/54_ruang_tamu.jpg',
      'assets/rumah/54_dapur.jpg',
    ]
  ),
  DataRumah(
    nama: 'Tipe 60', 
    lokasi: 'Jl.Majapahit no.9', 
    deskripsi: 'Rumah tipe 60 dengan 2 kamar tidur dan 1 kamar mandi', 
    harga: 'Rp. 400.000.000,-', 
    gambarProfil: 'assets/rumah/60.jpg', 
    galeriGambar: [
      'assets/rumah/60_kamar_tidur.jpg',
      'assets/rumah/60_ruang_tamu.jpg',
      'assets/rumah/60_dapur.jpg',
    ]
  ),
  DataRumah(
    nama: 'Tipe 70', 
    lokasi: 'Jl.Mulawarman no.89', 
    deskripsi: 'Rumah tipe 70 dengan 2 kamar tidur dan 1 kamar mandi', 
    harga: 'Rp. 600.000.000,-', 
    gambarProfil: 'assets/rumah/70.jpg', 
    galeriGambar: [
      'assets/rumah/70_kamar_tidur.jpg',
      'assets/rumah/70_ruang_tamu.jpg',
      'assets/rumah/70_dapur.jpg',
    ]
  ),
  DataRumah(
    nama: 'Tipe 120', 
    lokasi: 'Jl.Mahesa Anabrang no.7', 
    deskripsi: 'Rumah tipe 120 dengan 2 kamar tidur dan 1 kamar mandi', 
    harga: 'Rp. 900.000.000,-', 
    gambarProfil: 'assets/rumah/120.jpg', 
    galeriGambar: [
      'assets/rumah/120_kamar_tidur.jpg',
      'assets/rumah/120_ruang_tamu.jpg',
      'assets/rumah/120_dapur.jpg',
    ]
  )
];