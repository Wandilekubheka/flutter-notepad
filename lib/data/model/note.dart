class Note {
  final String title;
  String? description;
  final int id;
  Note({required this.title, this.description, required this.id});

  @override
  bool operator ==(Object other) {
    Note othernote = other as Note;
    return id == othernote.id;
  }

  bool isSameTitle(String title) {
    return this.title == title;
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title, 'description': description};
  }

  factory Note.fromMap(Map<String, dynamic> noteMap) {
    return Note(
      title: noteMap['title'],
      id: noteMap['id'],
      description: noteMap['description'],
    );
  }
}
