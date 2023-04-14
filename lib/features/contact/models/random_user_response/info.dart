import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'info.g.dart';

@JsonSerializable()
class Info extends Equatable {
  final String? seed;
  final int? results;
  final int? page;
  final String? version;

  const Info({this.seed, this.results, this.page, this.version});

  factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);

  Map<String, dynamic> toJson() => _$InfoToJson(this);

  Info copyWith({
    String? seed,
    int? results,
    int? page,
    String? version,
  }) {
    return Info(
      seed: seed ?? this.seed,
      results: results ?? this.results,
      page: page ?? this.page,
      version: version ?? this.version,
    );
  }

  @override
  List<Object?> get props => [seed, results, page, version];
}
