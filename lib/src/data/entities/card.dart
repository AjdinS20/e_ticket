class Card {
  final int id;
  final String naziv;
  final int cijena;
  String? datumKupovine;
  String? datumIsteka;

  Card(
      {required this.id,
      required this.naziv,
      required this.cijena,
      this.datumIsteka,
      this.datumKupovine});

  factory Card.fromMap(Map<String, dynamic> map) {
    return Card(id: map['idKarta'], naziv: map['naziv'], cijena: map['cijena']);
  }
}
