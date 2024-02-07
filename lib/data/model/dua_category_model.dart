class DuaCategoryModel {
  int? id; // Add an ID for database primary key
  String name;

  DuaCategoryModel({
    this.id,
    required this.name,
  });

  // Named constructor for null initialization
  DuaCategoryModel.nullConstructor()
      : id = null,
        name = '';

  // Rest of your class code...

  // Convert a User Data Model to a Map
  Map<String, dynamic> toMap() {
    return {
      'book_id': name,

    };
  }

  // Create a User Data Model from a Map
  factory DuaCategoryModel.fromMap(Map<String, dynamic> map) {
    return DuaCategoryModel(
      id: map['id'],
      name: map['name'],
    );
  }

  @override
  String toString() {
    return 'DuaCategoryModel{id: $id, name: $name}';
  }
}
