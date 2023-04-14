import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dob.g.dart';

@JsonSerializable()
class Dob extends Equatable {
  final DateTime? date;
  final int? age;

  const Dob({this.date, this.age});

  factory Dob.fromJson(Map<String, dynamic> json) => _$DobFromJson(json);

  Map<String, dynamic> toJson() => _$DobToJson(this);

  Dob copyWith({
    DateTime? date,
    int? age,
  }) {
    return Dob(
      date: date ?? this.date,
      age: age ?? this.age,
    );
  }

  @override
  List<Object?> get props => [date, age];
}
