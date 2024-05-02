import 'dart:convert';

import 'package:flutter/widgets.dart';

class FeriadoModel {
  final String? date;
  final String? name;
  final String? type;
  FeriadoModel({
    required this.date,
    required this.name,
    required this.type,
  });

  FeriadoModel copyWith({
    ValueGetter<String?>? date,
    ValueGetter<String?>? name,
    ValueGetter<String?>? type,
  }) {
    return FeriadoModel(
      date: date != null ? date() : this.date,
      name: name != null ? name() : this.name,
      type: type != null ? type() : this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'name': name,
      'type': type,
    };
  }

  factory FeriadoModel.fromMap(Map<String, dynamic> map) {
    return FeriadoModel(
      date: map['date'],
      name: map['name'],
      type: map['type'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FeriadoModel.fromJson(String source) =>
      FeriadoModel.fromMap(json.decode(source));

  @override
  String toString() => 'FeriadoModel(date: $date, name: $name, type: $type)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FeriadoModel &&
        other.date == date &&
        other.name == name &&
        other.type == type;
  }

  @override
  int get hashCode => date.hashCode ^ name.hashCode ^ type.hashCode;
}
