import 'dart:io';
import 'package:moniepoint_test/core/model/Items.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Database? db;

class DatabaseService {
  //Constant string declared
  static const itemTable = 'ProductModel';
  static const cart = 'cart';
  static const title = 'title';
  static const subtitle = 'subtitle';
  static const asset = 'asset';
  static const description = 'description';
  static const id = 'id';
  static const itemId = 'item_id';
  static const price = 'price';

  static Future<String> getDatabasePath(String dbName) async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, dbName);

    if (await Directory(dirname(path)).exists()) {
      //await deleteDatabase(path);
    } else {
      await Directory(dirname(path)).create(recursive: true);
    }
    return path;
  }

//Initialize the database
  static Future<void> initDatabase() async {
    final path = await getDatabasePath('ProductModel_db');
    db = await openDatabase(path,
        version: 2, onCreate: onCreate, onUpgrade: onUpgrade);
  }

//Create the database
  static Future<void> onCreate(Database db, int version) async {
    await createTables(db);
  }

//upgrade the database
  static onUpgrade(Database db, int oldVersion, int newVersion) {
    if (oldVersion < newVersion) {
      db.execute("ALTER TABLE foldersTable ADD COLUMN date TEXT;");
    }
  }

//Create tables to the database
  static Future<void> createTables(Database db) async {
    const favoriteTable = '''CREATE TABLE $itemTable(
      $id INTEGER PRIMARY KEY,
   $itemId TEXT,
   $title TEXT,
   $subtitle      TEXT,
   $asset   TEXT,
   $description      TEXT,
    $price      TEXT
    )''';

    const cartTable = '''CREATE TABLE $cart(
      $id INTEGER PRIMARY KEY,
   $itemId TEXT,
   $title TEXT,
   $subtitle      TEXT,
   $asset   TEXT,
   $description      TEXT,
    $price      TEXT
    )''';

    await db.execute(favoriteTable);
    await db.execute(cartTable);
  }

  //Insert favorite to the database
  static Future<int> insert(ProductModel ProductModel) async {
    int messageId = await db!.insert(
      itemTable,
      ProductModel.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return messageId;
  }

  //Insert employee to the database
  static Future<int> insertCart(ProductModel ProductModel) async {
    int messageId = await db!.insert(
      cart,
      ProductModel.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return messageId;
  }

  //Fetch the database
  //Future<List<ProductModel>> getItemList() async {
  getList() async {
    var result = await db!.query(itemTable, orderBy: '$id ASC');
    List<ProductModel> favList = [];
    if (result.isNotEmpty) {
      for (int i = 0; i < result.length; i++) {
        favList.add(ProductModel.fromJson(result[i]));
      }
      return favList;
    }

    return favList;
  }

  getCartList() async {
    var result = await db!.query(cart, orderBy: '$id ASC');
    List<ProductModel> cartList = [];
    if (result.isNotEmpty) {
      for (int i = 0; i < result.length; i++) {
        cartList.add(ProductModel.fromJson(result[i]));
      }
      return cartList;
    }

    return cartList;
  }

//Update the database
  Future<int> update(ProductModel ProductModel) async {
    var result = await db!.update(itemTable, ProductModel.toJson(),
        where: '$itemId= ?', whereArgs: [ProductModel.itemId]);
    return result;
  }

  //Delete Operation: Delete an Item object from database
  Future<int> delete(ProductModel ProductModel) async {
    int result = await db!
        .delete(itemTable, where: '$itemId = ?', whereArgs: [ProductModel.itemId]);
    return result;
  }

  Future<int> deleteCart(ProductModel ProductModel) async {
    int result =
        await db!.delete(cart, where: '$itemId = ?', whereArgs: [ProductModel.itemId]);
    return result;
  }
}
