class DuaDataModel {
  int? id; // Add an ID for database primary key
  String name;
  String dua_ar;
  String dua_bn;

  DuaDataModel({
    this.id,
    required this.name,
    required this.dua_ar,
    required this.dua_bn,
  });

  // Named constructor for null initialization
  DuaDataModel.nullConstructor()
      : id = null,
        name = '',
        dua_ar = '',
        dua_bn = '';

  // Rest of your class code...

  // Convert a User Data Model to a Map
  Map<String, dynamic> toMap() {
    return {
      'book_id': name,
      'dua_ar': dua_ar,
      'dua_bn': dua_bn,

    };
  }

  // Create a User Data Model from a Map
  factory DuaDataModel.fromMap(Map<String, dynamic> map) {
    return DuaDataModel(
      id: map['id'],
      name: map['name'],
      dua_ar: map['dua_ar'],
      dua_bn: map['dua_bn'],
    );
  }

  @override
  String toString() {
    return 'DuaDataModel{id: $id, name: $name, dua_ar: $dua_ar, dua_bn: $dua_bn}';
  }
}
