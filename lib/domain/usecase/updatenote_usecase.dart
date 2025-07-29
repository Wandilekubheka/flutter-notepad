import 'package:notepad/data/model/note.dart';
import 'package:notepad/domain/repository/notes_repository.dart';

class UpdatenoteUsecase {
  final int _id;
  final Note _note;
  final NotesRepository _notesRepository;
  const UpdatenoteUsecase(this._id,this._note,this._notesRepository);

  Future<void> use()async{
    await _notesRepository.updateNote(_note, _id);
  }
}