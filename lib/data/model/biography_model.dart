class BiographyDataModel {
  int? id; // Add an ID for database primary key
  String name;
  String lifetime;
  String biography;

  BiographyDataModel({
    this.id,
    required this.name,
    required this.lifetime,
    required this.biography,
  });

  // Named constructor for null initialization
  BiographyDataModel.nullConstructor()
      : id = null,
        name = '',
        lifetime = '',
        biography = '';

  // Rest of your class code...

  // Convert a User Data Model to a Map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'lifetime': lifetime,
      'biography': biography,

    };
  }

  // Create a User Data Model from a Map
  factory BiographyDataModel.fromMap(Map<String, dynamic> map) {
    return BiographyDataModel(
      id: map['id'],
      name: map['name'],
      lifetime: map['lifetime'],
      biography: map['biography'],
    );
  }

  @override
  String toString() {
    return 'BiographyDataModel{id: $id, name: $name, lifetime: $lifetime, biography: $biography}';
  }
}
