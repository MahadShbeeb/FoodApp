// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:path/path.dart' as path;
// import 'package:sqflite/sqflite.dart ' as sqlite;
// import 'package:sqflite/sqflite.dart';
//
// class DB {
//   static Future<Database> database() async {
//     final dbpath = await sqlite.getDatabasesPath();
//     return sqlite.openDatabase(path.join(dbpath, 'foods.db'),
//         onCreate: (db, version) {
//       return db.execute('CREAT TABLE foods(id TEXT PRIMARY KEY,title TEXT,'
//           'description TEXT,imageURL TEXT,category TEXT,price DOUBLE,isFavourite BOOLEAN)');
//     }, version: 1);
//   }
//
//   static Future<void> indertDB(String table, Map<String, Object> data) async {
//     final db = await DB.database();
//     db.insert(table, data, conflictAlgorithm: ConflictAlgorithm.replace);
//   }
//
//   static Future<List<Map<String, dynamic>>> getData(String table) async {
//     final db = await DB.database();
//     return db.query(table);
//   }
// }
