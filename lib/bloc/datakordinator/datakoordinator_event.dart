part of 'datakoordinator_bloc.dart';

@immutable
abstract class DatakoordinatorEvent {}

class DataKoordinatorConnect extends DatakoordinatorEvent {
  String page;

  DataKoordinatorConnect({this.page = ''});
}

class TambahDataKoordinator extends DatakoordinatorEvent {
  String? nama;
  String? nik;
  String? tempat_lahir;
  String? tanggal_lahir;
  String? jkl;
  String? agama;
  File? scan_ktp;
  String? no_hp;

  File? foto;

  String? Province_id;
  String? regency_id;

  TambahDataKoordinator(
      {this.nama,
      this.nik,
      this.tempat_lahir,
      this.tanggal_lahir,
      this.jkl,
      this.agama,
      this.no_hp,
      this.foto,
      this.Province_id,
      this.regency_id,
      this.scan_ktp});
}

class DataKoordinatorConnectKomunitas extends DatakoordinatorEvent {}
