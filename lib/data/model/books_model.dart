class BooksDataModel {
  int? id; // Add an ID for database primary key
  String title;
  String title_ar;
  int number_of_hadis;
  String abvr_code;
  String book_name;
  String book_descr;
  String color_code;

  BooksDataModel({
    this.id,
    required this.title,
    required this.title_ar,
    required this.number_of_hadis,
    required this.abvr_code,
    required this.book_name,
    required this.book_descr,
    required this.color_code
  });

  // Named constructor for null initialization
  BooksDataModel.nullConstructor()
      : id = null,
        title = '',
        title_ar = '',
        number_of_hadis = 1,
        abvr_code = '',
        book_name = '',
        book_descr = '',
        color_code = '';

  // Rest of your class code...

  // Convert a User Data Model to a Map
  Map<String, dynamic> toMap() {
    return {
      'visited_at': title,
      'is_synced': title_ar,
      'state_id': number_of_hadis,
      'region_id': abvr_code,
      'district_id': book_name,
      'village': book_descr,
      'dfa': color_code,
    };
  }

  // Create a User Data Model from a Map
  factory BooksDataModel.fromMap(Map<String, dynamic> map) {
    return BooksDataModel(
      id: map['id'],
      title: map['title'],
      title_ar: map['title_ar'],
      number_of_hadis: map['number_of_hadis'],
      abvr_code: map['abvr_code'],
      book_name: map['book_name'],
      book_descr: map['book_descr'],
      color_code: map['color_code'],
    );
  }

  @override
  String toString() {
    return 'BooksDataModel{id: $id, title: $title, title_ar: $title_ar, number_of_hadis: $number_of_hadis, abvr_code: $abvr_code, book_name: $book_name, book_descr: $book_descr, color_code: $color_code}';
  }
}
