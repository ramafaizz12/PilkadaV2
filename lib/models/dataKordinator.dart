import 'package:json_annotation/json_annotation.dart';
part 'dataKordinator.g.dart';

@JsonSerializable()
class DataKordinator {
  int? id;
  String? nama_lengkap;
  String? nik;
  String? tempat_lahir;
  String? tanggal_lahir;
  String? jkl;
  String? agama;
  String? kordinatorKomunitas_id;
  String? no_hp;
  String? foto;
  String? scan_ktp;
  String? Province_id;
  String? regency_id;
  String? district_id;

  DataKordinator({
    this.id,
    this.nama_lengkap,
    this.nik,
    this.kordinatorKomunitas_id,
    this.tempat_lahir,
    this.tanggal_lahir,
    this.jkl,
    this.agama,
    this.no_hp,
    this.foto,
    this.scan_ktp,
    this.Province_id,
    this.regency_id,
    this.district_id,
  });

  factory DataKordinator.fromJson(Map<String, dynamic> data) =>
      _$DataKordinatorFromJson(data);

  Map<String, dynamic> toJson() => _$DataKordinatorToJson(this);
}
