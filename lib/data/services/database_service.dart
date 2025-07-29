import 'package:notepad/data/model/note.dart';

class DatabaseService {
  Future<void> addToDatabase(Note note)async{}
  Future<void> updateToDatabase(Note note,int id)async{}
  Future<void> deleteFromDatabase(int id) async{}
  Future<Note?> getFromDatabase(int id)async{}
  Future<List<Note>> getAllFromDatabase()async{
    // temp db state is empty list
    return List.empty();
  }
}