import 'package:notepad/data/model/note.dart';
import 'package:notepad/domain/repository/notes_repository.dart';

class AddnoteUsecase {
  const AddnoteUsecase(this._repository,this._note);
  final Note _note;
    final NotesRepository _repository;

  Future<void> use()async{
    return await _repository.addNote(_note);
  }

}
