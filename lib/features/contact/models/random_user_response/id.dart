import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'id.g.dart';

@JsonSerializable()
class Id extends Equatable {
  final String? name;
  final String? value;

  const Id({this.name, this.value});

  factory Id.fromJson(Map<String, dynamic> json) => _$IdFromJson(json);

  Map<String, dynamic> toJson() => _$IdToJson(this);

  Id copyWith({
    String? name,
    String? value,
  }) {
    return Id(
      name: name ?? this.name,
      value: value ?? this.value,
    );
  }

  @override
  List<Object?> get props => [name, value];
}
