import 'package:notepad/data/database/database.dart';
import 'package:notepad/data/model/note.dart';

abstract class DatabaseRepository {
  Future<void> addToDatabase(Note note);
  Future<void> deleteFromDatabase(int id);
  Future<void> updateNote(Note newNote, int noteToUpdateID);
  Future<Note> getNote(int noteToUpdateID);
}
