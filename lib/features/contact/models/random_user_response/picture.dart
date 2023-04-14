import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'picture.g.dart';

@JsonSerializable()
class Picture extends Equatable {
  final String? large;
  final String? medium;
  final String? thumbnail;

  const Picture({this.large, this.medium, this.thumbnail});

  factory Picture.fromJson(Map<String, dynamic> json) {
    return _$PictureFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PictureToJson(this);

  Picture copyWith({
    String? large,
    String? medium,
    String? thumbnail,
  }) {
    return Picture(
      large: large ?? this.large,
      medium: medium ?? this.medium,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }

  @override
  List<Object?> get props => [large, medium, thumbnail];
}
