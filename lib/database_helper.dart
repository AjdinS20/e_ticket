import 'package:bcrypt/bcrypt.dart';
import 'package:e_ticket_ris/src/data/entities/card.dart';
import 'package:e_ticket_ris/src/modules/auth/user.dart';
import 'package:e_ticket_ris/src/modules/feature1/kupovina.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final _databaseName = "MyDatabase6.db";
  static final _databaseVersion = 1;

  // Making it a singleton class.
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // Only have a single app-wide reference to the database.
  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    // Lazily instantiate the db the first time it is accessed.
    _database = await _initializeDatabase();
    return _database!;
  }

  // This opens the database (and creates it if it doesn't exist).
  _initializeDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate, onUpgrade: _onUpgrade);
  }

  // SQL code to create the database tables.
  Future _onCreate(Database db, int version) async {
    await db.execute('''

CREATE TABLE Uloga (
  idUloga INTEGER PRIMARY KEY AUTOINCREMENT,
  naziv VARCHAR(40)
);''');
    await db.execute('''   CREATE TABLE Korisnik (
  idKorisnik INTEGER PRIMARY KEY AUTOINCREMENT,
  ime VARCHAR(50),
  prezime VARCHAR(50),
  email VARCHAR(50),
  lozinka VARCHAR(50),
  dob INT,
  idUloga INT,
  active BOOLEAN NOT NULL DEFAULT 0
);''');

    await db.execute(''' CREATE TABLE VerificationCodes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    idKorisnik INT,
    user_email TEXT,
    code TEXT NOT NULL,
    FOREIGN KEY (idKorisnik) REFERENCES Korisnik(idKorisnik)
);''');
    await db.execute(''' 
CREATE TABLE Kupovina (
  idKupovina INTEGER PRIMARY KEY AUTOINCREMENT,
  idKorisnik INT,
  idKarta INT,
  datumKupovine DATE,
  datumIsteka DATE,
  FOREIGN KEY (idKorisnik) REFERENCES Korisnik(idKorisnik)
  FOREIGN KEY (idKarta) REFERENCES Karta(idKarta)
);
''');
    await db.execute(''' 
CREATE TABLE Cijena (
  idCijena INTEGER PRIMARY KEY AUTOINCREMENT,
  iznos FLOAT,
  pdv FLOAT,
  popust FLOAT,
  idTipPopusta INT
);''');
    await db.execute(''' 
CREATE TABLE TipKarte (
  idTipKarte INTEGER PRIMARY KEY AUTOINCREMENT,
  naziv VARCHAR(50)
);''');
    await db.execute(''' 
CREATE TABLE Karta (
  idKarta INTEGER PRIMARY KEY AUTOINCREMENT,
  mjernaJedinica BIT,
  naziv VARCHAR(100),
  aktivan BIT,
  cijena INT,
  idCijena INT,
  idTipKarte INT,
  FOREIGN KEY (idCijena) REFERENCES Cijena(idCijena)
);
''');
    await db.execute(''' 
CREATE TABLE Ruta (
  idRuta INTEGER PRIMARY KEY AUTOINCREMENT,
  naziv VARCHAR(50),
  polaziste VARCHAR(50),
  odrediste VARCHAR(50),
  trajanje TIME,
  idVrstaRute INT
);''');
    await db.execute(''' 
CREATE TABLE VrstaRute (
  idVrstaRute INTEGER PRIMARY KEY AUTOINCREMENT,
  naziv VARCHAR(50)
);''');
    await db.execute(''' 
CREATE TABLE Autobus (
  idAutobus INTEGER PRIMARY KEY AUTOINCREMENT,
  naziv VARCHAR(50),
  tip VARCHAR(50),
  brojSjedista INT,
  idKompanija INT
);''');
    await db.execute(''' 
CREATE TABLE Ruta_Autobus (
  idRuta INT,
  idAutobus INT,
  PRIMARY KEY (idRuta, idAutobus),
  FOREIGN KEY (idRuta) REFERENCES Ruta(idRuta),
  FOREIGN KEY (idAutobus) REFERENCES Autobus(idAutobus)
);''');

    await db.execute(''' 
CREATE TABLE Kompanija (
  idKompanija INTEGER PRIMARY KEY AUTOINCREMENT,
  naziv VARCHAR(50)
);

        ''');
    // Create default roles
    await _createRoles(db);

    // After creating tables, insert admin user.
    await _insertAdminUser(db);
    await _insertTestUser(db);
    await insertCard(db);
  }

  // Upgrading the database (if required).
  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    // Upgrade logic if database version is updated.
  }
  Future<void> _createRoles(Database db) async {
    await db.insert('Uloga', {'idUloga': '1', 'naziv': 'admin'});
    await db.insert('Uloga', {'idUloga': '2', 'naziv': 'user'});
  }

  Future<void> _insertAdminUser(Database db) async {
    const String adminEmail = "admin@example.com";
    const String adminPass = "adminpass";

    // hashiranje passworda zakomentarisano zbog usporenog testiranja
    //String encryptedPassword = BCrypt.hashpw(adminPass, BCrypt.gensalt());
// Get the id for the 'admin' role
    List<Map> roles = await db.query(
      'Uloga',
      columns: ['idUloga'],
      where: 'naziv = ?',
      whereArgs: ['admin'],
    );
    int adminRoleId = roles.first['idUloga'];
    // Insert an admin user; make sure to handle this idUloga appropriately.
    await db.insert('Korisnik', {
      'ime': 'Admin',
      'prezime': 'User',
      'email': adminEmail,
      'lozinka': adminPass, // encryptedPassword
      'dob': 1,
      'idUloga': adminRoleId,
      'active':
          1 // setting the user automatically to be active because the admin needs to have access to the system at all times
    });
  }

  Future<void> _insertTestUser(Database db) async {
    const String testEmail = "test@example.com";
    const String testPass = "test";

    // hashiranje passworda zakomentarisano zbog usporenog testiranja.
    //String encryptedPassword = BCrypt.hashpw(testPass, BCrypt.gensalt());
// Get the id for the 'user' role
    List<Map> roles = await db.query(
      'Uloga',
      columns: ['idUloga'],
      where: 'naziv = ?',
      whereArgs: ['user'],
    );
    int testRoleId = roles.first['idUloga'];
    // Insert an admin user; make sure to handle this idUloga appropriately.
    await db.insert('Korisnik', {
      'ime': 'Admin',
      'prezime': 'User',
      'email': testEmail,
      'lozinka': testPass, // encryptedPassword
      'dob': 1,
      'idUloga': testRoleId,
      'active': 1
    });
  }

  Future<void> insertCard(Database db) async {
    await db.insert('Karta', {
      'naziv': 'Zenica-Sarajevo',
      'cijena': 20,
    });
  }

  Future<bool> login(String email, String password) async {
    final Database db = await database;
    // hashiranje passworda zakomentarisano zbog usporenog testiranja
    //String encryptedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

    var res = await db.query(
      'Korisnik',
      where: 'email = ? AND lozinka = ?',
      whereArgs: [email, password],
    );
    if (res.isNotEmpty) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int? userId = await getUserIdByEmail(email);
      if (userId != null) await prefs.setInt('userId', userId);
    }
    return res.isNotEmpty;
  }

