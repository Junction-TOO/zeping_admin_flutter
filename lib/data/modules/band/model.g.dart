// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Band _$BandFromJson(Map<String, dynamic> json) => Band(
      bandId: json['bandId'] as String,
      url: json['url'] as String?,
      userName: json['userName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
    );

Map<String, dynamic> _$BandToJson(Band instance) => <String, dynamic>{
      'bandId': instance.bandId,
      'url': instance.url,
      'userName': instance.userName,
      'phoneNumber': instance.phoneNumber,
    };
