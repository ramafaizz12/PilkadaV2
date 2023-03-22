// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dataprofile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataProfile _$DataProfileFromJson(Map<String, dynamic> json) => DataProfile(
      name: json['name'] as String?,
      foto: json['foto'] as String?,
      role: json['role'] as String?,
      nik: json['nik'] as String?,
      alamat: json['alamat'] as String?,
      id: json['id'] as int?,
    )..asal = json['asal'] as String?;

Map<String, dynamic> _$DataProfileToJson(DataProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'foto': instance.foto,
      'role': instance.role,
      'nik': instance.nik,
      'alamat': instance.alamat,
      'asal': instance.asal,
    };
