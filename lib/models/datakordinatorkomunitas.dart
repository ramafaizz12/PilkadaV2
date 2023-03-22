import 'package:json_annotation/json_annotation.dart';
part 'datakordinatorkomunitas.g.dart';

@JsonSerializable()
class DataKordinatorKomunitas {
  int? id;
  String? nama_komunitas;
  String? alamat_komunitas;
  String? email;

  DataKordinatorKomunitas({
    this.id,
    this.nama_komunitas,
    this.alamat_komunitas,
    this.email,
  });

  factory DataKordinatorKomunitas.fromJson(Map<String, dynamic> data) =>
      _$DataKordinatorKomunitasFromJson(data);

  Map<String, dynamic> toJson() => _$DataKordinatorKomunitasToJson(this);
}
