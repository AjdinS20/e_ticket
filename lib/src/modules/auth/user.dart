class User {
  final int id;
  final String ime;
  final String prezime;
  final String email;

  User({
    required this.id,
    required this.ime,
    required this.prezime,
    required this.email,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['idKorisnik'],
      ime: map['ime'],
      prezime: map['prezime'],
      email: map['email'],
    );
  }
}
