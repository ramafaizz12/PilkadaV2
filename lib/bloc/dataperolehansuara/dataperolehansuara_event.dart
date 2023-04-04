part of 'dataperolehansuara_bloc.dart';

@immutable
abstract class DataperolehansuaraEvent {}

class DataPerolehanSuaraConnect extends DataperolehansuaraEvent {
  String page;

  DataPerolehanSuaraConnect({this.page = ''});
}

class DataPerolehanSuaraCari extends DataperolehansuaraEvent {
  String? value;

  DataPerolehanSuaraCari({this.value});
}

class DataPerolehanSuaraCreate extends DataperolehansuaraEvent {
  String? jml_suara_sah;
  String? jml_suara_tidaksah;
  String? suara_kandidat;
  String? ket;
  String? Province_id;
  String? regency_id;
  String? district_id;
  String? tps_id;
  File? formulir_c1;

  String? data_kecurangan;
  DataPerolehanSuaraCreate(
      {this.jml_suara_sah,
      this.jml_suara_tidaksah,
      this.suara_kandidat,
      this.ket,
      this.Province_id,
      this.regency_id,
      this.district_id,
      this.tps_id,
      this.formulir_c1,
      this.data_kecurangan});
}
