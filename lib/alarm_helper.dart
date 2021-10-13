import 'package:sqflite/sqflite.dart';
import 'package:weather_alarm_app/models/alarm_info.dart';
import 'data/data.dart';


final String tableName = 'alarm';
final String id = 'id';
final String title = 'title';
final String dateTime = 'dateTime';
final String color = 'gradientColorIndex';

class AlarmHelper{
  static Database? _database;
  static AlarmHelper? _alarmHelper;

  AlarmHelper._createInstance();
   factory AlarmHelper() {
    if (_alarmHelper == null){
      _alarmHelper = AlarmHelper._createInstance();
    }
    return _alarmHelper!;
  }

  Future<Database?> get database async{
    if (_database == null){
      _database = await initializeDatabase();
    }
    return _database!;
  }
  Future<Database> initializeDatabase() async{
    var dir = await getDatabasesPath();
    var path  = dir + "alarm.db";


    var database  = await openDatabase(path, version:  1, onCreate: (db, version){
      db.execute('''
      create table $tableName(
        $id integer primary key autoincrement,
        $title text not null,
        $dateTime text not null,
        $color integer
      )
      ''');
    }
    );

    return database;
  }


  void insetAlarm(AlarmInfo alarmInfo) async{
     var db = await this.database;
     var result  = await db?.insert(tableName, alarmInfo.toMap());
     print(result);
  }


  Future<List<AlarmInfo>> getAlarm() async{
    var result;
    var db = await this.database;

      result = await db?.query(tableName);

     result.forEach((element) { 
      var alarmInfo  = AlarmInfo.fromMap(element);
      alarms.add(alarmInfo);
      }
      );

      return alarms;
  }

}