import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'registered.g.dart';

@JsonSerializable()
class Registered extends Equatable {
  final DateTime? date;
  final int? age;

  const Registered({this.date, this.age});

  factory Registered.fromJson(Map<String, dynamic> json) {
    return _$RegisteredFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RegisteredToJson(this);

  Registered copyWith({
    DateTime? date,
    int? age,
  }) {
    return Registered(
      date: date ?? this.date,
      age: age ?? this.age,
    );
  }

  @override
  List<Object?> get props => [date, age];
}
