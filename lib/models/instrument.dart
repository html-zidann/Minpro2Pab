class Instrument {
  int? id;
  String nama;
  int tahun;
  String pembuat;
  String deskripsi;

  Instrument({
    this.id,
    required this.nama,
    required this.tahun,
    required this.pembuat,
    required this.deskripsi,
  });

  factory Instrument.fromJson(Map<String, dynamic> json) {
    return Instrument(
      id: json['id'],
      nama: json['nama'] ?? '',
      tahun: json['tahun'] ?? 0,
      pembuat: json['pembuat'] ?? '',
      deskripsi: json['deskripsi'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'tahun': tahun,
      'pembuat': pembuat,
      'deskripsi': deskripsi,
    };
  }
} 