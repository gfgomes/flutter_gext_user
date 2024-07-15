class User {
  int? id;
  String uuid;
  String name;
  String email;
  int age;
  String gender;
  String country;
  String city;

  User({
    required this.id,
    required this.uuid,
    required this.name,
    required this.email,
    required this.age,
    required this.gender,
    required this.country,
    required this.city,
  });

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json['id'],
        uuid: json['uuid']??'',
        name: json['name'],
        email: json['email'],
        age: json['age'],
        gender: json['gender'],
        country: json['country'],
        city: json['city'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'uuid': uuid,
        'name': name,
        'email': email,
        'age': age,
        'gender': gender,
        'country': country,
        'city': city,
      };
}
