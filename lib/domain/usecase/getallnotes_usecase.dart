import 'package:notepad/data/model/note.dart';
import 'package:notepad/domain/repository/notes_repository.dart';

class GetallnotesUsecase {
  const GetallnotesUsecase(this._repository);
  final NotesRepository _repository;

  Future<List<Note>> use()async{
    return await _repository.getNotes();
  }

  
}