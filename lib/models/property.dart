class Property {
  final String id;
  final String name;
  final String address;
  final String contact;
  final String state;
  final String? imageUrl;
  final String ownerId;
  final String description;

  Property({
    required this.id,
    required this.name,
    required this.address,
    required this.contact,
    required this.state,
    this.imageUrl,
    required this.ownerId,
    required this.description,
  });

  factory Property.fromMap(Map<String, dynamic> map, String id) => Property(
        id: id,
        name: map['name'],
        address: map['address'],
        contact: map['contact'],
        state: map['state'],
        imageUrl: map['imageUrl'],
        ownerId: map['ownerId'] ?? '',
        description: map['description'] ?? '',
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'address': address,
        'contact': contact,
        'state': state,
        'imageUrl': imageUrl,
        'ownerId': ownerId,
        'description': description,
      };
}
