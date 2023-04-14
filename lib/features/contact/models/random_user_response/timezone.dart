import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'timezone.g.dart';

@JsonSerializable()
class Timezone extends Equatable {
  final String? offset;
  final String? description;

  const Timezone({this.offset, this.description});

  factory Timezone.fromJson(Map<String, dynamic> json) {
    return _$TimezoneFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TimezoneToJson(this);

  Timezone copyWith({
    String? offset,
    String? description,
  }) {
    return Timezone(
      offset: offset ?? this.offset,
      description: description ?? this.description,
    );
  }

  @override
  List<Object?> get props => [offset, description];
}
