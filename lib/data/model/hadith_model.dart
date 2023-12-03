class HadithDataModel {
  int? id; // Add an ID for database primary key
  int book_id;
  String book_name;
  int chapter_id;
  int section_id;
  String hadith_key;
  int hadith_id;
  String narrator;
  String bn;
  String ar;
  String ar_diacless;
  String note;
  int grade_id;
  String grade;
  String grade_color;

  HadithDataModel({
    this.id,
    required this.book_id,
    required this.book_name,
    required this.chapter_id,
    required this.section_id,
    required this.hadith_key,
    required this.hadith_id,
    required this.narrator,
    required this.bn,
    required this.ar,
    required this.ar_diacless,
    required this.note,
    required this.grade_id,
    required this.grade,
    required this.grade_color
  });

  // Named constructor for null initialization
  HadithDataModel.nullConstructor()
      : id = null,
        book_id = 1,
        book_name = '',
        chapter_id = 1,
        section_id = 1,
        hadith_key = '',
        hadith_id = 1,
        narrator = '',
        bn = '',
        ar = '',
        ar_diacless = '',
        note = '',
        grade_id = 1,
        grade = '',
        grade_color = '';

  // Convert a User Data Model to a Map
  Map<String, dynamic> toMap() {
    return {
      'book_id': book_id,
      'book_name': book_name,
      'chapter_id': chapter_id,
      'section_id': section_id,
      'hadith_key': hadith_key,
      'hadith_id': hadith_id,
      'narrator': narrator,
      'bn': bn,
      'ar': ar,
      'ar_diacless': ar_diacless,
      'note': note,
      'grade_id': grade_id,
      'grade': grade,
      'grade_color': grade_color,
    };
  }

  // Create a User Data Model from a Map
  factory HadithDataModel.fromMap(Map<String, dynamic> map) {
    return HadithDataModel(
      id: map['id'],
      book_id: map['book_id'],
      book_name: map['book_name'],
      chapter_id: map['chapter_id'],
      section_id: map['section_id'],
      hadith_key: map['hadith_key'],
      hadith_id: map['hadith_id'] as int? ?? 0,
      narrator: map['narrator'] as String? ?? '',
      bn: map['bn'],
      ar: map['ar'],
      ar_diacless: map['ar_diacless'],
      note: map['note'],
      grade_id: map['grade_id'],
      grade: map['grade'],
      grade_color: map['grade_color'],
    );
  }

  @override
  String toString() {
    return 'HadithDataModel{id: $id, book_id: $book_id, book_name: $book_name, chapter_id: $chapter_id, section_id: $section_id, hadith_key: $hadith_key, hadith_id: $hadith_id, narrator: $narrator, bn: $bn, ar: $ar, ar_diacless: $ar_diacless, note: $note, grade_id: $grade_id, grade: $grade, grade_color: $grade_color}';
  }
}
