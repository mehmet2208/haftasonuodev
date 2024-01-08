import 'package:flutter/material.dart';

class Character with ChangeNotifier {
  String? id;
  String name;
  String gender;

  Character(this.name, this.gender);

  Character.fromMap(this.id, Map<String, dynamic> map)
      : name = map["name"],
        gender = map["gender"];

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "gender": gender,
    };
  }
}
