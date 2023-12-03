class ChapterDataModel {
  int? id; // Add an ID for database primary key
  int chapter_id;
  int book_id;
  String title;
  int number;
  String hadis_range;
  String book_name;

  ChapterDataModel({
    this.id,
    required this.chapter_id,
    required this.book_id,
    required this.title,
    required this.number,
    required this.hadis_range,
    required this.book_name
  });

  // Named constructor for null initialization
  ChapterDataModel.nullConstructor()
      : id = null,
        chapter_id = 1,
        book_id = 1,
        title = '',
        number = 1,
        hadis_range = '',
        book_name = '';

  // Rest of your class code...

  // Convert a User Data Model to a Map
  Map<String, dynamic> toMap() {
    return {
      'chapter_id': chapter_id,
      'book_id': book_id,
      'title': title,
      'number': number,
      'hadis_range': hadis_range,
      'book_name': book_name,
    };
  }

  // Create a User Data Model from a Map
  factory ChapterDataModel.fromMap(Map<String, dynamic> map) {
    return ChapterDataModel(
      id: map['id'],
      chapter_id: map['chapter_id'],
      book_id: map['book_id'],
      title: map['title'],
      number: map['number'],
      hadis_range: map['hadis_range'],
      book_name: map['book_name'],
    );
  }

  @override
  String toString() {
    return 'ChapterDataModel{id: $id, chapter_id: $chapter_id, book_id: $book_id, title: $title, number: $number, hadis_range: $hadis_range, book_name: $book_name}';
  }
}
