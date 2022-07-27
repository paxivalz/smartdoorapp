import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:smartdoorapp/model/SaveData.dart';

class SavedataDB {
  //sembast to database

  String dbName;
  SavedataDB({this.dbName});

  //find path to local directory
  Future<Database> openDatabase() async {
    Directory appDirectory = await getApplicationDocumentsDirectory();
    String dbLocation = join(appDirectory.path, dbName);
    //return dbLocation;

    //create database with Factory
    DatabaseFactory dbFactory = databaseFactoryIo;
    Database db =
        await dbFactory.openDatabase(dbLocation); //open location directory
    return db;
  }

  //get save/add data
  Future<int> InsertData(Savedatas statement) async {
    //Store
    var db = await openDatabase();
    var store = intMapStoreFactory.store("expense");

    //save in .json file
    var keyID = store.add(db, {
      "title": statement.title,
      "button": statement.button,
      "date": statement.date.toIso8601String()
    });
    db.close();
    return keyID;
  }

  //read data to show
  Future<List<Savedatas>> loadAllData() async {
    var db = await openDatabase();
    var store = intMapStoreFactory.store("expense");
    var snapshot = await store.find(db,
        finder: Finder(sortOrders: [
          SortOrder(Field.key, false)
        ])); //show data from new to old
    List savedataList = <Savedatas>[];
    //list data to show
    for (var record in snapshot) {
      savedataList.add(Savedatas(
          title: record["title"],
          button: record["button"],
          date: DateTime.parse(record["date"])));
    }
    //print(snapshot);
    return savedataList;
  }
}
