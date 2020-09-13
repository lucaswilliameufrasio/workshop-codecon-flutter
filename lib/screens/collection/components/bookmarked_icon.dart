import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:workshopcodeconflutter/repositories/car_repository.dart';

class BookmarkIcon extends StatefulWidget {
  List<int> inCollection;
  int carId;

  BookmarkIcon({Key key, this.inCollection, this.carId}) : super(key: key);

  @override
  _BookmarkIconState createState() => _BookmarkIconState();
}

class _BookmarkIconState extends State<BookmarkIcon> {
  final carRepository = CarRepository();

  Database database;

  void loadDB() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'workshop_codecon.db');

    database = await openDatabase(path, version: 2,
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE cars (id INTEGER)');
    });

    loadCars();
  }

  void addCar(int id) async {
    await database.insert("cars", {'id': id});
  }

  void removeCar(int id) async {
    await database.delete("cars", where: 'id = ?', whereArgs: [id]);
  }

  void loadCars() async {
    List<Map<String, dynamic>> r =
        await database.rawQuery("select * from cars");

    r.forEach((item) {
      widget.inCollection.add(item['id']);
    });

    setState(() {
      widget.inCollection = widget.inCollection;
    });
  }

  @override
  void initState() {
    loadDB();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(widget.inCollection.contains(widget.carId)
          ? Icons.bookmark
          : Icons.bookmark_border),
      onPressed: () {
        if (widget.inCollection.contains(widget.carId)) {
          widget.inCollection.remove(widget.carId);
          removeCar(widget.carId);
        } else {
          widget.inCollection.add(widget.carId);
          addCar(widget.carId);
        }

        setState(() {
          widget.inCollection = widget.inCollection;
        });
      },
    );
  }
}
