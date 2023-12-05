class DuaDataModel {
  int? id; // Add an ID for database primary key
  int? category_id;
  String name;
  String dua_ar;
  String dua_bn;
  String pronunciation;
  String fazilat;

  DuaDataModel({
    this.id,
    this.category_id,
    required this.name,
    required this.dua_ar,
    required this.dua_bn,
    required this.pronunciation,
    required this.fazilat,
  });

  // Named constructor for null initialization
  DuaDataModel.nullConstructor()
      : id = null,
        category_id = null,
        name = '',
        dua_ar = '',
        dua_bn = '',
        pronunciation = '',
        fazilat = '';

  // Rest of your class code...

  // Convert a User Data Model to a Map
  Map<String, dynamic> toMap() {
    return {
      'category_id': category_id,
      'book_id': name,
      'dua_ar': dua_ar,
      'dua_bn': dua_bn,
      'pronunciation': pronunciation,
      'fazilat': fazilat,

    };
  }

  // Create a User Data Model from a Map
  factory DuaDataModel.fromMap(Map<String, dynamic> map) {
    return DuaDataModel(
      id: map['id'],
      category_id: map['category_id'],
      name: map['name'],
      dua_ar: map['dua_ar'],
      dua_bn: map['dua_bn'],
      pronunciation: map['pronunciation'],
      fazilat: map['fazilat'],
    );
  }

  @override
  String toString() {
    return 'DuaDataModel{id: $id, category_id: $category_id, name: $name, dua_ar: $dua_ar, dua_bn: $dua_bn, pronunciation: $pronunciation, fazilat: $fazilat}';
  }
}
