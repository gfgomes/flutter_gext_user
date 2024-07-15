class User {
  String uuid;
  String name;
  String email;
  int age;
  String gender;
  String country;
  String city;

  User({
    required this.uuid,
    required this.name,
    required this.email,
    required this.age,
    required this.gender,
    required this.country,
    required this.city,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        uuid: json['id'],
        name: json['name'],
        email: json['email'],
        age: json['age'],
        gender: json['gender'],
        country: json['country'],
        city: json['city'],
      );

  Map<String, dynamic> toJson() => {
        'id': uuid,
        'name': name,
        'email': email,
        'age': age,
        'gender': gender,
        'country': country,
        'city': city,
      };
}
