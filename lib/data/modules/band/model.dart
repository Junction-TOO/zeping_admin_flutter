import 'package:json_annotation/json_annotation.dart';
part 'model.g.dart';

// g.dart 파일 생성 : flutter pub run build_runner build --delete-conflicting-outputs

@JsonSerializable()
class Band {
  String bandId;
  String? url;
  String? userName;
  String? phoneNumber;

  Band({
    required this.bandId,
    this.url,
    this.userName,
    this.phoneNumber,
  });

  factory Band.fromJson(Map<String, dynamic> json) => _$BandFromJson(json);
  Map<String, dynamic> toJson() => _$BandToJson(this);
}
