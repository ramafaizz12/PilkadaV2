import 'package:json_annotation/json_annotation.dart';
part 'Tps.g.dart';

@JsonSerializable()
class Datatps {
  int? id;
  String? Province_id;
  String? regency_id;
  String? district_id;
  String? tps;
  String? alamat;
  String? image;
  String? ket;

  Datatps(
      {this.id,
      this.Province_id,
      this.district_id,
      this.alamat,
      this.image,
      this.regency_id,
      this.ket,
      this.tps});

  factory Datatps.fromJson(Map<String, dynamic> data) =>
      _$DatatpsFromJson(data);

  Map<String, dynamic> toJson() => _$DatatpsToJson(this);
}
