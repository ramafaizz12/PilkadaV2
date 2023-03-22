// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dataperolehansuara.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataPerolehanSuara _$DataPerolehanSuaraFromJson(Map<String, dynamic> json) =>
    DataPerolehanSuara(
      id: json['id'] as int?,
      jml_suara_sah: json['jml_suara_sah'] as String?,
      jml_suara_tidaksah: json['jml_suara_tidaksah'] as String?,
      suara_kandidat: json['suara_kandidat'] as String?,
      ket: json['ket'] as String?,
      data_kecurangan: json['data_kecurangan'] as String?,
      tps_id: json['tps_id'] as String?,
      saksi_id: json['saksi_id'] as String?,
      Province_id: json['Province_id'] as String?,
      regency_id: json['regency_id'] as String?,
      district_id: json['district_id'] as String?,
    );

Map<String, dynamic> _$DataPerolehanSuaraToJson(DataPerolehanSuara instance) =>
    <String, dynamic>{
      'id': instance.id,
      'jml_suara_sah': instance.jml_suara_sah,
      'jml_suara_tidaksah': instance.jml_suara_tidaksah,
      'suara_kandidat': instance.suara_kandidat,
      'ket': instance.ket,
      'Province_id': instance.Province_id,
      'regency_id': instance.regency_id,
      'district_id': instance.district_id,
      'tps_id': instance.tps_id,
      'saksi_id': instance.saksi_id,
      'data_kecurangan': instance.data_kecurangan,
    };
