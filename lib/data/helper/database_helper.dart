import 'dart:io';
import 'dart:typed_data';
import 'package:al_hadith/data/model/biography_model.dart';
import 'package:al_hadith/data/model/dua_model.dart';
import 'package:al_hadith/data/model/kalima_model.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/books_model.dart';
import '../model/chapter_model.dart';
import '../model/hadith_model.dart';
import '../model/section_model.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }


  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), 'hadith_data1.db');

    // Check if the database file already exists
    if (!await databaseExists(path)) {
      // Copy the database file from assets to the app's data directory
      ByteData data = await rootBundle.load(join('assets', 'hadith_bn_test.db'));
      List<int> bytes = data.buffer.asUint8List();
      await File(path).writeAsBytes(bytes, flush: true);
    }

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < newVersion) {
      await db.execute('DROP TABLE IF EXISTS user'); // Drop the existing table
      _onCreate(db, newVersion); // Recreate the table with new schema
    }
  }



  Future<void> _onCreate(Database db, int version) async {
    // Check if the tables already exist
    var booksTableExists = await db.rawQuery(
      "SELECT name FROM sqlite_master WHERE type='table' AND name='books'",
    );

    var chapterTableExists = await db.rawQuery(
      "SELECT name FROM sqlite_master WHERE type='table' AND name='chapter'",
    );

    var hadithTableExists = await db.rawQuery(
      "SELECT name FROM sqlite_master WHERE type='table' AND name='hadith'",
    );

    var sectionTableExists = await db.rawQuery(
      "SELECT name FROM sqlite_master WHERE type='table' AND name='section'",
    );

    var kalimaTableExists = await db.rawQuery(
      "SELECT name FROM sqlite_master WHERE type='table' AND name='kalima'",
    );

    var duaTableExists = await db.rawQuery(
      "SELECT name FROM sqlite_master WHERE type='table' AND name='dua'",
    );

    var biographyTableExists = await db.rawQuery(
      "SELECT name FROM sqlite_master WHERE type='table' AND name='biography'",
    );

    if (booksTableExists.isEmpty) {
      await db.execute('''
      CREATE TABLE books (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        title_ar TEXT,
        number_of_hadis INTEGER,
        abvr_code TEXT,
        book_name TEXT,
        book_descr TEXT,
        color_code TEXT
      )
    ''');
    }

    if (chapterTableExists.isEmpty) {
      await db.execute('''
      CREATE TABLE chapter (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        chapter_id INTEGER,
        book_id INTEGER,
        title TEXT,
        number INTEGER,
        hadis_range TEXT,
        book_name TEXT
      )
    ''');
    }

    if (hadithTableExists.isEmpty) {
      await db.execute('''
      CREATE TABLE hadith (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        book_id INTEGER,
        book_name TEXT,
        chapter_id INTEGER,
        section_id INTEGER,
        hadith_key TEXT,
        hadith_id INTEGER,
        narrator TEXT,
        bn TEXT,
        ar TEXT,
        ar_diacless TEXT,
        note TEXT,
        grade_id INTEGER,
        grade TEXT,
        grade_color TEXT
      )
    ''');
    }

    if (sectionTableExists.isEmpty) {
      await db.execute('''
      CREATE TABLE section (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        book_id INTEGER,
        book_name TEXT,
        chapter_id INTEGER,
        section_id INTEGER,
        title TEXT,
        preface TEXT,
        number INTEGER,
        sort_order INTEGER
      )
    ''');
    }

    if (kalimaTableExists.isEmpty) {
      await db.execute('''
      CREATE TABLE kalima (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        kalima_ar TEXT,
        kalima_bn TEXT
      )
    ''');
    }

    if (duaTableExists.isEmpty) {
      await db.execute('''
      CREATE TABLE dua (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        dua_ar TEXT,
        dua_bn TEXT
      )
    ''');
    }

    if (biographyTableExists.isEmpty) {
      await db.execute('''
      CREATE TABLE biography (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        lifetime TEXT,
        biography TEXT
      )
    ''');
    }
  }



  ///insert books data
  Future<void> insertBooksData(BooksDataModel booksDataModel) async {
    final db = await instance.database;
    await db.insert(
      'books',booksDataModel.toMap()
    );
  }

  ///insert chapter data
  Future<void> insertChapterData(ChapterDataModel chapterDataModel) async {
    final db = await instance.database;
    await db.insert(
        'chapter',chapterDataModel.toMap()
    );
  }

  ///insert hadith data
  Future<void> insertHadithData(HadithDataModel hadithDataModel) async {
    final db = await instance.database;
    await db.insert(
        'hadith',hadithDataModel.toMap()
    );
  }

  ///insert section data
  Future<void> insertSectionData(SectionDataModel sectionDataModel) async {
    final db = await instance.database;
    await db.insert(
        'section',sectionDataModel.toMap()
    );
  }

  ///insert kalima data
  Future<void> insertKalimaData(KalimaDataModel kalimaDataModel) async {
    final db = await instance.database;
    await db.insert(
        'kalima',kalimaDataModel.toMap()
    );
  }

  ///insert dua data
  Future<void> insertDuaData(DuaDataModel duaDataModel) async {
    final db = await instance.database;
    await db.insert(
        'dua',duaDataModel.toMap()
    );
  }

  ///insert biography data
  Future<void> insertBiographyData(BiographyDataModel biographyDataModel) async {
    final db = await instance.database;
    await db.insert(
        'biography',biographyDataModel.toMap()
    );
  }


  ///...............................................///


  ///getting books data
  Future<List<BooksDataModel>> getAllBooksData() async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query('books');

    return List.generate(maps.length, (i) {
      return BooksDataModel.fromMap(maps[i]);
    });
  }

  ///getting chapter data
  Future<List<ChapterDataModel>> getAllChapterData() async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query('chapter');

    return List.generate(maps.length, (i) {
      return ChapterDataModel.fromMap(maps[i]);
    });
  }

  ///getting hadith data
  Future<List<HadithDataModel>> getAllHadithData(int chapterId, int bookId) async {
    final db = await instance.database;

    // Use null-aware operators to handle potential null values
    final List<Map<String, dynamic>> maps = await db.query(
      'hadith',
      where: 'chapter_id = ? AND book_id = ?',
      whereArgs: [chapterId, bookId],
    );

    // Use null coalescing operator to handle potential null values
    return List.generate(maps.length, (i) {
      return HadithDataModel.fromMap(maps[i] ?? {});
    });
  }



  ///getting section data
  Future<List<SectionDataModel>> getAllSectionData() async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query('section');

    return List.generate(maps.length, (i) {
      return SectionDataModel.fromMap(maps[i]);
    });
  }

  ///getting kalima data
  Future<List<KalimaDataModel>> getAllKalimaData() async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query('kalima');

    return List.generate(maps.length, (i) {
      return KalimaDataModel.fromMap(maps[i]);
    });
  }

  ///getting dua data
  Future<List<DuaDataModel>> getAllDuaData() async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query('dua');

    return List.generate(maps.length, (i) {
      return DuaDataModel.fromMap(maps[i]);
    });
  }

  ///getting biography data
  Future<List<BiographyDataModel>> getAllBiographyData() async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query('biography');

    return List.generate(maps.length, (i) {
      return BiographyDataModel.fromMap(maps[i]);
    });
  }

}
