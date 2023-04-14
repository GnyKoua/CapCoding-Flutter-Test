import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'street.g.dart';

@JsonSerializable()
class Street extends Equatable {
  final int? number;
  final String? name;

  const Street({this.number, this.name});

  factory Street.fromJson(Map<String, dynamic> json) {
    return _$StreetFromJson(json);
  }

  Map<String, dynamic> toJson() => _$StreetToJson(this);

  Street copyWith({
    int? number,
    String? name,
  }) {
    return Street(
      number: number ?? this.number,
      name: name ?? this.name,
    );
  }

  @override
  List<Object?> get props => [number, name];
}
