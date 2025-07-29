import 'package:notepad/data/model/note.dart';
import 'package:notepad/domain/repository/notes_repository.dart';

class GetnoteUsecase {
    final NotesRepository _notesRepository;
  final int id;
  const GetnoteUsecase(this._notesRepository,this.id);


  Future<Note> use()async{
    return await _notesRepository.getNote(id);
  }
}