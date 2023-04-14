import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'coordinates.dart';
import 'street.dart';
import 'timezone.dart';

part 'location.g.dart';

@JsonSerializable()
class Location extends Equatable {
  final Street? street;
  final String? city;
  final String? state;
  final String? country;
  final String? postcode;
  final Coordinates? coordinates;
  final Timezone? timezone;

  const Location({
    this.street,
    this.city,
    this.state,
    this.country,
    this.postcode,
    this.coordinates,
    this.timezone,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return _$LocationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LocationToJson(this);

  Location copyWith({
    Street? street,
    String? city,
    String? state,
    String? country,
    String? postcode,
    Coordinates? coordinates,
    Timezone? timezone,
  }) {
    return Location(
      street: street ?? this.street,
      city: city ?? this.city,
      state: state ?? this.state,
      country: country ?? this.country,
      postcode: postcode ?? this.postcode,
      coordinates: coordinates ?? this.coordinates,
      timezone: timezone ?? this.timezone,
    );
  }

  @override
  List<Object?> get props {
    return [
      street,
      city,
      state,
      country,
      postcode,
      coordinates,
      timezone,
    ];
  }
}
