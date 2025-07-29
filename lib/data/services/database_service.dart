import 'package:notepad/data/model/note.dart';

class DatabaseService {
  Future<void> addToDatabase()async{}
  Future<void> updateToDatabase(Note note)async{}
  Future<void> deleteFromDatabase(int id) async{}
  Future<Note?> getFromDatabase()async{}
}