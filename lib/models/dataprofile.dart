import 'package:json_annotation/json_annotation.dart';
part 'dataprofile.g.dart';

@JsonSerializable()
class DataProfile {
  int? id;
  String? name;
  String? foto;
  String? role;
  String? nik;
  String? alamat;
  String? asal;

  DataProfile(
      {this.name, this.foto, this.role, this.nik, this.alamat, this.id});

  factory DataProfile.fromJson(Map<String, dynamic> data) =>
      _$DataProfileFromJson(data);

  Map<String, dynamic> toJson() => _$DataProfileToJson(this);
}
