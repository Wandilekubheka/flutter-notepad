import 'package:flutter/material.dart';
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
  Future<void> deleteFromDatabase(int id) async {
    try {
      int status = await _database.delete(
        LocalDatabase.tableName,
        where: 'id = ?',
        whereArgs: [id],
      );
      if (status == 0) {
        throw Exception("unknown error occur");
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Note> getNote(int noteToUpdateID) async {
    try {
      var status = await _database.query(
        LocalDatabase.tableName,
        where: 'id = ?',
        whereArgs: [noteToUpdateID],
      );
      // since ID is unique it should return only 1 item so we extract the first 1
      return Note.fromMap(status[0] as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateNote(Note newNote, int noteToUpdateID) async {
    try {
      int status = await _database.update(
        LocalDatabase.tableName,
        newNote.toMap(),
        where: 'id = ?',
        whereArgs: [noteToUpdateID],
      );
      if (status == 0) {
        throw Exception("unknown error occur");
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Note>> getNotes() async {
    try {
      List<Note> notes = [];
      var status = await _database.query(LocalDatabase.tableName);
      for (var element in status) {
        notes.add(Note.fromMap(element as Map<String, dynamic>));
      }
      return notes;
    } catch (e) {
      rethrow;
    }
  }
}
