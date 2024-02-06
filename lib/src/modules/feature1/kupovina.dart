class Kupovina {
  final int? idKupovina;
  final int? idKorisnik;
  final int? idKarta;
  final DateTime? datumKupovine;
  final DateTime? datumIsteka;

  Kupovina({
    this.idKupovina,
    this.idKorisnik,
    this.idKarta,
    this.datumKupovine,
    this.datumIsteka,
  });

  factory Kupovina.fromMap(Map<String, dynamic> map) {
    return Kupovina(
      idKupovina: map['idKupovina'] as int?,
      idKorisnik: map['idKorisnik'] as int?,
      idKarta: map['idKarta'] as int?,
      datumKupovine: map['datumKupovine'] != null
          ? DateTime.parse(map['datumKupovine'])
          : null,
      datumIsteka: map['datumIsteka'] != null
          ? DateTime.parse(map['datumIsteka'])
          : null,
    );
  }
}
