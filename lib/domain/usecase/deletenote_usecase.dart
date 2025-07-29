import 'package:notepad/domain/repository/notes_repository.dart';

class DeletenoteUsecase {
  final NotesRepository _notesRepository;
  final int id;
  const DeletenoteUsecase(this._notesRepository,this.id);


  Future<void> use()async{
    await _notesRepository.deleteNote(id);
  }
}