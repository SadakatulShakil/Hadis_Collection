class SectionDataModel {
  int? id; // Add an ID for database primary key
  int book_id;
  String book_name;
  int chapter_id;
  int section_id;
  String title;
  String preface;
  int number;
  int sort_order;

  SectionDataModel({
    this.id,
    required this.book_id,
    required this.book_name,
    required this.chapter_id,
    required this.section_id,
    required this.title,
    required this.preface,
    required this.number,
    required this.sort_order,
  });

  // Named constructor for null initialization
  SectionDataModel.nullConstructor()
      : id = null,
        book_id = 1,
        book_name = '',
        chapter_id = 1,
        section_id = 1,
        title = '',
        preface = '',
        number = 1,
        sort_order = 1;

  // Rest of your class code...

  // Convert a User Data Model to a Map
  Map<String, dynamic> toMap() {
    return {
      'book_id': book_id,
      'book_name': book_name,
      'chapter_id': chapter_id,
      'section_id': section_id,
      'title': title,
      'preface': preface,
      'number': number,
      'sort_order': sort_order,
    };
  }

  // Create a User Data Model from a Map
  factory SectionDataModel.fromMap(Map<String, dynamic> map) {
    return SectionDataModel(
      id: map['id'],
      book_id: map['book_id'],
      book_name: map['book_name'],
      chapter_id: map['chapter_id'],
      section_id: map['section_id'],
      title: map['title'],
      preface: map['preface'],
      number: map['number'],
      sort_order: map['sort_order'],
    );
  }


}
