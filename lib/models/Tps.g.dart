// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Tps.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datatps _$DatatpsFromJson(Map<String, dynamic> json) => Datatps(
      id: json['id'] as int?,
      Province_id: json['Province_id'] as String?,
      district_id: json['district_id'] as String?,
      alamat: json['alamat'] as String?,
      image: json['image'] as String?,
      regency_id: json['regency_id'] as String?,
      ket: json['ket'] as String?,
      tps: json['tps'] as String?,
    );

Map<String, dynamic> _$DatatpsToJson(Datatps instance) => <String, dynamic>{
      'id': instance.id,
      'Province_id': instance.Province_id,
      'regency_id': instance.regency_id,
      'district_id': instance.district_id,
      'tps': instance.tps,
      'alamat': instance.alamat,
      'image': instance.image,
      'ket': instance.ket,
    };
