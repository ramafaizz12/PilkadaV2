import 'package:json_annotation/json_annotation.dart';
part 'dataperolehansuara.g.dart';

@JsonSerializable()
class DataPerolehanSuara {
  int? id;
  String? jml_suara_sah;
  String? jml_suara_tidaksah;
  String? suara_kandidat;
  String? ket;
  String? Province_id;
  String? regency_id;
  String? district_id;
  String? tps_id;
  String? saksi_id;
  String? data_kecurangan;

  DataPerolehanSuara({
    this.id,
    this.jml_suara_sah,
    this.jml_suara_tidaksah,
    this.suara_kandidat,
    this.ket,
    this.data_kecurangan,
    this.tps_id,
    this.saksi_id,
    this.Province_id,
    this.regency_id,
    this.district_id,
  });

  factory DataPerolehanSuara.fromJson(Map<String, dynamic> data) =>
      _$DataPerolehanSuaraFromJson(data);

  Map<String, dynamic> toJson() => _$DataPerolehanSuaraToJson(this);
}
