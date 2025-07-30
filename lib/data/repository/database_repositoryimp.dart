import 'package:notepad/data/database/database.dart';
import 'package:notepad/data/model/note.dart';
import 'package:notepad/data/repository/database_repository.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseRepositoryimp extends DatabaseRepository {
  final Database _database;
  DatabaseRepositoryimp(this._database);
  @override
  Future<void> addToDatabase(Note note) async {
    try {
      int status = await _database.insert(
        LocalDatabase.tableName,
        note.toMap(),
      );
      if (status == 0) {
        throw Exception("unknown error occur");
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteFromDatabase(int id) {
    // TODO: implement deleteFromDatabase
    throw UnimplementedError();
  }

  @override
  Future<Note> getNote(int noteToUpdateID) {
    // TODO: implement getNote
    throw UnimplementedError();
  }

  @override
  Future<void> updateNote(Note newNote, int noteToUpdateID) {
    // TODO: implement updateNote
    throw UnimplementedError();
  }
}
