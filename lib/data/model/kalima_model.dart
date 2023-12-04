class KalimaDataModel {
  int? id; // Add an ID for database primary key
  String name;
  String kalima_ar;
  String kalima_bn;

  KalimaDataModel({
    this.id,
    required this.name,
    required this.kalima_ar,
    required this.kalima_bn,
  });

  // Named constructor for null initialization
  KalimaDataModel.nullConstructor()
      : id = null,
        name = '',
        kalima_ar = '',
        kalima_bn = '';

  // Rest of your class code...

  // Convert a User Data Model to a Map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'kalima_ar': kalima_ar,
      'kalima_bn': kalima_bn,

    };
  }

  // Create a User Data Model from a Map
  factory KalimaDataModel.fromMap(Map<String, dynamic> map) {
    return KalimaDataModel(
      id: map['id'],
      name: map['name'],
      kalima_ar: map['kalima_ar'],
      kalima_bn: map['kalima_bn'],
    );
  }

  @override
  String toString() {
    return 'KalimaDataModel{id: $id, name: $name, kalima_ar: $kalima_ar, kalima_bn: $kalima_bn}';
  }
}
