// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dataKordinator.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataKordinator _$DataKordinatorFromJson(Map<String, dynamic> json) =>
    DataKordinator(
      id: json['id'] as int?,
      nama_lengkap: json['nama_lengkap'] as String?,
      nik: json['nik'] as String?,
      kordinatorKomunitas_id: json['kordinatorKomunitas_id'] as String?,
      tempat_lahir: json['tempat_lahir'] as String?,
      tanggal_lahir: json['tanggal_lahir'] as String?,
      jkl: json['jkl'] as String?,
      agama: json['agama'] as String?,
      no_hp: json['no_hp'] as String?,
      foto: json['foto'] as String?,
      scan_ktp: json['scan_ktp'] as String?,
      Province_id: json['Province_id'] as String?,
      regency_id: json['regency_id'] as String?,
      district_id: json['district_id'] as String?,
    );

Map<String, dynamic> _$DataKordinatorToJson(DataKordinator instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama_lengkap': instance.nama_lengkap,
      'nik': instance.nik,
      'tempat_lahir': instance.tempat_lahir,
      'tanggal_lahir': instance.tanggal_lahir,
      'jkl': instance.jkl,
      'agama': instance.agama,
      'kordinatorKomunitas_id': instance.kordinatorKomunitas_id,
      'no_hp': instance.no_hp,
      'foto': instance.foto,
      'scan_ktp': instance.scan_ktp,
      'Province_id': instance.Province_id,
      'regency_id': instance.regency_id,
      'district_id': instance.district_id,
    };
