import 'dart:convert';

class User {
  final String email;
  final String firstName;
  final String lastName;
  final int age;
  final int id;
  final String gender;

  User({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.id,
    required this.gender,
  });

  User copyWith({
    String? email,
    String? firstName,
    String? lastName,
    int? age,
    int? id,
    String? gender,
  }) {
    return User(
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      age: age ?? this.age,
      id: id ?? this.id,
      gender: gender ?? this.gender,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'email': email});
    result.addAll({'firstName': firstName});
    result.addAll({'lastName': lastName});
    result.addAll({'age': age});
    result.addAll({'id': id});
    result.addAll({'gender': gender});

    return result;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      email: map['email'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      age: map['age']?.toInt() ?? 0,
      id: map['id']?.toInt() ?? 0,
      gender: map['gender'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(email: $email, firstName: $firstName, lastName: $lastName, age: $age, id: $id, gender: $gender)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.email == email &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.age == age &&
        other.id == id &&
        other.gender == gender;
  }

  @override
  int get hashCode {
    return email.hashCode ^
    firstName.hashCode ^
    lastName.hashCode ^
    age.hashCode ^
    id.hashCode ^
    gender.hashCode;
  }
}