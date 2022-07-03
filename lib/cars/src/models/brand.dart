// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Brand {
  String name;

  Brand({required this.name});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
    };
  }

  factory Brand.fromMap(Map<String, dynamic> map) {
    return Brand(
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Brand.fromJson(String source) => Brand.fromMap(json.decode(source) as Map<String, dynamic>);
}