// Function to register a new user
  Future<bool> register(
      String ime, String prezime, String email, String lozinka) async {
    final Database db = await database;
    //String encryptedPassword = BCrypt.hashpw(lozinka, BCrypt.gensalt());
    List<Map> roles = await db.query(
      'Uloga',
      columns: ['idUloga'],
      where: 'naziv = ?',
      whereArgs: ['user'],
    );
    int userRoleId = roles.first['idUloga'];
    try {
      await db.insert('Korisnik', {
        'ime': ime,
        'prezime': prezime,
        'email': email,
        'lozinka': lozinka, //encryptedPassword
        'idUloga': userRoleId,
        'active': 1 // Setting the user as active
      });
      return true;
    } catch (e) {
      // Handle any errors here
      return false;
    }
  }

  Future<int?> getUserIdByEmail(String email) async {
    final Database db = await database;

    // Use a raw query to fetch the user ID
    List<Map<String, dynamic>> result = await db.rawQuery(
      'SELECT idKorisnik FROM Korisnik WHERE LOWER(email) = LOWER(?) LIMIT 1',
      [
        email.trim()
      ], // Using trim() to remove potential leading/trailing whitespace
    );

    if (result.isNotEmpty && result.first['idKorisnik'] != null) {
      return result.first['idKorisnik'] as int;
    } else {
      return null; // User not found or null ID
    }
  }

  Future<List<Card>> getUserCards() async {
    final Database db = await database;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int userId = prefs.getInt('userId') ?? -1;

    List<Map<String, dynamic>> purchaseData = await db.query(
      'Kupovina',
      where: 'idKorisnik = ?',
      whereArgs: [userId],
      columns: ['idKarta'],
    );

    List<Card> cards = [];
    for (var purchase in purchaseData) {
      int cardId = purchase['idKarta'];
      print(cardId.toString());
      List<Map<String, dynamic>> cardData = await db.query(
        'Karta',
        where: 'idKarta = ?',
        whereArgs: [cardId],
      );
      if (cardData.isNotEmpty) {
        var cardToAdd = Card.fromMap(cardData.first);
        cardToAdd.datumKupovine = DateTime.now().toString();
        cardToAdd.datumIsteka =
            DateTime.now().add(Duration(hours: 360)).toString();
        cards.add(cardToAdd);
      }
    }

    return cards;
  }

  Future<List<Card>> getAvailableCards() async {
    final Database db = await database;
    List<Map<String, dynamic>> cardsData = await db.query('Karta');
    return cardsData.map((data) => Card.fromMap(data)).toList();
  }

  Future<bool> purchaseCard(int cardId) async {
    final Database db = await database;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int userId = prefs.getInt('userId') ?? -1;

    try {
      await db.insert('Kupovina', {
        'idKorisnik': userId,
        'idKarta': cardId,
        'datumKupovine': DateTime.now().toIso8601String(),
      });
      return true; // Purchase successful
    } catch (e) {
      print('Error purchasing card: $e');
      return false; // Purchase failed
    }
  }

  Future<User> getUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int userId = prefs.getInt('userId') ?? -1;
    if (userId == -1) return new User(id: 0, ime: "", prezime: "", email: "");
    final Database db = await database;
    List<Map<String, dynamic>> result = await db.query(
      'Korisnik',
      where: 'idKorisnik = ?',
      whereArgs: [userId],
    );

    if (result.isNotEmpty) {
      return User.fromMap(result.first);
    }
    throw Exception('User not found');
  }

  Future<Kupovina> getKupovinaDetails(int kupovinaId) async {
    final Database db = await database;
    List<Map<String, dynamic>> result = await db.query(
      'Kupovina',
      where: 'idKupovina = ?',
      whereArgs: [kupovinaId],
    );

    if (result.isNotEmpty) {
      return Kupovina.fromMap(result.first);
    }
    throw Exception('Kupovina not found');
  }

  Future<String> getUserRoleById(int userId) async {
    final Database db = await database;
    List<Map<String, dynamic>> result = await db.query(
      'Korisnik',
      columns: [
        'idUloga'
      ], // Replace with actual column name for role ID in 'Korisnik' table
      where:
          'idKorisnik = ?', // Replace with actual user ID column name in 'Korisnik' table
      whereArgs: [userId],
    );

    if (result.isNotEmpty) {
      int roleId = result.first['idUloga'];
      return _getRoleNameById(roleId);
    } else {
      throw Exception('User not found');
    }
  }

  // Helper function to get role name by role ID
  Future<String> _getRoleNameById(int roleId) async {
    final Database db = await database;
    List<Map<String, dynamic>> result = await db.query(
      'Uloga',
      columns: [
        'naziv'
      ], // Replace with actual role name column in 'Uloga' table
      where:
          'idUloga = ?', // Replace with actual role ID column name in 'Uloga' table
      whereArgs: [roleId],
    );

    if (result.isNotEmpty) {
      return result.first['naziv'];
    } else {
      throw Exception('Role not found');
    }
  }

  Future<void> deleteCard(int cardId) async {
    final Database db = await database;
    await db.delete(
      'Karta', // Replace with your actual card table name
      where: 'idKarta = ?', // Replace 'id' with your card ID column name
      whereArgs: [cardId],
    );
  }

  // Add a method to fetch all cards (needed for displaying in the list)
  Future<List<Card>> getAllCards() async {
    final Database db = await database;
    final List<Map<String, dynamic>> cards =
        await db.query('Karta'); // Replace with your actual card table name
    return List.generate(cards.length, (i) {
      return Card.fromMap(cards[i]); // Assuming you have a Card model class
    });
  }

  Future<void> addCard(String naziv, int cijena) async {
    final Database db = await database;
    await db.insert('Karta', {
      'naziv': naziv,
      'cijena': cijena,
      // Set default or null values for other fields if they are required
      'mjernaJedinica': 0, // Example default value
      'aktivan': 1, // Example default value
      'idCijena': null, // Example nullable field
      'idTipKarte': null, // Example nullable field
    });
  }
}
