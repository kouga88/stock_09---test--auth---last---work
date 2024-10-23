// ignore_for_file: file_names
// import 'package:json_annotation/json_annotation.dart';
// import 'group.dart';

// part 'user.g.dart'; // Обратите внимание на правильное имя файла

// @JsonSerializable()
// class User {
//   // Изменено название класса на Usere
//   final int id;
//   final dynamic organization;
//   final dynamic department;
//   final bool is_superuser;
//   final String username;
//   final String first_name;
//   final String last_name;
//   final bool is_staff;
//   final bool is_active;
//   final String? email;
//   final dynamic surname;
//   final dynamic telegram_id;
//   final List<Group> groups;

//   User({
//     required this.id,
//     required this.organization,
//     this.department,
//     required this.is_superuser,
//     required this.username,
//     required this.first_name,
//     required this.last_name,
//     required this.is_staff,
//     required this.is_active,
//     this.email,
//     this.surname,
//     this.telegram_id,
//     required this.groups,
//   });

//   // Метод для получения полного имени
//   String getFullName() {
//     return '$first_name $last_name${surname != null ? ' $surname' : ''}';
//   }

//   // Метод для десериализации из JSON
//   factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

//   // Метод для сериализации в JSON
//   Map<String, dynamic> toJson() => _$UserToJson(this);
// }




// // import 'package:json_annotation/json_annotation.dart';
// // import 'group.dart';

// // part 'user.g.dart'; // Обратите внимание на правильное имя файла

// // @JsonSerializable()
// // class User {
// //   // Изменено название класса на Usere
// //   final int id;
// //   final dynamic organization;
// //   final dynamic department;
// //   final bool is_superuser;
// //   final String username;
// //   final String first_name;
// //   final String last_name;
// //   final bool is_staff;
// //   final bool is_active;
// //   final String? email;
// //   final dynamic surname;
// //   final dynamic telegram_id;
// //   final List<Group> groups;

// //   User({
// //     required this.id,
// //     required this.organization,
// //     this.department,
// //     required this.is_superuser,
// //     required this.username,
// //     required this.first_name,
// //     required this.last_name,
// //     required this.is_staff,
// //     required this.is_active,
// //     this.email,
// //     this.surname,
// //     this.telegram_id,
// //     required this.groups,
// //   });

// //   // Метод для получения полного имени
// //   String getFullName() {
// //     return '$first_name $last_name${surname != null ? ' $surname' : ''}';
// //   }

// //   // Метод для десериализации из JSON
// //   factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

// //   // Метод для сериализации в JSON
// //   Map<String, dynamic> toJson() => _$UserToJson(this);
// // }
