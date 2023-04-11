import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
        
class DbHelper {
    static final DbHelper _instance = DbHelper._internal();
    static Database? _database;
        
    //inisialisasi beberapa variabel yang dibutuhkan
    final String tableName = 'tableAddress';
    final String columnId = 'id';
    final String columnKategori = 'kategori';
    final String columnNegara = 'negara';
    final String columnProvinsi = 'provinsi';
    final String columnKota = 'kota';
    final String columnKecamatan = 'kecamatan';
    final String columnKelurahan = 'kelurahan';
    final String columnKodepos = 'kodepos';
    final String columnRt = 'rt';
    final String columnRw = 'rw';
    final String columNamajalan = 'jalan';
    final String columnNotelp = 'notelp';
    final String columnStatus = 'status';
        
    DbHelper._internal();
    factory DbHelper() => _instance;
        
    //cek apakah database ada
    Future<Database?> get _db  async {
        if (_database != null) {
            return _database;
        }
        _database = await _initDb();
        return _database;
    }
        
    Future<Database?> _initDb() async {
        String databasePath = await getDatabasesPath();
        String path = join(databasePath, 'address.db');
        
        return await openDatabase(path, version: 2, onCreate: _onCreate);
    }
        
    //membuat tabel dan field-fieldnya
    Future<void> _onCreate(Database db, int version) async {
        var sql = "CREATE TABLE $tableName($columnId INTEGER PRIMARY KEY, "
            "$columnKategori TEXT,"
            "$columnNegara TEXT,"
            "$columnProvinsi TEXT,"
            "$columnKota TEXT,"
            "$columnKecamatan TEXT,"
            "$columnKelurahan TEXT,"
            "$columnKodepos TEXT,"
            "$columnRt TEXT,"
            "$columnRw TEXT,"
            "$columNamajalan TEXT,"
            "$columnNotelp TEXT,"
            "$columnStatus TEXT)";
             await db.execute(sql);
    }
        
    //insert ke database
    Future<int?> saveAddress(address) async {
        var dbClient = await _db;
        return await dbClient!.insert(tableName, address.toMap());
    }
        
    //read database
    Future<List?> getAllAddress() async {
        var dbClient = await _db;
        var result = await dbClient!.query(tableName, columns: [
            columnId,
            columnKategori,
            columnNegara,
            columnProvinsi,
            columnKota,
            columnKecamatan,
            columnKelurahan,
            columnKodepos,
            columnRt,
            columnRw,
            columNamajalan,
            columnNotelp,
            columnStatus,
        ]);
        
        return result.toList();
    }
        
    //update database
    Future<int?> updateAddress(address) async {
        var dbClient = await _db;
        return await dbClient!.update(tableName, address.toMap(), where: '$columnId = ?', whereArgs: [address.id]);
    }
        
    //hapus database
    Future<int?> deleteAddress(int id) async {
        var dbClient = await _db;
        return await dbClient!.delete(tableName, where: '$columnId = ?', whereArgs: [id]);
    }
}