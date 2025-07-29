import 'package:notepad/data/model/note.dart';
import 'package:notepad/data/services/database_service.dart';

class NotesRepository {
  final DatabaseService databaseService;
  const NotesRepository(this.databaseService);

  Future<void> addNote(Note note)async{
    try{
      // making sure we dont add note with same title
      List<Note>notes = await databaseService.getAllFromDatabase();
      if(notes.contains(note)){
        return;
      }
      await databaseService.addToDatabase(note);
    }catch(e){
      rethrow;
    }
  }

  Future<void> updateNote(Note newNote, int currentNoteID)async{
    try {
      Note? selectedNote = await databaseService.getFromDatabase(currentNoteID);
      // return if note not found in database
      if(selectedNote == null){
        return;
      }
      await databaseService.updateToDatabase(newNote,currentNoteID);
    } catch (e) {
      rethrow;
    }

  }

  Future<void> deleteNote(int id)async{
    try {
      Note? selectedNote = await databaseService.getFromDatabase(id);
      if(selectedNote == null){
        return;
      }
      await databaseService.deleteFromDatabase(id);
      
    } catch (e) {
      rethrow;
    }
  }

  Future<Note> getNote(int id)async{
    try {
      Note? selectedNote = await databaseService.getFromDatabase(id);
      if(selectedNote == null) {
        throw Error();
      }
      return selectedNote;
    } catch (e) {
      rethrow;
    }
  }

}