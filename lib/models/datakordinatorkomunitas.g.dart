// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datakordinatorkomunitas.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataKordinatorKomunitas _$DataKordinatorKomunitasFromJson(
        Map<String, dynamic> json) =>
    DataKordinatorKomunitas(
      id: json['id'] as int?,
      nama_komunitas: json['nama_komunitas'] as String?,
      alamat_komunitas: json['alamat_komunitas'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$DataKordinatorKomunitasToJson(
        DataKordinatorKomunitas instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama_komunitas': instance.nama_komunitas,
      'alamat_komunitas': instance.alamat_komunitas,
      'email': instance.email,
    };
